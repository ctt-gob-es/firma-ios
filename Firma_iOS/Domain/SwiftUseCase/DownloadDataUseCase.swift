//
//  DownloadDataUseCase.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 26/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class DownloadDataUseCase {
    
    private let restClient: DownloadDataRest
    
    init(restClient: DownloadDataRest = DownloadDataRest()) {
	   self.restClient = restClient
    }
    
    func downloadDataFromURL(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
	   guard let url = URL(string: urlString) else {
		  let error = NSError(domain: "Error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
		  completion(.failure(error))
		  return
	   }
	   
	   restClient.fetchData(from: url) { result in
		  completion(result)
	   }
    }
}
