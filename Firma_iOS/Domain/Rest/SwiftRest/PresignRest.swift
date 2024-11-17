//
//  PresignRest.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 24/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class PresignRest {
    func performPresignRequest(
	   operation: String,
	   datosInUse: String,
	   signFormat: String,
	   signAlgoInUse: String,
	   certificateData: String,
	   extraParams: String?,
	   triphasicServerURL: String?,
	   rtServlet: String?,
	   completion: @escaping (Result<String, Error>) -> Void) {
		  
	   /*var post = "\(PARAMETER_NAME_OPERATION)=\(OPERATION_PRESIGN)&"
	   post += "\(PARAMETER_NAME_COPERATION)=\(operation)&"
	   post += "\(PARAMETER_NAME_DOCID)=\(datosInUse)&"
	   post += "\(PARAMETER_NAME_FORMAT)=\(signFormat)&"
	   post += "\(PARAMETER_NAME_ALGORITHM)=\(signAlgoInUse)&"
	   
	   let encodedCertificate = Base64Utils.urlSafeEncode(certificateData).replacingOccurrences(of: "\n", with: "")
	   post += "\(PARAMETER_NAME_CERT)=\(encodedCertificate)"
	   
	   if let extraParams = extraParams {
		  post += "&\(PARAMETER_NAME_EXTRA_PARAM)=\(extraParams)"
	   }
		  
	   guard let postData = post.data(using: .utf8) else {
		  completion(.failure(ErrorGenerator.generateError(from: InternalSoftwareErrorCodes.generalSoftwareError)))
		  return
	   }
	   
	   let postLength = String(postData.count)
	   
	   guard let requestUrl = SingleSignUseCase.getDefaultTriphaseServer(triphasicServerURL: triphasicServerURL, rtServlet: rtServlet) else {
		  completion(.failure(ErrorGenerator.generateError(from: CommunicationErrorCodes.threePhaseSignatureError)))
		  return
	   }
	   
	   var request = URLRequest(url: requestUrl, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30.0)
	   request.httpMethod = "POST"
	   request.setValue(postLength, forHTTPHeaderField: "Content-Length")
	   request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
	   request.setValue("Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)", forHTTPHeaderField: "User-Agent")
	   request.setValue("text/plain,text/html,application/xhtml+xml,application/xml", forHTTPHeaderField: "Accept")
	   request.httpBody = postData*/
	   
            
        let encodedCertificate = Base64Utils.urlSafeEncode(certificateData).replacingOccurrences(of: "\n", with: "")
        var parameters = [
            PARAMETER_NAME_OPERATION: OPERATION_PRESIGN,
            PARAMETER_NAME_COPERATION: operation,
            PARAMETER_NAME_FORMAT: signFormat,
            PARAMETER_NAME_DOCID : datosInUse,
            PARAMETER_NAME_ALGORITHM: signAlgoInUse,
            PARAMETER_NAME_CERT: encodedCertificate
        ]
            
        if let extraParams = extraParams {
            parameters[PARAMETER_NAME_EXTRA_PARAM] = extraParams
        }
            
        guard let requestUrl = getDefaultTriphaseServer(triphasicServerURL: triphasicServerURL, rtServlet: rtServlet) else {
           completion(.failure(ErrorGenerator.generateError(from: CommunicationErrorCodes.threePhaseSignatureError)))
           return
        }
            
        if let request = NetworkUtility.shared.createPostRequest(url: requestUrl, parameters: parameters) {
            let session = NetworkManager.shared.getSession()
            let task = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data, let responseString = String(data: data, encoding: .utf8) else {
                    completion(.failure(ErrorGenerator.generateError(from: InternalSoftwareErrorCodes.signingError)))
                    return
                }
                
                completion(.success(responseString))
            }
            
            task.resume()
        }
    }
    
    private func getDefaultTriphaseServer(triphasicServerURL: String?, rtServlet: String?) -> String? {
        if let triphasicServerURL = triphasicServerURL {
            return triphasicServerURL
        } else if let rtServlet = rtServlet {
            var urlComponents = URLComponents(string: rtServlet)
            urlComponents?.query = nil
            urlComponents?.path = PATH_DEFAULT_TRIPHASE_SIGN
            return urlComponents?.url?.absoluteString
        } else {
            return nil
        }
    }
}
