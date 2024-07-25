//
//  ReportErrorRest.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 24/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class ReportErrorRest {
    
    func reportError(urlServlet: String?, docId: String?, error: String, completion: @escaping (Result<Data, Error>) -> Void) {
	   
	   guard let urlServlet = urlServlet, let docId = docId else {
		  completion(.failure(NSError(domain: "ReportErrorRest", code: -1, userInfo: [NSLocalizedDescriptionKey: "Missing urlServlet or docId"])))
		  return
	   }
	   
	   // Create the POST data string
	   var post = ""
	   post += "\(PARAMETER_NAME_OPERATION)=\(OPERATION_PUT)&"
	   post += "\(PARAMETER_NAME_VERSION)=\(PARAMETER_NAME_VERSION_1_0)&"
	   post += "\(PARAMETER_NAME_ID)=\(docId)&"
	   post += "\(PARAMETER_NAME_DAT)=\(error)"
	   
	   // Encode the POST data
	   guard let postData = post.data(using: .utf8, allowLossyConversion: true) else {
		  completion(.failure(NSError(domain: "ReportErrorRest", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to encode post data"])))
		  return
	   }
	   
	   let postLength = "\(postData.count)"
	   
	   // Create the URL request
	   guard let requestUrl = URL(string: urlServlet) else {
		  completion(.failure(NSError(domain: "ReportErrorRest", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid urlServlet"])))
		  return
	   }
	   
	   var request = URLRequest(url: requestUrl, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30.0)
	   request.httpMethod = "POST"
	   request.setValue(postLength, forHTTPHeaderField: "Content-Length")
	   request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
	   request.setValue("Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)", forHTTPHeaderField: "User-Agent")
	   request.setValue("text/plain,text/html,application/xhtml+xml,application/xml", forHTTPHeaderField: "Accept")
	   request.httpBody = postData
	   
	   // Perform the request
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
