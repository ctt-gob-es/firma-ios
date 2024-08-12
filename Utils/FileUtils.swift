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
			 try fileManager.removeItem(at: fileDirectory)  // Remove the existing file
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
		  completion(.failure(NSError(domain: "URLConversion", code: 1, userInfo: [NSLocalizedDescriptionKey: "No URL found."])))
		  return
	   }
	   
	   guard url.startAccessingSecurityScopedResource() else {
		  completion(.failure(NSError(domain: "URLConversion", code: 2, userInfo: [NSLocalizedDescriptionKey: "Could not access security-scoped resource."])))
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
	   return (archiveName == nil ? NSLocalizedString(DEFAULT_NAME_DOCUMENT, bundle: Bundle.main, comment: "") : archiveName!) + (parameters?[PARAMETER_NAME_EXTENSION]  as? String ?? "")
    }
    
    static func getExtensionFromParameters(parameters: NSMutableDictionary?) -> String{
	   return parameters?[PARAMETER_NAME_EXTENSION] as? String ?? ""
    }
    
    static func fileType(from data: Data) -> String? {
	   var bytes = [UInt8](repeating: 0, count: 12)
	   data.copyBytes(to: &bytes, count: 12)
	   
	   if bytes.starts(with: [0xFF, 0xD8, 0xFF]) {
		  return "jpg"
	   } else if bytes.starts(with: [0x89, 0x50, 0x4E, 0x47]) {
		  return "png"
	   } else if bytes.starts(with: [0x25, 0x50, 0x44, 0x46]) {
		  return "pdf"
	   } else if bytes.starts(with: [0x50, 0x4B, 0x03, 0x04]) {
		  return "zip"
	   } else if bytes.starts(with: [0x1F, 0x8B]) {
		  return "gz"
	   } else if bytes.starts(with: [0x49, 0x49, 0x2A, 0x00]) || bytes.starts(with: [0x4D, 0x4D, 0x00, 0x2A]) {
		  return "tiff"
	   } else if bytes.starts(with: [0x42, 0x4D]) {
		  return "bmp"
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
