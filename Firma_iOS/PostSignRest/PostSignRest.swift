//
//  PostSignRest.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 24/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class PostSignRest {
    func postSign(operation: String, dict: [String: String], datosInUse: String, signFormat: String, signAlgoInUse: String, base64UrlSafeCertificateData: String, extraParams: String?, encodedData: Data, triphasicServerURL: String?, rtServlet: String?, completion: @escaping (Result<Data, Error>) -> Void) {
	   
	   var post = ""
	   
	   // Append parameters to the post string
	   post += "\(PARAMETER_NAME_OPERATION)=\(OPERATION_POSTSIGN)&"
	   post += "\(PARAMETER_NAME_COPERATION)=\(operation)&"
	   
	   if dict[PROPERTY_NAME_NEED_DATA] != STRING_FALSE {
		  post += "\(PARAMETER_NAME_DOCID)=\(datosInUse)&"
	   }
	   
	   post += "\(PARAMETER_NAME_FORMAT)=\(signFormat)&"
	   post += "\(PARAMETER_NAME_ALGORITHM)=\(signAlgoInUse)&"
	   post += "\(PARAMETER_NAME_CERT)=\(Base64Utils.urlSafeEncode(base64UrlSafeCertificateData) ?? "")&"
	   
	   if let extraParams = extraParams {
		  post += "\(PARAMETER_NAME_EXTRA_PARAM)=\(extraParams)&"
	   }
	   
	   let encodedString = Base64Utils.encode(encodedData, urlSafe: true)
	   post += "\(PROPERTY_NAME_SESSION_DATA_PREFIX)=\(encodedString ?? "")"
	   
	   guard let postData = post.data(using: .utf8, allowLossyConversion: true) else {
		  completion(.failure(NSError(domain: "PostSignRest", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to encode post data"])))
		  return
	   }
	   
	   let postLength = "\(postData.count)"
	   
	   // Get the triphasic server URL
	   guard let requestUrl = SingleSignUseCase.getDefaultTriphaseServer(triphasicServerURL: triphasicServerURL, rtServlet: rtServlet) else {
		  completion(.failure(NSError(domain: "PostSignRest", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to get triphasic server URL"])))
		  return
	   }
	   
	   var request = URLRequest(url: requestUrl, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30.0)
	   request.httpMethod = "POST"
	   request.setValue(postLength, forHTTPHeaderField: "Content-Length")
	   request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
	   request.setValue("Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)", forHTTPHeaderField: "User-Agent")
	   request.setValue("text/plain,text/html,application/xhtml+xml,application/xml", forHTTPHeaderField: "Accept")
	   request.httpBody = postData
	   
	   let task = URLSession.shared.dataTask(with: request) { data, response, error in
		  if let error = error {
			 completion(.failure(error))
		  } else if let data = data {
			 completion(.success(data))
		  }
	   }
	   
	   task.resume()
    }
}
