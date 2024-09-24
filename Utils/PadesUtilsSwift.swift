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
	   completion: @escaping (Result<String, Error>) -> Void
    ) {
	   DispatchQueue.global(qos: .userInitiated).async {
		  let utils = AOPadesUtils()

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
				    completion(.failure(error))
				} else if let result = result {
				    completion(.success(result))
				} else {
				    let unknownError = NSError(domain: "Error", code: 9999, userInfo: [NSLocalizedDescriptionKey: "Unknown error occurred"])
				    completion(.failure(unknownError))
				}
			 }
		  }
	   }
    }
}
