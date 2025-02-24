//
//  PadesUtilsSwift.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 5/9/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import Security

/*class PadesUtilsSwift {
    func signPdf(
	   pdfData: Data,
	   privateKey: SecKey,
	   certificateRef: SecCertificate,
        extraParams: [String: String]?) -> Result<String, AppError>
    {
        let utils = PAdESSigner()
        
        let signatureResponse = utils.signPdf(
            with: pdfData,
            hashAlgorithmType: HashAlgorithmType.SHA256,
            privateKey: privateKey,
            certificate: certificateRef,
            extraParams: extraParams
        );
        
        if let signatureResponse = signatureResponse {
            if let error = signatureResponse.error as? NSError {
                return .failure(HandeThirdPartyErrors.getLocalSignError(codigo: error.code))
            } else {
                guard let postsignData = signatureResponse.signedString else {
                    return .failure(HandeThirdPartyErrors.getLocalSignError(codigo: 1))
                }
                return .success(postsignData)
            }
        } else {
            return .failure(HandeThirdPartyErrors.getLocalSignError(codigo: 1))
        }
    }
}*/
