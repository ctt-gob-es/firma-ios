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
	   wrapper?.getDNIe(completion: self)
    }
    
    override func getCertificateData() -> String? {
	   return certificateData
    }
    
    override func preSign() {}
    
    override func postSign() {}

    override func sign() {
	   guard
		  let stringBase64Data = signModel.datosInUse,
		  let pdfData = Base64Utils.decode(stringBase64Data, urlSafe: true),
		  let certJ509 = Base64Utils.decode(getCertificateData(), urlSafe: true),
		  let secCert = SecCertificateCreateWithData(nil, certJ509 as CFData),
		  let certificateAlgorithm = SwiftCertificateUtils.getAlgorithmFromCertificate(certificate: secCert)
	   else { return handleErrorLocalSign(errorCode: -1) }

	   let utils = PAdESSignatureUtils()
	   let extraParams = signModel.dictExtraParams

	   guard let presignResponse = utils.dniePresignPdf(
		  with: pdfData,
		  signAlgorithm: nil,
		  certificate: secCert,
		  certificateAlgorithm: certificateAlgorithm,
		  extraParams: extraParams
	   ) else {
		  return handleErrorLocalSign(errorCode: -1)
	   }

	   guard let presignData = presignResponse.data else {
		  let errorCode = (presignResponse.error as NSError?)?.code ?? -1
		  return handleErrorLocalSign(errorCode: errorCode)
	   }
	   
	   if presignResponse.retry {
		  completionCallback?(.success(true))
	   }

	   guard let pkcs1 = generatePKCS1(withPreSignResult: presignData) else {
		  return handleErrorDnieWrapper(errorCode: -1)
	   }

	   guard let postsignResponse = utils.dniePostsignPdf(
		  with: pdfData,
		  signAlgorithm: nil,
		  certificate: secCert,
		  certificateAlgorithm: certificateAlgorithm,
		  extraParams: extraParams,
		  pkcs1: pkcs1
	   ) else {
		  return handleErrorLocalSign(errorCode: -1)
	   }

	   guard let postsignData = postsignResponse.signedString else {
		  let errorCode = (postsignResponse.error as NSError?)?.code ?? -2
		  return handleErrorLocalSign(errorCode: errorCode)
	   }
	   
	   if postsignResponse.retry {
		  completionCallback?(.success(true))
	   }

	   self.signModel.datosInUse = postsignData
	   
	   completionCallback?(.success(false))
    }
    
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
    
    func generatePKCS1(withPreSignResult preSignResult: Data!) -> Data? {
	   let algorithm = "SHA256withRSA"
	   guard let privateKeyReference = dnieWrapper?.getPrivateKey(with: PrivateConstants.certFromDNIe),
		    let dataSigned = dnieWrapper?.sign(with: IOSByteArray(nsData: preSignResult), with: algorithm, with: privateKeyReference) else {
		  handleErrorDnieWrapper(errorCode: Int(dnieWrapper?.getErrorCode() ?? 10))
		  return nil
	   }
	   return dataSigned.toNSData()
    }
}
