//
//  CertificateBatchSignUseCase.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 24/10/24.
//  © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import Security

class CertificateBatchSignUseCase: GenericBatchSignUseCase {
    
    // MARK: - Properties
    
    var urlSafeCertificateData: String
    var privateKey: SecKey
    
    // MARK: - Initialization
    
    init(certificate: String, privateKey: SecKey) {
	   self.urlSafeCertificateData = certificate
	   self.privateKey = privateKey
	   super.init()
    }
    
    // MARK: - Signing Method
    
    override func sign(pre: String, algorithm: String, pk1Decoded: Bool) -> String {
	   guard let data = Base64Utils.decode(pre, urlSafe: true) else { return "" }
	   
	   var signedData: Data
	   
	   let signUtils = CADESSignUtils()
	   
	   let unmanagedPrivateKey = Unmanaged.passUnretained(privateKey)
	   var privateKeyPointer: UnsafeMutablePointer<Unmanaged<SecKey>?> = .allocate(capacity: 1)
	   privateKeyPointer.initialize(to: unmanagedPrivateKey)
	   signedData = signUtils.signData(withPrivateKey: privateKeyPointer, data: data, algorithm: algorithm)
	   
	   privateKeyPointer.deinitialize(count: 1)
	   privateKeyPointer.deallocate()
	   
	   if pk1Decoded {
		  return decodePK1Signature(signedData)
	   }
	   
	   return Base64Utils.encode(signedData)
    }
    
    override func getCertificateData() -> String {
		  self.urlSafeCertificateData
    }
}
