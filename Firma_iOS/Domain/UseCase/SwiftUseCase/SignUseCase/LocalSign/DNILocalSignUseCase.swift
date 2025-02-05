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
	   else {
		  return
	   }

	   let extraParams = signModel.dictExtraParams
	   let utils = PAdESSignatureUtils()
 
	   guard let presignResponse = utils.dniePresignPdf(
		  with: pdfData,
		  signAlgorithm: nil,
		  certificate: secCert,
		  certificateAlgorithm: certificateAlgorithm,
		  extraParams: extraParams
	   ) else {
		  return
	   }

	   if let _ = presignResponse.error {
		  return
	   }

	   guard let presignDataResult = presignResponse.data else {
		  return
	   }

	   let pkcs1 = generatePKCS1(withPreSignResult: presignDataResult)

	   guard let postsignResponse = utils.dniePostsignPdf(
		  with: pdfData,
		  signAlgorithm: nil,
		  certificate: secCert,
		  certificateAlgorithm: certificateAlgorithm,
		  extraParams: extraParams,
		  pkcs1: pkcs1
	   ) else {
		  return
	   }

	   if let _ = postsignResponse.error {
		  return
	   }

	   guard let postsignDataResult = postsignResponse.signedString else {
		  return
	   }

	   self.signModel.datosInUse = postsignDataResult

	   if let completionCallback = self.completionCallback {
		  completionCallback(.success(false))
	   }
    }
    
    //MARK: Complete sign
    /*override func sign() {
	   swiftPadesUtils.dnieSignPdf(
		  pdfData: pdfData,
		  signAlgorithm: nil,
		  privateKey: privateKeyRef as! SecKey,
		  certificateRef: secCert,
		  certificateAlgorithm: algorithm,
		  extraParams: stringDict,
		  delegate: self
	   ) { result in
		  switch result {
			 case .success(let signedPDF):
				self.signModel.datosInUse = signedPDF
				
				if let completionCallback = self.completionCallback {
				    completionCallback(.success(true))
				}
				
			 case .failure(let error):
				if let completionCallback = self.completionCallback {
				    completionCallback(.failure(error))
				}
		  }
	   }
    }*/
    
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
    
    func generatePKCS1(withPreSignResult preSignResult: Data!) -> Data {
	   let algorithm = "SHA256withRSA"
	   guard let privateKeyReference = dnieWrapper?.getPrivateKey(with: PrivateConstants.certFromDNIe),
		    let dataSigned = dnieWrapper?.sign(with: IOSByteArray(nsData: preSignResult), with: algorithm, with: privateKeyReference) else {
		  handleErrorDnieWrapper(errorCode: Int(dnieWrapper?.getErrorCode() ?? 10))
		  return Data()
	   }
	   return dataSigned.toNSData()
    }
    
    //MARK: As we use OBJ-C, we might need to add OBJC Structure
    /*func generatePKCS1(withPreSignResult preSignResult: Data!) async -> Data? {
	   let algorithm = "SHA256withRSA"
	   guard let privateKeyReference = dnieWrapper?.getPrivateKey(with: PrivateConstants.certFromDNIe),
		    let dataSigned = dnieWrapper?.sign(with: IOSByteArray(nsData: preSignResult), with: algorithm, with: privateKeyReference) else {
		  handleErrorDnieWrapper(errorCode: Int(dnieWrapper?.getErrorCode() ?? 10))
		  return nil
	   }
	   return dataSigned.toNSData()
    }*/
}
