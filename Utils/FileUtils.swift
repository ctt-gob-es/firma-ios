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
    
    static func getMimeType(from data: Data) -> String? {
	   let temporaryDirectoryURL = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
	   let temporaryFileURL = temporaryDirectoryURL.appendingPathComponent(UUID().uuidString)
	   
	   do {
		  try data.write(to: temporaryFileURL)
		  
		  if let mimeType = UTType(filenameExtension: temporaryFileURL.pathExtension)?.preferredMIMEType {
			 try FileManager.default.removeItem(at: temporaryFileURL)
			 return mimeType
		  } else {
			 try FileManager.default.removeItem(at: temporaryFileURL)
			 return ".txt"
		  }
	   } catch {
		  print("Error determining MIME type: \(error.localizedDescription)")
		  return nil
	   }
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
