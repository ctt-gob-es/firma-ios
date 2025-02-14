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
	   
	   let layer2Text = "Firmado por $$SUBJECTCN$$ el día $$SIGNDATE=dd/MM/yyyy$$ con un certificado emitido por $$ISSUERCN$$"
	   signModel.dictExtraParams?["layer2Text"] = layer2Text
	   wrapper?.getDNIe(completion: self)
    }
    
    /*override func sign() {
	   guard
		  let stringBase64Data = signModel.datosInUse,
		  let pdfData = Base64Utils.decode(stringBase64Data, urlSafe: true),
		  let certJ509 = Base64Utils.decode(certificateData, urlSafe: true),
		  let secCert = SecCertificateCreateWithData(nil, certJ509 as CFData)
	   else { return handleErrorLocalSign(errorCode: 1) }

	   let utils = PAdESSignatureUtils()
	   let extraParams = signModel.dictExtraParams

        
	   guard let presignResponse = utils.dniePresignPdf(
		  with: pdfData,
            hashAlgorithmType: HashAlgorithmType.SHA256,
		  certificate: secCert,
		  extraParams: extraParams
	   ) else {
		  return handleErrorLocalSign(errorCode: 1)
	   }

	   guard let presignData = presignResponse.data else {
            // TODO Revisar si se puede añadir el reintentar
            /*if presignResponse.retry {
               completionCallback?(.success(true))
            }*/
            let errorCode = (presignResponse.error as NSError?)?.code ?? 1
		  return handleErrorLocalSign(errorCode: errorCode)
	   }

        let signAlgorithm = utils.getSignAlgorithm(HashAlgorithmType.SHA256, with: secCert)
        guard let pkcs1 = generatePKCS1(preSignResult: presignData, signAlgorithm: signAlgorithm ?? "SHA256withRSA") else {
		  return handleErrorDnieWrapper(errorCode: 10)
	   }

	   guard let postsignResponse = utils.dniePostsignPdf(
		  with: pdfData,
            hashAlgorithmType: HashAlgorithmType.SHA256,
		  certificate: secCert,
		  extraParams: extraParams,
		  pkcs1: pkcs1
	   ) else {
		  return handleErrorLocalSign(errorCode: 1)
	   }

	   guard let postsignData = postsignResponse.signedString else {
		  let errorCode = (postsignResponse.error as NSError?)?.code ?? 1
		  return handleErrorLocalSign(errorCode: errorCode)
	   }
	   
	   if postsignResponse.retry {
		  completionCallback?(.success(true))
	   }

	   self.signModel.datosInUse = postsignData
	   
	   completionCallback?(.success(false))
    }*/
    
    private func handleErrorLocalSign(errorCode: Int) {
	   let error = HandeThirdPartyErrors.getLocalSignError(codigo: errorCode)
	   if HandeThirdPartyErrors.shouldRetry(error: error) {
		  completionCallback?(.success(true))
	   } else {
		  completionCallback?(.failure(error))
	   }
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
