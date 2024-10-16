//
//  SingleSignUseCase.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 24/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class DNISingleSignUseCase : GenericSignUseCase, DNIeResult {
    var pkcs1: Data? = nil
    private var certificateData: String? = nil
    var wrapper: SwiftDNIeWrapper?
    private var dnieWrapper: EsGobJmulticardIosDnieWrapper?
    
    init(can: String,
	    pin: String,
	    signModel: SignModel
    ) {
	   super.init(signModel: signModel)
	   wrapper = SwiftDNIeWrapper(can: can, pin: pin)
    }
    
    private func handleErrorDnieWrapper() {
	   if let errorCode = dnieWrapper?.getErrorCode(),
		 let errorMessage = dnieWrapper?.getErrorMessage() {
		  handleSignError(
			 error:  NSError(
				domain: "Error", code: Int(errorCode),
				userInfo: ["errorMessage" : errorMessage]
			 ),
			 completion: self.completionCallback!
		  )
	   }
    }
    
    override func getCertificateData() -> String? {
	   return certificateData
    }
    
    override func getPKCS1Sign(dataToSign: Data, algorithm: String) -> Data? {
	   guard let privateKeyReference = dnieWrapper?.getPrivateKey(with: "CertFirmaDigital"),
		    let dataSigned = dnieWrapper?.sign(with: IOSByteArray(nsData: dataToSign), with: algorithm, with: privateKeyReference) else {
		  handleErrorDnieWrapper()
		  return nil
	   }
	   return dataSigned.toNSData()
    }
    
    override func singleSign(completion: @escaping (Result<Bool, Error>) -> Void) {
	   guard signModel != nil else {
		  handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_datos_firmar", bundle: Bundle.main, comment: "")]), completion: completion)
		  return
	   }
	   self.completionCallback = completion
	   wrapper?.getDNIe(completion: self)
    }
    
    func getDNIeNFCSuccess(wrapper: EsGobJmulticardIosDnieWrapper) {
	   let certJ509 = wrapper.getCertificateWith("CertFirmaDigital")
	   self.certificateData = EsGobAfirmaCoreMiscBase64_encodeWithByteArray_withBoolean_(certJ509?.getEncoded(), true)
	   self.dnieWrapper = wrapper
	   presign(signModel: signModel!)
    }
    
    func getDNIeError(errorCode: Int, errorMessage: String) {
	   handleSignError(error: NSError(domain: "Error", code: errorCode, userInfo: ["errorMessage": errorMessage]), completion: self.completionCallback!)
    }
}
