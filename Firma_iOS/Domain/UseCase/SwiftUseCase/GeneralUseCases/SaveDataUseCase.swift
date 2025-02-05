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
    func saveFileFromBase64Data(archiveName: String, base64Data: String, completion: @escaping (Result<URL, AppError>) -> Void) {
        
	   guard let data = Base64Utils.decode(base64Data, urlSafe: true) else {
            completion(.failure(AppError.dataSavingBase64Error))
		  return
	   }
	   
	   let fileExtension = FileUtils.fileType(from: data)
	   let tempDirectory = FileManager.default.temporaryDirectory
	   var archiveNameWithoutSpaces = archiveName.replacingOccurrences(of: " ", with: "")
	   
	   if !archiveName.contains("."), let fileExtension = fileExtension {
            archiveNameWithoutSpaces = archiveNameWithoutSpaces + "." + fileExtension
	   }
	   
        let fileURL = tempDirectory.appendingPathComponent(archiveNameWithoutSpaces)
        
	   do {
		  try data.write(to: fileURL)
		  completion(.success(URL(string: fileURL.absoluteString)!))
	   } catch {
            completion(.failure(AppError.dataSavingFileSaveDisk))
	   }
    }
}
