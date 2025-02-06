//
//  CertificateLocalSignUseCase.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 31/1/25.
//  Copyright © 2025 Solid GEAR. All rights reserved.
//

import Foundation

class CertificateLocalSignUseCase: GenericLocalSignUseCase {
    var certificateUtils: CertificateUtils?
    
    init(signModel: SignModel, certificateUtils: CertificateUtils? = nil) {
	   super.init(signModel: signModel)
	   self.certificateUtils = certificateUtils
    }
    
    override func getCertificateData() -> String? {
	   return certificateUtils?.base64UrlSafeCertificateData
    }
    
    override func sign() {
	   print("Ejecutando firma con certificado digital")
	   
	   guard
		  let stringBase64Data = signModel.datosInUse,
		  let pdfData = Base64Utils.decode(stringBase64Data, urlSafe: true),
		  let privateKeyRef = certificateUtils?.privateKey,
		  let certificateName = certificateUtils?.selectedCertificateName,
		  let identity = SwiftCertificateUtils.getIdentityFromKeychain(certName: certificateName),
		  let certificateRef = SwiftCertificateUtils.getCertificateRefFromIdentity(identity: identity),
		  let certificateAlgorithm = SwiftCertificateUtils.getAlgorithmFromCertificate(certificate: certificateRef)
	   else {
		  print("Missing required data for signing")
		  return
	   }
	   
	   var extraParams = signModel.dictExtraParams
	   let isPseudonym = certificateUtils?.isPseudonymCertificate(identity) ?? false
	   let layer2Text = isPseudonym
	   ? "Firmado por $$PSEUDONYM$$ - $$OU$$ el día $$SIGNDATE=dd/MM/yyyy$$ con un certificado emitido por $$ISSUERCN$$"
	   : "Firmado por $$SUBJECTCN$$ el día $$SIGNDATE=dd/MM/yyyy$$ con un certificado emitido por $$ISSUERCN$$"
	   
	   extraParams?["layer2Text"] = layer2Text
	   
	   let stringDict: [String: String]? = extraParams as? [String: String]
	   
	   let swiftPadesUtils = PadesUtilsSwift()
	   swiftPadesUtils.signPdf(
		  pdfData: pdfData,
		  signAlgorithm: nil,
		  privateKey: privateKeyRef,
		  certificateRef: certificateRef,
		  certificateAlgorithm: certificateAlgorithm,
		  extraParams: stringDict
	   ) { result in
		  switch result {
			 case .success(let signedPDF):
				self.signModel.datosInUse = signedPDF
				
				if let completionCallback = self.completionCallback {
				    completionCallback(.success(false))
				}
				
			 case .failure(let error):
				if let completionCallback = self.completionCallback {
				    if HandeThirdPartyErrors.shouldRetry(error: error) {
					   completionCallback(.success(true))
				    } else {
					   completionCallback(.failure(error))
				    }
				}
		  }
	   }
    }
    
    override func preSign() {
	   fatalError("This method is overrided")
    }
    
    override func postSign() {
	   fatalError("This method is overrided")
    }
}
