//
//  SingleSignUseCase.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 24/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class SingleSignUseCase: GenericSignUseCase {
    var certificateUtils: CertificateUtils?
    
    init(signModel: SignModel, certificateUtils: CertificateUtils? = nil) {
	   super.init(signModel: signModel)
	   self.certificateUtils = certificateUtils
    }
    
    override func getCertificateData() -> String? {
	   return certificateUtils?.base64UrlSafeCertificateData
    }
    
    override func getPKCS1Sign(dataToSign: Data, algorithm: String) -> Data? {
	   guard let privateKey = certificateUtils?.privateKey
	   else {
		  return nil
	   }
		    
	   let signUtils = CADESSignUtils()
	   var unmanagedPrivateKey: Unmanaged<SecKey>? = Unmanaged<SecKey>.passUnretained(privateKey)
	   let pointerToUnmanagedPrivateKey: UnsafeMutablePointer<Unmanaged<SecKey>?> = UnsafeMutablePointer(&unmanagedPrivateKey)
	   
	   guard let dataSigned = signUtils.signData(
		  withPrivateKey: pointerToUnmanagedPrivateKey,
		  data: dataToSign,
		  algorithm: algorithm
	   ) else {
		  print("Failed to sign data")
		  return nil
	   }
	   
	   return dataSigned
    }
}
