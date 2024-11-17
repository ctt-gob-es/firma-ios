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
        let parameters = [
            PARAMETER_NAME_OPERATION: OPERATION_GET,
            PARAMETER_NAME_VERSION: PARAMETER_NAME_VERSION_1_0,
            PARAMETER_NAME_ID: fileIdCert ?? ""
        ]
        
        if let request = NetworkUtility.shared.createPostRequest(url: rtServletCert!, parameters: parameters) {
            let session = NetworkManager.shared.getSession()
            let task = session.dataTask(with: request) { data, response, error in
              guard let data = data, error == nil else {
                 print("Error: \(error?.localizedDescription ?? "No data")")
                 completion(.failure(ErrorGenerator.generateError(from: ThirdPartySoftwareErrorCodes.generalThirdPartyError)))
                 return
              }
              completion(.success(data))
           }
           task.resume()
        }
        
    }
}
