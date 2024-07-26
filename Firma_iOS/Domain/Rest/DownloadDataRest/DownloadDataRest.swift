//
//  DownloadDataRest.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 26/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class DownloadDataRest {
    
    func fetchData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
	   let task = URLSession.shared.dataTask(with: url) { data, response, error in
		  if let error = error {
			 completion(.failure(error))
			 return
		  }
		  
		  guard let data = data else {
			 let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])
			 completion(.failure(error))
			 return
		  }
		  
		  completion(.success(data))
	   }
	   task.resume()
    }
}
