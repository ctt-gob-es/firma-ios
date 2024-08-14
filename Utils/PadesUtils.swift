//
//  PadesUtils.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 12/8/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import Security



class PadesUtils {
    func signPdf(
	   pdfData: Data,
	   algorithm: String?,
	   privateKey: SecKey,
	   certificateRef: SecCertificate,
	   extraParams: [String: String]?,
	   completion: @escaping (Result<String, Error>) -> Void
    ) {
	   DispatchQueue.global(qos: .userInitiated).async {
		  let utils = AOPadesUtils()

		  utils.signPdf(
			 with: pdfData,
			 algorithm: algorithm,
			 privateKey: privateKey,
			 certificate: certificateRef,
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
