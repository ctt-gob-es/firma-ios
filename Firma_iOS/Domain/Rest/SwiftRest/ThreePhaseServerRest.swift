//
//  ThreePhaseServerRest.swift
//  Autofirma
//
//  Created by Luis Nicieza on 18/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class ThreePhaseServerRest {
    
    func performPresignRequest(
       operation: String,
       datosInUse: String,
       signFormat: String,
       signAlgoInUse: String,
       certificateData: String,
       extraParams: String?,
       triphasicServerURL: String?,
       rtServlet: String?,
       completion: @escaping (Result<String, AppError>) -> Void) {
            
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
            completion(.failure(AppError.signThreePhaseNotRtServletNotFound))
           return
        }
            
        if let request = NetworkUtility.shared.createPostRequest(url: requestUrl, parameters: parameters) {
            let session = NetworkManager.shared.getSession()
            let task = session.dataTask(with: request) { data, response, error in
                if let _ = error {
                    completion(.failure(AppError.threePhaseServerPreSignCommunicationError))
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                    completion(.failure(AppError.threePhaseServerPresignErrorHTTPResponse))
                    return
                }
                
                guard let data = data, let responseString = String(data: data, encoding: .utf8) else {
                    completion(.failure(AppError.threePhaseServerPresignErrorResponseFormat))
                    return
                }
                
                completion(.success(responseString))
            }
            
            task.resume()
        }
    }
    
    func postSign(operation: String, dict: [String: String], datosInUse: String, signFormat: String, signAlgoInUse: String, base64UrlSafeCertificateData: String, extraParams: String?, encodedData: Data, triphasicServerURL: String?, rtServlet: String?, completion: @escaping (Result<String, AppError>) -> Void) {
        
        var parameters = [
            PARAMETER_NAME_OPERATION: OPERATION_POSTSIGN,
            PARAMETER_NAME_COPERATION: operation,
            PARAMETER_NAME_FORMAT: signFormat,
            PARAMETER_NAME_ALGORITHM: signAlgoInUse,
            PARAMETER_NAME_CERT: Base64Utils.urlSafeEncode(base64UrlSafeCertificateData) ?? "",
            PROPERTY_NAME_SESSION_DATA_PREFIX: Base64Utils.encode(encodedData, urlSafe: true) ?? ""
        ]
        
        if dict[PROPERTY_NAME_NEED_DATA] != STRING_FALSE {
            parameters[PARAMETER_NAME_DOCID] = datosInUse
        }
        
        if let extraParams = extraParams {
            parameters[PARAMETER_NAME_EXTRA_PARAM] = extraParams
        }
        
        guard let requestUrl = getDefaultTriphaseServer(triphasicServerURL: triphasicServerURL, rtServlet: rtServlet) else {
            completion(.failure(AppError.signThreePhaseNotRtServletNotFound))
           return
        }
        
        if let request = NetworkUtility.shared.createPostRequest(url: requestUrl, parameters: parameters) {
            let session = NetworkManager.shared.getSession()
            let task = session.dataTask(with: request) { data, response, error in
                
                if let _ = error {
                    completion(.failure(AppError.threePhaseServerPosSignCommunicationError))
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                    completion(.failure(AppError.threePhaseServerPostsignErrorHTTPResponse))
                    return
                }
                
                guard let data = data, let responseString = String(data: data, encoding: .utf8) else {
                    completion(.failure(AppError.threePhaseServerPostsignErrorResponseFormat))
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
