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
        
        // Encrypt signature
        guard let signdata = Base64Utils.decode(dataSign, urlSafe: true) else {
            completion(.failure(ErrorGenerator.generateError(from: InternalSoftwareErrorCodes.jsonBatchOperationError)))
            return
        }
        let encryptedSignDataB64 = DesCypher.cypherData(signdata, sk: cipherKey.data(using: .utf8)!)
        
        // Encrypt certificate
        let certificateString = Base64Utils.urlSafeEncode(base64UrlSafeCertificateData)
        guard let dataCertificate = Base64Utils.decode(certificateString, urlSafe: true) else {
            completion(.failure(ErrorGenerator.generateError(from: InternalSoftwareErrorCodes.jsonBatchOperationError)))
            return
        }
        
        let encryptedCertificateDataB64 = DesCypher.cypherData(dataCertificate, sk: cipherKey.data(using: .utf8)!)
        let encryptedDataB64 = "\(encryptedCertificateDataB64 ?? "")|\(encryptedSignDataB64 ?? "")"
        
        let parameters = [
            PARAMETER_NAME_OPERATION: OPERATION_PUT,
            PARAMETER_NAME_VERSION: PARAMETER_NAME_VERSION_1_0,
            PARAMETER_NAME_ID: docId,
            PARAMETER_NAME_DAT: encryptedDataB64
        ]
        
        if let request = NetworkUtility.shared.createPostRequest(url: urlServlet, parameters: parameters) {
            let session = NetworkManager.shared.getSession()
            
            let task = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error Storing data: \(error)")
                    completion(.failure(error))
                    return
                }
                
                guard let data = data, let responseString = String(data: data, encoding: .utf8) else {
                    completion(.failure(ErrorCodes.InternalSoftwareErrorCodes.dataSavingError.info))
                    return
                }
                
                if responseString.hasPrefix("OK") {
                    completion(.success(data))
                } else {
                    print("Failed to send certificate: \(responseString)")
                    completion(.failure(ErrorCodes.FunctionalErrorCodes.signatureOperationError.info))
                }
            }
            
            task.resume()
        }
    }
}
