//
//  StoreDataRest.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 24/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class StoreDataRest {
    func storeData(urlServlet: String, cipherKey: String, docId: String, base64UrlSafeCertificateData: String, dataSign: String, completion: @escaping (Result<Data, Error>) -> Void) {
	   
	   DispatchQueue.global(qos: .background).async {
		  var post = ""
		  post += "\(PARAMETER_NAME_OPERATION)=\(OPERATION_PUT)&"
		  post += "\(PARAMETER_NAME_VERSION)=\(PARAMETER_NAME_VERSION_1_0)&"
		  post += "\(PARAMETER_NAME_ID)=\(docId)&"
		  
		  // Encrypt signature
		  guard let signdata = Base64Utils.decode(dataSign, urlSafe: true) else {
			 completion(.failure(NSError(domain: "Error",code: -1,userInfo: [NSLocalizedDescriptionKey:NSLocalizedString("error_proceso_firma",bundle: Bundle.main,comment: "")])))
			 return
		  }
		  let encryptedSignDataB64 = DesCypher.cypherData(signdata, sk: cipherKey.data(using: .utf8)!)
		  
		  // Encrypt certificate
		  let certificateString = Base64Utils.urlSafeEncode(base64UrlSafeCertificateData)
		  guard let dataCertificate = Base64Utils.decode(certificateString, urlSafe: true) else {
			 completion(.failure(NSError(domain: "Error",code: -1,userInfo: [NSLocalizedDescriptionKey:NSLocalizedString("error_proceso_firma",bundle: Bundle.main,comment: "")])))
			 return
		  }
		  let encryptedCertificateDataB64 = DesCypher.cypherData(dataCertificate, sk: cipherKey.data(using: .utf8)!)
		  
		  // Concatenate encrypted data
		  let encryptedDataB64 = "\(encryptedCertificateDataB64 ?? "")|\(encryptedSignDataB64 ?? "")"
		  post += "\(PARAMETER_NAME_DAT)=\(encryptedDataB64)"
		  
		  // Encode the post string
		  guard let postData = post.data(using: .utf8, allowLossyConversion: true) else {
			 completion(.failure(NSError(domain: "Error",code: -1,userInfo: [NSLocalizedDescriptionKey:NSLocalizedString("error_proceso_firma",bundle: Bundle.main,comment: "")])))
			 return
		  }
		  
		  let postLength = "\(postData.count)"
		  
		  // Create URL request
		  guard let requestUrl = URL(string: urlServlet) else {
			 completion(.failure(NSError(domain: "Error",code: -1,userInfo: [NSLocalizedDescriptionKey:NSLocalizedString("error_url_servidor",bundle: Bundle.main,comment: "")])))
			 return
		  }
		  var request = URLRequest(url: requestUrl, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30.0)
		  request.httpMethod = "POST"
		  request.setValue(postLength, forHTTPHeaderField: "Content-Length")
		  request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
		  request.setValue("Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)", forHTTPHeaderField: "User-Agent")
		  request.setValue("text/plain,text/html,application/xhtml+xml,application/xml", forHTTPHeaderField: "Accept")
		  request.httpBody = postData
		  
		  let session = URLSession.shared
		  let task = session.dataTask(with: request) { data, response, error in
			 DispatchQueue.main.async {
				if let error = error {
				    print("Error Storing data: \(error)")
				    completion(.failure(error))
				    return
				}
				
				guard let data = data, let responseString = String(data: data, encoding: .utf8) else {
				    completion(.failure(NSError(domain: "Error",code: -1,userInfo: [NSLocalizedDescriptionKey:NSLocalizedString("error_proceso_firma",bundle: Bundle.main,comment: "")])))
				    return
				}
				
				if responseString.hasPrefix("OK") {
				    completion(.success(data))
				} else {
				    print("Failed to send certificate: \(responseString)")
				    completion(.failure(NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: responseString])))
				}
			 }
		  }
		  task.resume()
	   }
    }
}
