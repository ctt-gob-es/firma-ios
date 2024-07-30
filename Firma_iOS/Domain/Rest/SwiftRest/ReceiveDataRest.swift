//
//  ReceiveDataRest.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 30/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

import Foundation

class ReceiveDataRest {
    func performRestRequest(
	   rtServletCert: String?,
	   fileIdCert: String?,
	   completion: @escaping (Result<Data, Error>) -> Void
    ) {
	   var post = ""
	   post += PARAMETER_NAME_OPERATION + HTTP_EQUALS + OPERATION_GET + HTTP_AND
	   post += PARAMETER_NAME_VERSION + HTTP_EQUALS + PARAMETER_NAME_VERSION_1_0 + HTTP_AND
	   post += PARAMETER_NAME_ID + HTTP_EQUALS + (fileIdCert ?? "")
	   
	   guard let postData = post.data(using: .utf8, allowLossyConversion: true) else {
		  completion(.failure(NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid post data"])))
		  return
	   }
	   
	   let postLength = String(postData.count)
	   
	   guard let requestUrl = URL(string: rtServletCert ?? "") else {
		  completion(.failure(NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
		  return
	   }
	   
	   var request = URLRequest(url: requestUrl, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30.0)
	   request.httpMethod = POST
	   request.setValue(postLength, forHTTPHeaderField: "Content-Length")
	   request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
	   request.setValue("Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)", forHTTPHeaderField: "User-Agent")
	   request.setValue("text/plain,text/html,application/xhtml+xml,application/xml", forHTTPHeaderField: "Accept")
	   
	   request.httpBody = postData
	   
	   let task = URLSession.shared.dataTask(with: request) { data, response, error in
		  guard let data = data, error == nil else {
			 print("Error: \(error?.localizedDescription ?? "No data")")
			 completion(.failure(NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_url_servidor", bundle: Bundle.main, comment: "")])))
			 return
		  }
		  completion(.success(data))
	   }
	   task.resume()
    }
}
