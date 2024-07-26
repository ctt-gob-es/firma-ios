//
//  DocumentSavingPicker.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 26/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

import SwiftUI
import UIKit

struct DocumentSavingPicker: UIViewControllerRepresentable {
    var data: Data
    var fileName: String
    var completion: () -> Void

    func makeCoordinator() -> Coordinator {
	   Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
	   let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent(fileName)
	   try? data.write(to: tempURL)

	   let documentPicker = UIDocumentPickerViewController(forExporting: [tempURL])
	   documentPicker.delegate = context.coordinator
	   return documentPicker
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}

    class Coordinator: NSObject, UIDocumentPickerDelegate {
	   var parent: DocumentSavingPicker

	   init(_ parent: DocumentSavingPicker) {
		  self.parent = parent
	   }

	   func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
		  // Handle the document picker result if needed
		  parent.completion()
	   }

	   func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
		  // Handle cancellation
		  parent.completion()
	   }
    }
}
