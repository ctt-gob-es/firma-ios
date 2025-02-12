//
//  PadesUtilsSwift.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 5/9/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import Security

class PadesUtilsSwift {
    func signPdf(
	   pdfData: Data,
	   privateKey: SecKey,
	   certificateRef: SecCertificate,
	   extraParams: [String: String]?,
	   completion: @escaping (Result<String, AppError>) -> Void
    ) {
	   DispatchQueue.global(qos: .userInitiated).async {
		  let utils = PAdESSignatureUtils()
		  
		  utils.signPdf(
			 with: pdfData,
                hashAlgorithmType: HashAlgorithmType.SHA256,
			 privateKey: privateKey,
                certificate: certificateRef,
			 extraParams: extraParams
		  ) { result, error in
			 DispatchQueue.main.async {
				if let error = error as? NSError {
				    completion(.failure(HandeThirdPartyErrors.getLocalSignError(codigo: error.code)))
				} else if let result = result {
				    completion(.success(result))
				} else {
				    let unknownError = AppError.generalSoftwareError
				    completion(.failure(unknownError))
				}
			 }
		  }
	   }
    }
}
