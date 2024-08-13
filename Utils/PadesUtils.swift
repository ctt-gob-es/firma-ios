//
//  PadesUtils.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 12/8/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class PadesUtils {
    func signPdf(
	   pdfData: Data,
	   algorithm: String?,
	   privateKey: JavaSecurityPrivateKeyProtocol,
	   certChain: [JavaSecurityCertCertificate],
	   extraParams: [String: String]?,
	   completion: @escaping (EsGobAfirmaIosSignatureResult?) -> Void
    ) {
	   DispatchQueue.global(qos: .userInitiated).async {
		  let utils = AOPadesUtils()
		  let result = utils.signPdf(
			 with: pdfData,
			 algorithm: algorithm,
			 privateKey: privateKey,
			 certChain: certChain,
			 extraParams: extraParams
		  )
		  
		  DispatchQueue.main.async {
			 completion(result)
		  }
	   }
    }
}
