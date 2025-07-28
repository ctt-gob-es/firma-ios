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
    @Binding var document: PDFDocument?  // Observe changes to document
    @Binding var annotations: [PDFAnnotation]
    @Binding var currentPageIndex: Int
    let totalPages: Int
    var onAnnotationLimitReached: (() -> Void)?
    var onPasswordPrompt: (() -> Void)?
    
    func makeUIView(context: Context) -> PDFView {
	   let pdfView = DisabledInteractionPDF()
	   pdfView.autoScales = true
	   pdfView.displayMode = .singlePage
	   pdfView.displayDirection = .horizontal
	   pdfView.backgroundColor = .white
	   pdfView.usePageViewController(false, withViewOptions: nil)

	   if let document = document {
		  pdfView.document = document
		  pdfView.go(to: document.page(at: currentPageIndex) ?? document.page(at: 0)!)
	   }

	   let panGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePan(_:)))
	   pdfView.addGestureRecognizer(panGesture)

	   context.coordinator.pdfView = pdfView
	   return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
	   // Reload the document in case it was updated with a correct password
	   if let document = document, uiView.document != document {
		  DispatchQueue.main.async {
			 uiView.document = document
			 uiView.autoScales = true  // Ensure the PDF fills the screen
			 uiView.go(to: document.page(at: currentPageIndex) ?? document.page(at: 0)!)
		  }
	   }
	   
	   // Update the page if currentPageIndex changes
	   if let document = uiView.document, currentPageIndex < document.pageCount {
		  let page = document.page(at: currentPageIndex) ?? document.page(at: 0)!
		  if uiView.currentPage != page {
			 DispatchQueue.main.async {
				uiView.go(to: page)
			 }
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
		  guard let pdfView = pdfView, let currentPage = pdfView.currentPage else { return }

		  if !annotations.isEmpty {
			 onAnnotationLimitReached?()
			 return
		  }

		  let touchLocation = gestureRecognizer.location(in: pdfView)
		  let pdfLocation = pdfView.convert(touchLocation, to: currentPage)

		  let pageBounds = currentPage.bounds(for: pdfView.displayBox)
		  guard pageBounds.contains(pdfLocation) else { return }

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

		  default:
			 break
		  }
	   }
    }
}
