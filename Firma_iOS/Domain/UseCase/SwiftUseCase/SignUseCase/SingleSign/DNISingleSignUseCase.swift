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
    private var wrapper: SwiftDNIeWrapper?
    private var dnieWrapper: EsGobJmulticardIosDnieWrapper?
    
    init(can: String,
	    pin: String,
	    signModel: SignModel
    ) {
	   super.init(signModel: signModel)
	   wrapper = SwiftDNIeWrapper(can: can, pin: pin)
    }
    
    private func handleErrorDnieWrapper(errorCode: Int) {
        if let completionCallback = completionCallback {
            completionCallback(.failure(HandeThirdPartyErrors.getDNIEError(codigo: errorCode)))
        }
    }
    
    override func getCertificateData() -> String? {
	   return certificateData
    }
    
    override func getPKCS1Sign(dataToSign: Data, algorithm: String) -> Data? {
	   guard let privateKeyReference = dnieWrapper?.getPrivateKey(with: PrivateConstants.certFromDNIe),
		    let dataSigned = dnieWrapper?.sign(with: IOSByteArray(nsData: dataToSign), with: algorithm, with: privateKeyReference) else {
		  handleErrorDnieWrapper(errorCode: Int(dnieWrapper?.getErrorCode() ?? 10))
		  return nil
	   }
	   return dataSigned.toNSData()
    }
    
    override func configure() {
	   wrapper?.getDNIe(completion: self)
    }
    
    func getDNIeNFCSuccess(wrapper: EsGobJmulticardIosDnieWrapper) {
	   let certJ509 = wrapper.getCertificateWith(PrivateConstants.certFromDNIe)
	   if let certJ509 = certJ509 {
		  self.certificateData = Base64Utils.encode(certJ509.getEncoded().toNSData(), urlSafe: true)
	   } else{
		  handleErrorDnieWrapper(errorCode: 11)
		  return
	   }
	   
	   self.dnieWrapper = wrapper
	   startSign()
    }
    
    func getDNIeError(errorCode: Int, errorMessage: String) {
        handleErrorDnieWrapper(errorCode: errorCode)
    }
    
    func getNFCError(appError: AppError) {
        if let completionCallback = self.completionCallback {
            completionCallback(.failure(appError))
        }
    }
    
    func invalidateSessionManually(withErrorMessage: String) {
        self.wrapper?.nfcSessionManager.invalidateSessionManually(withErrorMessage: withErrorMessage)
    }
    
    func invalidateSessionManually(withAlertMessage: String) {
        self.wrapper?.nfcSessionManager.invalidateSessionManually(withAlertMessage: withAlertMessage)
    }
}
