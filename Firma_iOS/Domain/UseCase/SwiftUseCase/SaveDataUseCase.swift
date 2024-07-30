//
//  SaveDataUseCase.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 26/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import MobileCoreServices

class SaveDataUseCase {
    func saveFileFromBase64Data(archiveName: String, base64Data: String, completion: @escaping (Result<URL, Error>) -> Void) {
	   guard let data = Base64Utils.decode(base64Data, urlSafe: true) else {
		  completion(.failure(NSError(domain: "Error",code: -1,userInfo: [NSLocalizedDescriptionKey:NSLocalizedString("error_descarga_fichero",bundle: Bundle.main,comment: "")])))
		  return
	   }
	   
	   let tempDirectory = FileManager.default.temporaryDirectory
	   let tempFileURL = tempDirectory.appendingPathComponent(archiveName)
	   
	   do {
		  try data.write(to: tempFileURL)
		  let escapedURL = tempFileURL.absoluteString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? tempFileURL.absoluteString
		  completion(.success(URL(string: escapedURL)!))
	   } catch {
		  completion(.failure(error))
	   }
    }
}
