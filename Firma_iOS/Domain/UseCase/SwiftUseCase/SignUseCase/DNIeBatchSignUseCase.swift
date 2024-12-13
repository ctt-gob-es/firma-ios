//
//  DNIEBatchSignUseCase.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 25/10/24.
//  © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class DNIeBatchSignUseCase: GenericBatchSignUseCase, DNIeResult {
    
    // MARK: - Properties
    
    private var wrapper: SwiftDNIeWrapper?
    private var dnieWrapper: EsGobJmulticardIosDnieWrapper?
    private var certificateData: String?
    
    // MARK: - Initialization
    
    init(can: String, pin: String) {
	   super.init()
	   wrapper = SwiftDNIeWrapper(can: can, pin: pin)
    }
    
    // MARK: - Error Handling
    
    private func handleErrorDnieWrapper(errorCode: Int) {
        if let completionHandler = self.completionHandler {
            completionHandler(.failure(HandeThirdPartyErrors.getDNIEError(codigo: errorCode)))
        }
    }
    
    // MARK: - Overridden Methods
    
    override func preloadCertificateData() {
	   wrapper?.getDNIe(completion: self)
    }
    
    // MARK: - DNIeResult Protocol Conformance
    
    func getDNIeNFCSuccess(wrapper: EsGobJmulticardIosDnieWrapper) {
	   self.dnieWrapper = wrapper
	   
	   let certJ509 = wrapper.getCertificateWith(PrivateConstants.certFromDNIe)
	   if let certJ509 = certJ509 {
		  self.certificateData = Base64Utils.encode(certJ509.getEncoded().toNSData(), urlSafe: true)
	   } else {
		  handleErrorDnieWrapper(errorCode: 11)
		  return
	   }
	   presign()
    }
    
    func getDNIeError(errorCode: Int, errorMessage: String) {
	   handleErrorDnieWrapper(errorCode: errorCode)
    }
    
    func getNFCError(appError: AppError) {
        if let completionHandler = self.completionHandler {
            completionHandler(.failure(appError))
        }
    }
    
    // MARK: - Signing Method
    
    override func sign(pre: String, algorithm: String, pk1Decoded: Bool) -> Result<String, AppError> {
	   guard let dataToSign = Base64Utils.decode(pre, urlSafe: true) else {
            return .failure(AppError.generatePK1BatchDNIe)
	   }
	   
	   guard let privateKeyReference = dnieWrapper?.getPrivateKey(with: PrivateConstants.certFromDNIe),
		    let dataSigned = dnieWrapper?.sign(with: IOSByteArray(nsData: dataToSign), with: algorithm, with: privateKeyReference) else {
		  handleErrorDnieWrapper(errorCode: Int(dnieWrapper?.getErrorCode() ?? 10))
            return .failure(AppError.generatePK1BatchDNIe)
	   }
	   
	   if pk1Decoded {
            return .success(decodePK1Signature(dataSigned.toNSData()))
	   }
	   
        return .success(Base64Utils.encode(dataSigned.toNSData()))
    }
    
    override func getCertificateData() -> String {
		  self.certificateData ?? "error_no_certificate_data"
    }
    
    func invalidateSessionManually(withErrorMessage: String) {
        self.wrapper?.nfcSessionManager.invalidateSessionManually(withErrorMessage: withErrorMessage)
    }
    
    func invalidateSessionManually(withAlertMessage: String) {
        self.wrapper?.nfcSessionManager.invalidateSessionManually(withAlertMessage: withAlertMessage)
    }
}
