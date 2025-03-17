//
//  GenericLocalSignUseCase.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 31/1/25.
//  Copyright © 2025 Solid GEAR. All rights reserved.
//

import Foundation

class GenericLocalSignUseCase : NSObject {
    var signModel: SignModel
    
    private let defaultSignAlgorithm = "SHA256"
    
    init(signModel: SignModel) {
	   self.signModel = signModel
    }
    var completionCallback: ((Result<Bool, AppError>) -> Void)?
    
    func executeSign(completion: @escaping (Result<Bool, AppError>) -> Void) {
	   self.completionCallback = completion
	   if validateData() {
		  configure()
	   }
    }
    
    func sign() {
        guard
            let stringBase64Data = signModel.datosInUse,
            let pdfData = Base64Utils.decode(stringBase64Data, urlSafe: true),
            let secCert = getCertificateRef()
        else {
            completionCallback?(.failure(AppError.localSignDataError))
            return
        }

        let padesSigner = PAdESSigner()
        let extraParams = signModel.dictExtraParams
        
        guard let presignResponse = padesSigner.presignPdf(
            with: pdfData,
            hashAlgorithmType: HashAlgorithmType.SHA256,
            certificate: secCert,
            extraParams: extraParams
        ) else {
            completionCallback?(.failure(AppError.localSignPresignError))
            return
        }

        guard let presignData = presignResponse.data else {
            let errorCode = (presignResponse.error as NSError?)?.code ?? 1
            return handleErrorLocalSign(errorCode: errorCode)
        }
        
        let signAlgorithm = padesSigner.getSignAlgorithm(HashAlgorithmType.SHA256, with: secCert)
        
        guard let pkcs1 = generatePKCS1(preSignResult: presignData, signAlgorithm: signAlgorithm ?? "SHA256withRSA") else {
            completionCallback?(.failure(AppError.localSignSignatureError))
            return
        }

        guard let signatureResponse = padesSigner.postsignPdf(
            with: pdfData,
            hashAlgorithmType: HashAlgorithmType.SHA256,
            certificate: secCert,
            extraParams: extraParams,
            pkcs1: pkcs1
        ) else {
            completionCallback?(.failure(AppError.localSignPostsignError))
            return
        }

        guard let postsignData = signatureResponse.signedString else {
            let errorCode = (signatureResponse.error as NSError?)?.code ?? 1
            return handleErrorLocalSign(errorCode: errorCode)
        }
        
        self.signModel.datosInUse = postsignData
        completionCallback?(.success(false))
    }
    
    func handleErrorLocalSign(errorCode: Int) {
       let error = HandeThirdPartyErrors.getLocalSignError(codigo: errorCode)
       if HandeThirdPartyErrors.shouldRetry(error: error) {
          completionCallback?(.success(true))
       } else {
          completionCallback?(.failure(error))
       }
    }
    
    // MARK: - Methods to override
    func getCertificateRef() -> SecCertificate? {
       fatalError("This method should be overridden")
    }
    
    func generatePKCS1(preSignResult: Data!, signAlgorithm: String) -> Data? {
        fatalError("This method should be override")
    }
    
    func configure() {
        fatalError("This method should be override")
    }
    
    func validateData() -> Bool {
	   return true
    }
    
    
}
