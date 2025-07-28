//
//  IntermediateServerRest.swift
//  Autofirma
//
//  Created by Luis Nicieza on 17/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class IntermediateServerRest {
    
    // Este metodo no se deberia ejecutar. No creo que exista en el servidor intermedio
    func downloadDataJSON(
       rtServlet: String?,
       fileId: String?,
       completion: @escaping ([String:Any]?, AppError?) -> Void
    ) {
        let parameters = [
            PARAMETER_NAME_OPERATION: OPERATION_GET,
            PARAMETER_NAME_VERSION: PARAMETER_NAME_VERSION_1_0,
            PARAMETER_NAME_ID: fileId ?? ""
        ]
        
        if let request = NetworkUtility.shared.createPostRequest(url: rtServlet!, parameters: parameters) {
            let session = NetworkManager.shared.getSession()
            let task = session.dataTask(with: request) { data, response, error in
              
                if let _ = error {
                    completion(nil, AppError.intermediateServerDownloadCommunicationError)
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                    completion(nil, AppError.intermediateServerDownloadErrorHttpResponse)
                    return
                }
                
                guard let data = data else {
                    completion(nil, AppError.intermediateServerDownloadErrorResponseFormat)
                    return
                }
                
                do {
                    // Intentamos convertir el `data` a un diccionario.
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        // Si la conversión es exitosa, pasamos el diccionario al completion.
                        completion(json, nil)
                    } else {
                        // Si no es un diccionario, lanzamos un error.
                        completion(nil, AppError.intermediateServerDownloadErrorResponseFormat)
                        
                    }
                } catch {
                    // Si hubo un error al intentar convertir el `data` a un JSON.
                    completion(nil, AppError.intermediateServerDownloadErrorResponseFormat)

                }
           }
           task.resume()
        }
        
    }
    
    func downloadDataXML(
       rtServlet: String?,
       fileId: String?,
       completion: @escaping (Result<Data, AppError>) -> Void
    ) {
        let parameters = [
            PARAMETER_NAME_OPERATION: OPERATION_GET,
            PARAMETER_NAME_VERSION: PARAMETER_NAME_VERSION_1_0,
            PARAMETER_NAME_ID: fileId ?? ""
        ]
        
        if let request = NetworkUtility.shared.createPostRequest(url: rtServlet!, parameters: parameters) {
            let session = NetworkManager.shared.getSession()
            let task = session.dataTask(with: request) { data, response, error in
              
                if let _ = error {
                    completion(.failure(AppError.intermediateServerDownloadCommunicationError))
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                    completion(.failure(AppError.intermediateServerDownloadErrorHttpResponse))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(AppError.intermediateServerDownloadErrorResponseFormat))
                    return
                }
                
                completion(.success(data))
                
           }
           task.resume()
        }
        
    }
    
    
    func storeDataError(error: AppError, stServlet: String, docId: String, completion: @escaping (Result<Void, AppError>) -> Void) {
        
        uploadData(dataUpload: error.serverErrorMessage, stServlet: stServlet, docId: docId, completion: completion)
    }
    
    func uploadData(dataUpload: String, stServlet: String, docId: String, completion: @escaping (Result<Void, AppError>) -> Void) {
        
         let parameters = [
             PARAMETER_NAME_OPERATION: OPERATION_PUT,
             PARAMETER_NAME_VERSION: PARAMETER_NAME_VERSION_1_0,
             PARAMETER_NAME_ID: docId,
             PARAMETER_NAME_DAT: dataUpload
         ]
         
         if let request = NetworkUtility.shared.createPostRequest(url: stServlet, parameters: parameters) {
             let session = NetworkManager.shared.getSession()
             let task = session.dataTask(with: request) { data, response, error in
               
                 if let _ = error {
                     completion(.failure(AppError.intermediateServerUploadCommunicationError))
                     return
                 }
                 
                 if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                     completion(.failure(AppError.intermediateServerDownloadErrorHttpResponse))
                     return
                 }
                 
                 guard let data = data,  let responseString = String(data: data, encoding: .utf8), responseString.hasPrefix("OK") else {
                     completion(.failure(AppError.intermediateServerDownloadErrorResponseFormat))
                     return
                 }
                 
                 completion(.success(()))
                 
            }
            task.resume()
         }
         
     }
    
    
}
