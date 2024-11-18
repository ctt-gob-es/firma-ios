//
//  IntermediateServerRest.swift
//  Autofirma
//
//  Created by Luis Nicieza on 17/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

protocol IntermediateServletRestDelegate {
    func didSuccessDownloadDataFromServer(responseDict: [String:Any])
    func didErrorDownloadDataFromServer(_ errorInfo: ErrorInfo)
}

class IntermediateServerRest {
    
    // Este metodo no se deberia ejecutar. No creo que exista en el servidor intermedio
    func downloadDataJSON(
       rtServlet: String?,
       fileId: String?,
       completion: @escaping ([String:Any]?, ErrorInfo?) -> Void
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
                    completion(nil, ErrorCodes.CommunicationErrorCodes.jsonBatchDownloadErrorConnection.info)
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                    completion(nil, ErrorCodes.ThirdPartySoftwareErrorCodes.intermediateServerDownloadErrorHttpResponse.info)
                    return
                }
                
                guard let data = data else {
                    completion(nil, ErrorCodes.ThirdPartySoftwareErrorCodes.intermediateServerDownloadErrorResponseFormat.info)
                    return
                }
                
                do {
                    // Intentamos convertir el `data` a un diccionario.
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        // Si la conversión es exitosa, pasamos el diccionario al completion.
                        completion(json, nil)
                    } else {
                        // Si no es un diccionario, lanzamos un error.
                        completion(nil, ErrorCodes.ThirdPartySoftwareErrorCodes.intermediateServerDownloadErrorResponseFormat.info)
                        
                    }
                } catch {
                    // Si hubo un error al intentar convertir el `data` a un JSON.
                    completion(nil, ErrorCodes.ThirdPartySoftwareErrorCodes.intermediateServerDownloadErrorResponseFormat.info)

                }
           }
           task.resume()
        }
        
    }
    
    func downloadDataXML(
       rtServlet: String?,
       fileId: String?,
       completion: @escaping (Result<Data, ErrorInfo>) -> Void
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
                    completion(.failure( ErrorCodes.CommunicationErrorCodes.jsonBatchDownloadErrorConnection.info))
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                    completion(.failure( ErrorCodes.ThirdPartySoftwareErrorCodes.intermediateServerDownloadErrorHttpResponse.info))
                    return
                }
                
                guard let data = data else {
                    completion(.failure( ErrorCodes.ThirdPartySoftwareErrorCodes.intermediateServerDownloadErrorResponseFormat.info))
                    return
                }
                
                completion(.success(data))
                
           }
           task.resume()
        }
        
    }
    
    /*func storeData(dataString: String, certificateBase64: String?, stServlet: String, cipherKey: String, docId: String, completion: @escaping (ErrorInfo?) -> Void) {
        
        guard let data = Base64Utils.decode(dataString, urlSafe: true) else {
            completion(ErrorCodes.InternalSoftwareErrorCodes.generalSoftwareError.info)
            return
        }
        
        storeData(data: data, certificateBase64: certificateBase64, stServlet: stServlet, cipherKey: cipherKey, docId: docId, completion: completion)
    }
    
    func storeData(data: Data, certificateBase64: String?, stServlet: String,
                   cipherKey: String, docId: String, completion: @escaping (ErrorInfo?) -> Void) {
        
        // Cypher sign
        guard let encryptedSignDataB64 = DesCypher.cypherData(data, sk: cipherKey.data(using: .utf8)!) else {
            completion(ErrorCodes.InternalSoftwareErrorCodes.jsonBatchOperationCypherData.info)
            return
        }
        
        var encryptedDataB64 = encryptedSignDataB64
        
        if let certificateBase64 = certificateBase64 {
            // Cypher certificate
            let certificateString = Base64Utils.urlSafeEncode(certificateBase64)
            guard let dataCertificate = Base64Utils.decode(certificateString, urlSafe: true) else {
                completion(ErrorCodes.InternalSoftwareErrorCodes.jsonBatchOperationCypherCertificate.info)
                return
            }
            
            guard let encryptedCertificateDataB64 = DesCypher.cypherData(dataCertificate, sk: cipherKey.data(using: .utf8)!) else {
                completion(ErrorCodes.InternalSoftwareErrorCodes.jsonBatchOperationCypherCertificate.info)
                return
            }
            
            encryptedDataB64 = "\(encryptedSignDataB64)|\(encryptedCertificateDataB64)"
        }
        
        uploadDataIntermediateServer(dataUpload: encryptedDataB64, stServlet: stServlet, docId: docId, completion: completion)
    }*/
    
    func storeDataError(error: ErrorInfo, stServlet: String, docId: String, completion: @escaping (Result<Void, ErrorInfo>) -> Void) {
        
        uploadData(dataUpload: error.serverErrorMessage, stServlet: stServlet, docId: docId, completion: completion)
    }
    
    func uploadData(dataUpload: String, stServlet: String, docId: String, completion: @escaping (Result<Void, ErrorInfo>) -> Void) {
        
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
                     completion(.failure(ErrorCodes.CommunicationErrorCodes.jsonBatchUploadErrorConnection.info))
                     return
                 }
                 
                 if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                     completion(.failure(ErrorCodes.ThirdPartySoftwareErrorCodes.intermediateServerDownloadErrorHttpResponse.info))
                     return
                 }
                 
                 guard let data = data,  let responseString = String(data: data, encoding: .utf8), responseString.hasPrefix("OK") else {
                     completion(.failure(ErrorCodes.ThirdPartySoftwareErrorCodes.intermediateServerDownloadErrorResponseFormat.info))
                     return
                 }
                 
                 completion(.success(()))
                 
            }
            task.resume()
         }
         
     }
    
    
}
