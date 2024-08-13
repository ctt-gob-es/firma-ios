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
	   completion: @escaping (EsGobAfirmaIosSignatureResult?) -> Void
    ) {
	   DispatchQueue.global(qos: .userInitiated).async {
		  let utils = AOPadesUtils()
		  
		  let result = utils.signPdf(
			 with: pdfData,
			 algorithm: algorithm,
			 privateKey: privateKey,
			 certificate: certificateRef,
			 extraParams: extraParams
		  )
		  
		  DispatchQueue.main.async {
			 completion(result)
		  }
	   }
    }
}
