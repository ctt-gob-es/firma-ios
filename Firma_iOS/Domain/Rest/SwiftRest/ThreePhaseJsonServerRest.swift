//
//  ThreePhaseJsonServerRest.swift
//  Autofirma
//
//  Created by Luis Nicieza on 17/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

/// Servidor trifásico JSON. Utilizado par el batch
class ThreePhaseJsonServerRest {
    
    func bachPresign(
        urlPresign: String?,
        json: String?,
        certs: String?,
        completion: @escaping ([String : Any]?, ErrorInfo?) -> Void
    ) {
        
        let safeJson = Base64Utils.urlSafeEncode(json)
        let safeCerts = Base64Utils.urlSafeEncode(certs).replacingOccurrences(of: "\n", with: "")
        
        let parameters = [
            "json": safeJson ?? "",
            "certs": safeCerts
        ]
        
        if let request = NetworkUtility.shared.createPostRequest(url: urlPresign!, parameters: parameters) {
            let session = NetworkManager.shared.getSession()
            let task = session.dataTask(with: request) { data, response, error in
                
                if let _ = error {
                    completion(nil, ErrorCodes.CommunicationErrorCodes.jsonBatchThreePhasePresignErrorConnection.info)
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                    completion(nil, ErrorCodes.ThirdPartySoftwareErrorCodes.threePhaseServerPresignErrorHTTPResponse.info);
                    return
                }
                
                guard let data = data else {
                    completion(nil, ErrorCodes.ThirdPartySoftwareErrorCodes.threePhaseServerPresignErrorResponseFormat.info);
                    return
                }
                
                do {
                    // Intentamos convertir el `data` a un diccionario.
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        // Si la conversión es exitosa, pasamos el diccionario al completion.
                        completion(json, nil)
                    } else {
                        // Si no es un diccionario, lanzamos un error.
                        completion(nil, ErrorCodes.ThirdPartySoftwareErrorCodes.threePhaseServerPresignErrorResponseFormatDictionary.info);
                        
                    }
                } catch {
                    // Si hubo un error al intentar convertir el `data` a un JSON.
                    completion(nil, ErrorCodes.ThirdPartySoftwareErrorCodes.threePhaseServerPresignErrorResponseFormat.info);
                }
            }
            task.resume()
        }
    }
        
        
    func bachPostsign(
        urlPostsign: String?,
        json: String?,
        certs: String?,
        tridata: String?,
        completion: @escaping ([String : Any]?, ErrorInfo?) -> Void
    ) {
        
        let safeJson = Base64Utils.urlSafeEncode(json)
        let safeCerts = Base64Utils.urlSafeEncode(certs).replacingOccurrences(of: "\n", with: "")
        let safeTridata = Base64Utils.urlSafeEncode(tridata)
        
        let parameters = [
            "json": safeJson ?? "",
            "certs": safeCerts,
            "tridata": safeTridata ?? ""
        ]
        
        if let request = NetworkUtility.shared.createPostRequest(url: urlPostsign!, parameters: parameters) {
            let session = NetworkManager.shared.getSession()
            let task = session.dataTask(with: request) { data, response, error in
                
                if let _ = error {
                    completion(nil, ErrorCodes.CommunicationErrorCodes.jsonBatchThreePhasePostsignErrorConnection.info)
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                    completion(nil, ErrorCodes.ThirdPartySoftwareErrorCodes.threePhaseServerPostsignErrorHTTPResponse.info);
                    return
                }
                
                guard let data = data else {
                    completion(nil, ErrorCodes.ThirdPartySoftwareErrorCodes.threePhaseServerPostsignErrorResponseFormat.info);
                    return
                }
                
                do {
                    // Intentamos convertir el `data` a un diccionario.
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        // Si la conversión es exitosa, pasamos el diccionario al completion.
                        completion(json, nil)
                    } else {
                        // Si no es un diccionario, lanzamos un error.
                        completion(nil, ErrorCodes.ThirdPartySoftwareErrorCodes.threePhaseServerPostsignErrorResponseFormatDictionary.info);
                        
                    }
                } catch {
                    // Si hubo un error al intentar convertir el `data` a un JSON.
                    completion(nil, ErrorCodes.ThirdPartySoftwareErrorCodes.threePhaseServerPostsignErrorResponseFormat.info);
                }
            }
            task.resume()
        }
        
    }
}
