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
		  completion(.failure(ErrorGenerator.generateError(from: InternalSoftwareErrorCodes.generalSoftwareError)))
		  return
	   }
        
        let parameters = [
            PARAMETER_NAME_OPERATION: OPERATION_PUT,
            PARAMETER_NAME_VERSION: PARAMETER_NAME_VERSION_1_0,
            PARAMETER_NAME_ID: docId,
            PARAMETER_NAME_DAT: error
        ]
	   
        if let request = NetworkUtility.shared.createPostRequest(url: urlServlet, parameters: parameters) {
            let session = NetworkManager.shared.getSession()
            
            let task = session.dataTask(with: request) { data, response, error in
               if let error = error {
                  completion(.failure(error))
               } else if let data = data {
                  completion(.success(data))
               }
            }
            
            task.resume()
        }
    }
}
