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
    
    override func configure() {
	   guard let certificateName = certificateUtils?.selectedCertificateName,
		    let identity = SwiftCertificateUtils.getIdentityFromKeychain(certName: certificateName)
	   else {
		  print("Missing required data for signing")
		  return
	   }
	   
	   let isPseudonym = certificateUtils?.isPseudonymCertificate(identity) ?? false
	   let key = "obfuscateUserIdentifiers"
	   let obfuscateUserIdentifiers = UserDefaults.standard.object(forKey: key) == nil ? true : UserDefaults.standard.bool(forKey: key)
	   if isPseudonym {
		  signModel.dictExtraParams?["obfuscateCertText"] = "false"
	   } else {
		  signModel.dictExtraParams?["obfuscateCertText"] = obfuscateUserIdentifiers ? "true" : "false"
	   }
	   
	   let layer2Text = isPseudonym
	   ? NSLocalizedString("visible_sign_overlay_pseudonym",bundle: Bundle.main, comment: "")
	   : NSLocalizedString("visible_sign_overlay",bundle: Bundle.main, comment: "")
	   
	   signModel.dictExtraParams?["layer2Text"] = layer2Text
	   
        sign()
    }
    
    override func getCertificateRef() -> SecCertificate? {
        guard let certificateName = certificateUtils?.selectedCertificateName,
              let identity = SwiftCertificateUtils.getIdentityFromKeychain(certName: certificateName),
              let certificateRef = SwiftCertificateUtils.getCertificateRefFromIdentity(identity: identity) 
        else {
            return nil
        }
        return certificateRef
    }
    
    override func generatePKCS1(preSignResult: Data!, signAlgorithm algorithm: String) -> Data? {
        guard
           let privateKeyRef = certificateUtils?.privateKey
        else {
           return nil
        }
        
        var signedData: Data
       
        let signUtils = CADESSignUtils()
       
        let unmanagedPrivateKey = Unmanaged.passUnretained(privateKeyRef)
        let privateKeyPointer: UnsafeMutablePointer<Unmanaged<SecKey>?> = .allocate(capacity: 1)
        privateKeyPointer.initialize(to: unmanagedPrivateKey)
        signedData = signUtils.signData(withPrivateKey: privateKeyPointer, data: preSignResult, algorithm: algorithm)
       
        privateKeyPointer.deinitialize(count: 1)
        privateKeyPointer.deallocate()
       
        return signedData
    }
    
  /*  override func sign() {
	   print("Ejecutando firma con certificado digital")
	   
	   guard
		  let stringBase64Data = signModel.datosInUse,
		  let pdfData = Base64Utils.decode(stringBase64Data, urlSafe: true),
		  let privateKeyRef = certificateUtils?.privateKey,
		  let certificateName = certificateUtils?.selectedCertificateName,
		  let identity = SwiftCertificateUtils.getIdentityFromKeychain(certName: certificateName),
		  let certificateRef = SwiftCertificateUtils.getCertificateRefFromIdentity(identity: identity)
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
        
        let result = swiftPadesUtils.signPdf(
		  pdfData: pdfData,
		  privateKey: privateKeyRef,
		  certificateRef: certificateRef,
		  extraParams: stringDict
        );
        
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
    }*/
    
}
