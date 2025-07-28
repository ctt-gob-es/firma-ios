//
//  DocumentPicker.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 15/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI
import UIKit
import UniformTypeIdentifiers

struct DocumentPicker: UIViewControllerRepresentable {
    class Coordinator: NSObject, UIDocumentPickerDelegate {
	   var parent: DocumentPicker
	   
	   init(parent: DocumentPicker) {
		  self.parent = parent
	   }
	   
	   func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
		  if let url = urls.first {
			 parent.onDocumentsPicked(url)
		  }
	   }
	   
	   func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
		  parent.onCancel()
	   }
    }
    
    var onDocumentsPicked: (URL) -> Void
    var onCancel: () -> Void
    
    func makeCoordinator() -> Coordinator {
	   Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
	   let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.data], asCopy: true)
	   documentPicker.delegate = context.coordinator
	   documentPicker.modalPresentationStyle = .fullScreen
	   
	   let containerViewController = UIViewController()
	   containerViewController.view.backgroundColor = UIColor.black
	   containerViewController.addChild(documentPicker)
	   containerViewController.view.addSubview(documentPicker.view)
	   documentPicker.view.frame = containerViewController.view.frame
	   documentPicker.didMove(toParent: containerViewController)
	   
	   return containerViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
	   
    }
}
