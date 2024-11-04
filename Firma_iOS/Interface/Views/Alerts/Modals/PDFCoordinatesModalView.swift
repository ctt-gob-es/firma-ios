//
//  PDFCoordinatesModalView.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 4/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI
import PDFKit

struct PDFCoordinatesModalView: UIViewRepresentable {
    let pdfData: Data
    @Binding var annotations: [PDFAnnotation]
    @Binding var currentPageIndex: Int
    let totalPages: Int
    var onAnnotationLimitReached: (() -> Void)?
    
    func makeUIView(context: Context) -> PDFView {
	   let pdfView = MyPDFView()
	   pdfView.autoScales = true
	   pdfView.displayMode = .singlePage
	   pdfView.displayDirection = .horizontal
	   pdfView.backgroundColor = .white
	   pdfView.usePageViewController(false, withViewOptions: nil)
	   
	   if let document = PDFDocument(data: pdfData) {
		  pdfView.document = document
		  pdfView.go(to: document.page(at: currentPageIndex) ?? document.page(at: 0)!)
		  
		  if document.pageCount == 1 {
			 pdfView.go(to: document.page(at: 0)!)
		  }
	   }
	   
	   let panGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePan(_:)))
	   pdfView.addGestureRecognizer(panGesture)
	   
	   context.coordinator.pdfView = pdfView
	   return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
	   if let document = uiView.document, currentPageIndex < document.pageCount {
		  let page = document.page(at: currentPageIndex) ?? document.page(at: 0)!
		  if uiView.currentPage != page {
			 uiView.go(to: page)
		  }
	   }
    }
    
    func makeCoordinator() -> Coordinator {
	   Coordinator(annotations: $annotations, currentPageIndex: $currentPageIndex, onAnnotationLimitReached: onAnnotationLimitReached)
    }
    
    class Coordinator: NSObject {
	   @Binding var annotations: [PDFAnnotation]
	   @Binding var currentPageIndex: Int
	   weak var pdfView: PDFView?
	   private var initialTouchPoint: CGPoint = .zero
	   private var temporaryAnnotation: PDFAnnotation?
	   var onAnnotationLimitReached: (() -> Void)?
	   
	   init(annotations: Binding<[PDFAnnotation]>, currentPageIndex: Binding<Int>, onAnnotationLimitReached: (() -> Void)?) {
		  _annotations = annotations
		  _currentPageIndex = currentPageIndex
		  self.onAnnotationLimitReached = onAnnotationLimitReached
	   }
	   
	   @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
		  guard let pdfView = pdfView, let currentPage = pdfView.currentPage else {
			 if let document = pdfView?.document, document.pageCount == 1 {
				pdfView?.go(to: document.page(at: 0)!)
			 }
			 return
		  }
		  
		  if !annotations.isEmpty {
			 onAnnotationLimitReached?()
			 return
		  }
		  
		  let pdfLocation = pdfView.convert(gestureRecognizer.location(in: pdfView), to: currentPage)
		  
		  switch gestureRecognizer.state {
		  case .began:
			 initialTouchPoint = pdfLocation
			 temporaryAnnotation = PDFAnnotation(bounds: CGRect(x: pdfLocation.x, y: pdfLocation.y, width: 0, height: 0), forType: .square, withProperties: nil)
			 temporaryAnnotation?.color = .blue
			 temporaryAnnotation?.border = PDFBorder()
			 temporaryAnnotation?.border?.lineWidth = 1.0
			 
			 currentPage.addAnnotation(temporaryAnnotation!)
			 
		  case .changed:
			 guard let temporaryAnnotation = temporaryAnnotation else { return }
			 
			 let x = min(initialTouchPoint.x, pdfLocation.x)
			 let y = min(initialTouchPoint.y, pdfLocation.y)
			 let width = abs(initialTouchPoint.x - pdfLocation.x)
			 let height = abs(initialTouchPoint.y - pdfLocation.y)
			 
			 temporaryAnnotation.bounds = CGRect(x: x, y: y, width: width, height: height)
			 
		  case .ended:
			 guard let temporaryAnnotation = temporaryAnnotation else { return }
			 
			 currentPage.removeAnnotation(temporaryAnnotation)
			 let finalAnnotation = PDFAnnotation(bounds: temporaryAnnotation.bounds, forType: .square, withProperties: nil)
			 finalAnnotation.color = .black
			 finalAnnotation.border = PDFBorder()
			 finalAnnotation.border?.lineWidth = 1.0
			 currentPage.addAnnotation(finalAnnotation)
			 annotations.append(finalAnnotation)
			 
			 if let symbolImage = UIImage(named: "signature") {
				let imageAnnotation = PDFImageAnnotation(image: symbolImage, bounds: temporaryAnnotation.bounds, properties: nil)
				currentPage.addAnnotation(imageAnnotation!)
				annotations.append(imageAnnotation!)
			 }
			 
			 self.temporaryAnnotation = nil
			 
		  default:
			 break
		  }
	   }
    }
}

struct PDFCoordinatesModalWrapper: View {
    let pdfData: Data
    @Binding var annotations: [PDFAnnotation]
    @Environment(\.presentationMode) private var presentationMode
    @State private var currentPageIndex = 0
    @State private var showToast = false
    private var totalPages: Int {
	   PDFDocument(data: pdfData)?.pageCount ?? 1
    }
    
    var body: some View {
	   NavigationView {
		  VStack {
			 ZStack {
				Color.white
				PDFCoordinatesModalView(
				    pdfData: pdfData,
				    annotations: $annotations,
				    currentPageIndex: $currentPageIndex,
				    totalPages: totalPages,
				    onAnnotationLimitReached: {
					   showToastMessage()
				    }
				)
				
				if showToast {
				    Text(NSLocalizedString("pdf_coordinates_only_one_sign_available", bundle: Bundle.main, comment: ""))
					   .padding()
					   .background(Color.black.opacity(0.7))
					   .foregroundColor(.white)
					   .cornerRadius(8)
					   .padding(.top, 50)
					   .transition(.opacity)
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
				Text(NSLocalizedString("pdf_coordinates_title", bundle: Bundle.main, comment: ""))
				    .font(.headline)
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

class MyPDFView: PDFView {

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
	   return false
    }

    override func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
	   if gestureRecognizer is UILongPressGestureRecognizer {
		  gestureRecognizer.isEnabled = false
	   }

	   super.addGestureRecognizer(gestureRecognizer)
    }

}
