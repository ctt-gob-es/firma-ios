//
//  DisabledInteractionPDF.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 11/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class DisabledInteractionPDF: PDFView {
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
