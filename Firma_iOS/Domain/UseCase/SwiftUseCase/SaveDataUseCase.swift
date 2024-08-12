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
		  completion(.failure(NSError(domain: "Error", code: -1, userInfo: [
			 NSLocalizedDescriptionKey: NSLocalizedString("error_descarga_fichero", bundle: Bundle.main, comment: "")
		  ])))
		  return
	   }
	   
	   let fileExtension = FileUtils.fileType(from: data)
	   let tempDirectory = FileManager.default.temporaryDirectory
	   let archiveNameWithoutSpaces = archiveName.replacingOccurrences(of: " ", with: "")
	   let fileURL: URL
	   
	   if archiveName.contains(".") {
		  fileURL = tempDirectory.appendingPathComponent(archiveNameWithoutSpaces)
	   } else {
		  fileURL = tempDirectory.appendingPathComponent(archiveNameWithoutSpaces + "." + (fileExtension ?? ""))
	   }
	   
	   do {
		  try data.write(to: fileURL)
		  let escapedURL = fileURL.absoluteString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? fileURL.absoluteString
		  completion(.success(URL(string: escapedURL)!))
	   } catch {
		  completion(.failure(error))
	   }
    }
}
