//
//  DNIeService.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 24/9/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import CoreNFC

protocol DNIeServiceProtocol {
    func initializeDNIeConnection()
    func getDNIe(completion: DNIeResult)
}

class DNIeService: DNIeServiceProtocol, IOSNFCSessionDelegate {
    private var swiftDNIeWrapper: SwiftDNIeWrapper?
    private var newDnieWrapper: EsGobJmulticardIosDnieWrapper?
    private var nfcSessionManager: IOSNFCSessionManager?
    private var apduConnection: IOSApduConnection?
    private var callbackHandler: IOSCallbackHandler?
    private var dataToSign: Data?
    private var algoritm: String?

    init(can: String, pin: String, dataToSign: Data?, algorithm: String) {
	   callbackHandler = IOSCallbackHandler(can: can, pin: pin)
	   self.dataToSign = dataToSign
	   self.algoritm = algorithm
	   self.nfcSessionManager = IOSNFCSessionManager()
    }
    
    func initializeDNIeConnection() {
	   nfcSessionManager?.delegate = self
	   nfcSessionManager?.beginSession()
    }
    
    func didDetectNFC(tag: NFCISO7816Tag) {
	   print("NFC Tag detected, creating APDU connection.")
	   self.apduConnection = IOSApduConnection(
		  tag: tag,
		  nfcSession: nfcSessionManager
	   )

	   /*self.swiftDNIeWrapper = SwiftDNIeWrapper(
		  connection: apduConnection!,
		  callbackHandler: callbackHandler!
	   )*/
	   
	   Task {
		  //let dnie = getDNIe()
		  
		  //let wrapper = self.getWrapperDNIe()
		  
		  if let dnieNFC = self.getDNIeNFC(),
			let algoritm = algoritm {
			 self.signData(dnieNFC: dnieNFC, algorithm: algoritm) { result in
				switch result {
				    case .success(let (pkcs1Signature, certString)):
					   NotificationCenter.default.post(
						  name: NSNotification.Name("PKCS1SignatureNotification"),
						  object: nil,
						  userInfo: [
							 "pkcs1Signature": pkcs1Signature,
							 "certString": certString
						  ]
					   )
				
				case .failure(let error):
				    print("Error signing data: \(error.localizedDescription)")
				}
			 }
		  }
	   }
    }
    
    func getWrapperDNIe() -> EsGobJmulticardIosDnieWrapper? {
	   //return try? swiftDNIeWrapper!.getWrapperDNIe()
	   return nil
    }
    
    func getDNIeNFC() -> EsGobJmulticardCardDnieDnieNfc? {
	   //return try? swiftDNIeWrapper!.getDNIeNFC()
	   return nil
    }
    
    func getDNIe(completion: DNIeResult) {
	  swiftDNIeWrapper?.getDNIe(completion: completion)
    }
    
    func getDNIeCertificate(factory: EsGobJmulticardCardDnieDnieNfc) -> String? {
	   let j509cert = factory.getCertificateWith("CertFirmaDigital")
	   let certBase64 = EsGobAfirmaCoreMiscBase64_encodeWithByteArray_withBoolean_(j509cert?.getEncoded(), true)
	   return certBase64
    }
    
    func signPKCS1WithDnie(factory: EsGobJmulticardCardDnieDnieNfc, data: Data, algorithm: String) -> (Data?, String?) {
	   let dataByte = IOSByteArray(nsData: data)
	   let j509cert = factory.getCertificateWith("CertFirmaDigital")
	   let certString = EsGobAfirmaCoreMiscBase64_encodeWithByteArray_withBoolean_(j509cert?.getEncoded(), true)
	   let pkcs1 = DNIeSigner.signData(
		  dataByte,
		  usingFactory: factory,
		  withPrivateKey: factory.getPrivateKey(with: "CertFirmaDigital"),
		  algorithm: algorithm
	   ).toNSData()
	   
	   return (pkcs1, certString)
    }
    
    func didBecomeActive() {
	   print("NFC session is active.")
    }
    
    func didInvalidateNFCSession(with error: Error) {
	   print("NFC session invalidated with error: \(error.localizedDescription)")
    }
    
    enum SigningError: Error {
	   case missingSignature
	   case missingCertificate
    }

    func signData(dnieNFC: EsGobJmulticardCardDnieDnieNfc,algorithm: String, completion: @escaping (Result<(Data, String), Error>) -> Void) {
	   print("Certificado codificado en base 64 del DNIe: " + (getDNIeCertificate(factory: dnieNFC) ?? ""))

	   if let dataToSign = self.dataToSign {
		  let base64String = dataToSign.base64EncodedString()
		  print("Base64 Data to sign: \(base64String)")
		  
		  let (pkcs1Signature, certString) = signPKCS1WithDnie(factory: dnieNFC, data: dataToSign, algorithm: algorithm)
		  
		  if let pkcs1Signature = pkcs1Signature, let certString = certString {
			 completion(.success((pkcs1Signature, certString)))
		  } else {
			 if pkcs1Signature == nil {
				completion(.failure(SigningError.missingSignature))
			 } else if certString == nil {
				completion(.failure(SigningError.missingCertificate))
			 }
		  }
	   } else {
		  completion(.failure(SigningError.missingSignature))
	   }
    }
}
