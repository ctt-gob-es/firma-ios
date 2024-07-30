//
//  SendCertificateUseCase.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 24/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class SendCertificateUseCase {
    private let storeDataRest: StoreDataRest = StoreDataRest()
    private let urlServlet: String
    private let cipherKey: String
    private let docId: String
    private let base64UrlSafeCertificateData: String
    
    init(
	   urlServlet: String,
	   cipherKey: String,
	   docId: String,
	   base64UrlSafeCertificateData: String
    ) {
	   self.urlServlet = urlServlet
	   self.cipherKey = cipherKey
	   self.docId = docId
	   self.base64UrlSafeCertificateData = base64UrlSafeCertificateData
    }
    
    func sendCertificate(
	   dataSign: String,
	   completion: @escaping (Result<Data, Error>
	   ) -> Void) {
	   storeDataRest.storeData(
		  urlServlet: urlServlet,
		  cipherKey: cipherKey,
		  docId: docId,
		  base64UrlSafeCertificateData: base64UrlSafeCertificateData,
		  dataSign: dataSign,
		  completion: completion
	   )
    }
}
