//
//  DNILocalSignUseCase.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 31/1/25.
//  Copyright © 2025 Solid GEAR. All rights reserved.
//

import Foundation

@objc class DNILocalSignUseCase: GenericLocalSignUseCase, DNIeResult{
    private var wrapper: SwiftDNIeWrapper?
    private var dnieWrapper: EsGobJmulticardIosDnieWrapper?
    private var certificateData: String?

    init(can: String, pin: String, signModel: SignModel) {
	   super.init(signModel: signModel)
	   self.wrapper = SwiftDNIeWrapper(can: can, pin: pin)
    }
    
    override func configure() {
	   let key = "obfuscateUserIdentifiers"
	   let obfuscateUserIdentifiers = UserDefaults.standard.object(forKey: key) == nil ? true : UserDefaults.standard.bool(forKey: key)
	   signModel.dictExtraParams?["obfuscateCertText"] = obfuscateUserIdentifiers ? "true" : "false"
	   
	   let layer2Text = NSLocalizedString("visible_sign_overlay",bundle: Bundle.main, comment: "")
	   signModel.dictExtraParams?["layer2Text"] = layer2Text
	   wrapper?.getDNIe(completion: self)
    }
    
    private func handleErrorDnieWrapper(errorCode: Int) {
	   completionCallback?(.failure(HandeThirdPartyErrors.getDNIEError(codigo: errorCode)))
    }

    // MARK: - DNIeResult Protocol Conformance

    func getDNIeNFCSuccess(wrapper: EsGobJmulticardIosDnieWrapper) {
	   let certJ509 = wrapper.getCertificateWith(PrivateConstants.certFromDNIe)
	   if let certJ509 = certJ509 {
		  self.certificateData = Base64Utils.encode(certJ509.getEncoded().toNSData(), urlSafe: true)
	   } else {
		  handleErrorDnieWrapper(errorCode: 11)
		  return
	   }
	   self.dnieWrapper = wrapper
	   
	   sign()
    }

    func getDNIeError(errorCode: Int, errorMessage: String) {
	   handleErrorDnieWrapper(errorCode: errorCode)
    }

    func getNFCError(appError: AppError) {
	   completionCallback?(.failure(appError))
    }

    func invalidateSessionManually(withErrorMessage: String) {
	   self.wrapper?.nfcSessionManager.invalidateSessionManually(withErrorMessage: withErrorMessage)
    }

    func invalidateSessionManually(withAlertMessage: String) {
	   self.wrapper?.nfcSessionManager.invalidateSessionManually(withAlertMessage: withAlertMessage)
    }
    
    override func getCertificateRef() -> SecCertificate? {
        guard 
            let certJ509 = Base64Utils.decode(certificateData, urlSafe: true),
            let secCert = SecCertificateCreateWithData(nil, certJ509 as CFData)
        else {    
            return nil
        }
        
        return secCert
    }
    
    override func generatePKCS1(preSignResult: Data!, signAlgorithm: String) -> Data? {
        guard let privateKeyReference = dnieWrapper?.getPrivateKey(with: PrivateConstants.certFromDNIe),
		    let dataSigned = dnieWrapper?.sign(with: IOSByteArray(nsData: preSignResult), with: signAlgorithm, with: privateKeyReference) else {
		  handleErrorDnieWrapper(errorCode: Int(dnieWrapper?.getErrorCode() ?? 10))
		  return nil
	   }
	   return dataSigned.toNSData()
    }
}
