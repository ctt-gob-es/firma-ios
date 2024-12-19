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
	   signAlgorithm: String?,
	   privateKey: SecKey,
	   certificateRef: SecCertificate,
	   certificateAlgorithm: String?,
	   extraParams: [String: String]?,
	   completion: @escaping (Result<String, AppError>) -> Void
    ) {
	   DispatchQueue.global(qos: .userInitiated).async {
		  let utils = PAdESSignatureUtils()

		  utils.signPdf(
			 with: pdfData,
			 signAlgorithm: signAlgorithm,
			 privateKey: privateKey,
			 certificate: certificateRef,
			 certificateAlgorithm: certificateAlgorithm,
			 extraParams: extraParams
		  ) { result, error in
			 DispatchQueue.main.async {
				if let error = error {
				    completion(.failure(AppError.generalSoftwareError))
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
