//
//  FileUtils.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 18/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

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
}
