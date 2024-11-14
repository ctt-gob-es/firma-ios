//
//  PDFCoordinatesModalWrapper.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 11/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI
import PDFKit

struct PDFCoordinatesModalWrapper: View {
    let pdfData: Data
    @Binding var annotations: [PDFAnnotation]
    @Binding var password: String
    @Environment(\.presentationMode) private var presentationMode
    @State private var currentPageIndex = 0
    @State private var showToast = false
    @State private var showPasswordPrompt = false
    @State private var totalPages = 1
    @State private var document: PDFDocument? = nil
    @State private var showFieldError: Bool = false
    @State private var isFirstTime: Bool = true

    var body: some View {
	   NavigationView {
		  VStack {
			 ZStack {
				Color.white
				PDFCoordinatesModalView(
				    document: $document,
				    annotations: $annotations,
				    currentPageIndex: $currentPageIndex,
				    totalPages: totalPages,
				    onAnnotationLimitReached: {
					   showToastMessage()
				    },
				    onPasswordPrompt: {
					   showPasswordPrompt = true
				    }
				)

				if showToast {
				    ToastView(message: NSLocalizedString("pdf_coordinates_only_one_sign_available", bundle: Bundle.main, comment: ""))
					   .transition(.opacity)
					   .animation(.easeInOut)
				}

				if showPasswordPrompt {
				    VStack(alignment: .leading, spacing: 8) {
					   AccessibleText(content: NSLocalizedString("textfield_modal_title", bundle: Bundle.main, comment: ""))
						  .titleStyleBlack(
							 foregroundColor: ColorConstants.Text.primary,
							 alignment: .center
						  )
						  .accessibilityAddTraits(.isHeader)
					   
					   AccessibleText(content: NSLocalizedString("textfield_modal_description", bundle: Bundle.main, comment: ""))
						  .regularStyle(
							 foregroundColor: ColorConstants.Text.secondary,
							 alignment: .leading
						  )
					   
					   FloatingPlaceholderTextField(
						  placeholder: NSLocalizedString("password", bundle: Bundle.main, comment: ""),
						  errorplaceholder: NSLocalizedString("add_certificates_error_placeholder", bundle: Bundle.main, comment: ""),
						  text: $password,
						  showError: $showFieldError,
						  imageName: "xmark",
						  isSecureTextEntry: true,
						  validation: { password in
							 return showFieldError
						  }
					   )
					   
					   HStack {
						  Button(action: {
							 showPasswordPrompt = true
							 loadPDFDocument()
						  }) {
							 AccessibleText(content: NSLocalizedString("textfield_modal_button_title", bundle: Bundle.main, comment: ""))
						  }
						  .buttonStyle(CustomButtonStyle(isEnabled: true))
					   }
					   .padding(.top)
				    }
				    .padding()
				    .background(Color.white)
				    .cornerRadius(10)
				    .shadow(radius: 10)
				    .padding()
				}
			 }

			 HStack {
				Button(action: goToPreviousPage) {
				    Image(systemName: "chevron.left.circle")
				}
				.disabled(currentPageIndex <= 0)
				
				Text("\(currentPageIndex + 1) / \(totalPages)")
				    .foregroundColor(.gray)
				
				Button(action: goToNextPage) {
				    Image(systemName: "chevron.right.circle")
				}
				.disabled(currentPageIndex >= totalPages - 1)
			 }
			 .padding()
			 .background(Color.white)
		  }
		  .toolbar {
			 ToolbarItem(placement: .navigationBarLeading) {
				Button(action: {
				    resetAnnotations()
				    presentationMode.wrappedValue.dismiss()
				}) {
				    Image(systemName: "xmark")
				}
			 }
			 
			 ToolbarItem(placement: .principal) {
				AccessibleText(content: NSLocalizedString("pdf_coordinates_title", bundle: Bundle.main, comment: ""))
				    .mediumBoldStyle(
					   foregroundColor: ColorConstants.Text.primary,
					   alignment: .leading
				    )
			 }
			 
			 ToolbarItemGroup(placement: .navigationBarTrailing) {
				Button(action: resetAnnotations) {
				    Image(systemName: "arrow.counterclockwise")
				}
				Button(action: {
				    presentationMode.wrappedValue.dismiss()
				}) {
				    Image(systemName: "checkmark")
				}
			 }
		  }
		  .onAppear {
			 loadPDFDocument()
		  }
	   }
    }
    
    private func loadPDFDocument() {
	   if let newDocument = PDFDocument(data: pdfData) {
		  if newDocument.isEncrypted {
			 if newDocument.unlock(withPassword: password) {
				self.document = newDocument
				self.showPasswordPrompt = false
			 } else {
				self.showPasswordPrompt = true
				if isFirstTime {
				    isFirstTime = false
				} else {
				    self.showFieldError = true
				}
			 }
		  } else {
			 self.document = newDocument
			 self.showPasswordPrompt = false
		  }
		  self.totalPages = self.document?.pageCount ?? 1
	   }
    }

    private func showToastMessage() {
	   withAnimation {
		  showToast = true
	   }
	   DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
		  withAnimation {
			 showToast = false
		  }
	   }
    }
    
    private func goToPreviousPage() {
	   if currentPageIndex > 0 {
		  currentPageIndex -= 1
	   }
    }
    
    private func goToNextPage() {
	   if currentPageIndex < totalPages - 1 {
		  currentPageIndex += 1
	   }
    }
    
    private func resetAnnotations() {
	   annotations.forEach { annotation in
		  annotation.page?.removeAnnotation(annotation)
	   }
	   annotations.removeAll()
    }
}
