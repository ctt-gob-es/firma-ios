//
//  FileUtils.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 18/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

class FileUtils {
    func handleFile(at url: URL) -> Bool {
	   let fileType = url.pathExtension.lowercased()
	   let allowedExtensions = ["p12", "pfx"]
	   
	   guard allowedExtensions.contains(fileType) else {
		  return false
	   }
	   
	   let fileManager = FileManager.default
	   
	   do {
		  let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
		  let fileDirectory = documentDirectory.appendingPathComponent(url.lastPathComponent)
		  
		  if fileManager.fileExists(atPath: fileDirectory.path) {
			 try fileManager.removeItem(at: fileDirectory)
		  }
		  
		  try fileManager.copyItem(at: url, to: fileDirectory)
		  return true
	   } catch {
		  return false
	   }
    }
    
    func findFiles(withExtensions extensions: [String]) -> [String] {
	   var matches: [String] = []
	   let fileManager = FileManager.default
	   
	   let documentsPath = NSHomeDirectory().appending("/Documents")
	   
	   do {
		  let contents = try fileManager.contentsOfDirectory(atPath: documentsPath)
		  
		  for item in contents {
			 let itemExtension = (item as NSString).pathExtension
			 if extensions.contains(itemExtension) {
				matches.append(item)
			 }
		  }
	   } catch {
		  print("Error reading contents of documents directory: \(error.localizedDescription)")
	   }
	   
	   return matches
    }
    
    static func convertURLFileToData(urls: [URL], completion: @escaping (Result<Data, Error>) -> Void) {
	   guard let url = urls.first else {
            completion(.failure(AppError.generalSoftwareError))
		  return
	   }
	   
	   guard url.startAccessingSecurityScopedResource() else {
            completion(.failure(AppError.generalSoftwareError))
		  return
	   }
	   
	   defer {
		  url.stopAccessingSecurityScopedResource()
	   }
	   
	   do {
		  let data = try Data(contentsOf: url)
		  completion(.success(data))
	   } catch let error {
		  completion(.failure(error))
	   }
    }
    
    static func getArchiveNameFromParameters(parameters: NSMutableDictionary?) -> String{
	   let archiveName = parameters?[PARAMETER_NAME_FILENAME] as? String
	   return (archiveName == nil ? NSLocalizedString("default_autofirma_document_name", bundle: Bundle.main, comment: "") : archiveName!) + (parameters?[PARAMETER_NAME_EXTENSION]  as? String ?? "")
    }
    
    static func hasArchiveFilename(parameters: NSMutableDictionary?) -> Bool{
	   let archiveName = parameters?[PARAMETER_NAME_FILENAME] as? String
	   return (archiveName == nil ? true : false)
    }
    
    static func getExtensionFromParameters(parameters: NSMutableDictionary?) -> String{
	   return parameters?[PARAMETER_NAME_EXTENSION] as? String ?? ""
    }
    
    static func fileType(from data: Data) -> String? {
	   var bytes = [UInt8](repeating: 0, count: 12)
        let byteCount = min(data.count, bytes.count)
	   data.copyBytes(to: &bytes, count: byteCount)
	   
        // Diccionario con firmas de archivos y extensiones
        let fileSignatures: [([UInt8], String)] = [
            ([0xFF, 0xD8, 0xFF], "jpg"),
            ([0x89, 0x50, 0x4E, 0x47], "png"),
            ([0x25, 0x50, 0x44, 0x46], "pdf"),
            ([0x50, 0x4B, 0x03, 0x04], "zip"),
            ([0x1F, 0x8B], "gz"),
            ([0x49, 0x49, 0x2A, 0x00], "tiff"),
            ([0x4D, 0x4D, 0x00, 0x2A], "tiff"),
            ([0x42, 0x4D], "bmp")
        ]
    
        for (signature, type) in fileSignatures {
            if bytes.starts(with: signature) {
                return type
            }
        }
	   return nil
    }
    
    static func isValidFileExtension(_ ext: String) -> Bool {
	   let validExtensions = ["jpg", "jpeg", "png", "pdf", "zip", "gz", "tiff", "bmp"]
	   return validExtensions.contains(ext.lowercased())
    }
}

struct GetHeightModifier: ViewModifier {
    @Binding var height: CGFloat
    
    func body(content: Content) -> some View {
	   content.background(
		  GeometryReader { geo -> Color in
			 DispatchQueue.main.async {
				height = geo.size.height
			 }
			 return Color.clear
		  }
	   )
    }
}
