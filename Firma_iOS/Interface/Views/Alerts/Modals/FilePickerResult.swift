//
//  FilePickerResult.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 27/10/25.
//  Copyright © 2025 Solid GEAR. All rights reserved.
//


import SwiftUI
import UniformTypeIdentifiers

struct UnifiedDocumentPickerModifier: ViewModifier {
    @Binding var isPresented: Bool
    let allowedContentTypes: [UTType]
    let onResult: (Result<[URL], any Error>) -> Void
    let onCancelation: (() -> Void)
    
    @State private var didComplete = false

    func body(content: Content) -> some View {
	   if #available(iOS 17, *) {
		  content
			 .fileImporter(
				isPresented: $isPresented,
				allowedContentTypes: allowedContentTypes,
				allowsMultipleSelection: false,
				onCompletion: { result in
				    self.didComplete = true
				    onResult(result)
				},
				onCancellation: {
				    onCancelation()
				}
			 )
	   } else {
		  content
			 .fileImporter(
				isPresented: $isPresented,
				allowedContentTypes: allowedContentTypes,
				allowsMultipleSelection: false,
				onCompletion: { result in
				    self.didComplete = true
				    onResult(result)
				}
			 )
			 .onChange(of: isPresented) { newValue in
				if !newValue && !self.didComplete {
				    onCancelation()
				}
				if newValue {
				    self.didComplete = false
				}
			 }
	   }
    }
}

extension View {
    func unifiedDocumentPicker(
	   isPresented: Binding<Bool>,
	   allowedContentTypes: [UTType],
	   onResult: @escaping (Result<[URL], any Error>) -> Void,
	   onCancelation: @escaping (() -> Void)
    ) -> some View {
	   self.modifier(UnifiedDocumentPickerModifier(
		  isPresented: isPresented,
		  allowedContentTypes: allowedContentTypes,
		  onResult: onResult,
		  onCancelation: onCancelation
	   ))
    }
}
