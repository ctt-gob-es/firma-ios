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
    var fileURL: URL
    var onDismiss: (Result<URL, AppError>) -> Void

    func makeUIViewController(context: Context) -> UIViewController {
	   let viewController = UIViewController()
	   
	   let documentPicker = UIDocumentPickerViewController(forExporting: [fileURL], asCopy: true)
	   documentPicker.delegate = context.coordinator
	   
	   viewController.addChild(documentPicker)
	   viewController.view.addSubview(documentPicker.view)
	   documentPicker.didMove(toParent: viewController)
	   
	   documentPicker.view.translatesAutoresizingMaskIntoConstraints = false
	   NSLayoutConstraint.activate([
		  documentPicker.view.topAnchor.constraint(equalTo: viewController.view.topAnchor),
		  documentPicker.view.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
		  documentPicker.view.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor),
		  documentPicker.view.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor)
	   ])
	   
	   return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
	   Coordinator(self)
    }

    class Coordinator: NSObject, UIDocumentPickerDelegate {
	   var parent: DocumentSavingPicker

	   init(_ parent: DocumentSavingPicker) {
		  self.parent = parent
	   }

	   func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            parent.onDismiss(.failure(AppError.generalSoftwareError))
	   }

	   func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
		  if let url = urls.first {
			 parent.onDismiss(.success(url))
		  } else {
                parent.onDismiss(.failure(AppError.generalSoftwareError))
		  }
	   }
    }
}
