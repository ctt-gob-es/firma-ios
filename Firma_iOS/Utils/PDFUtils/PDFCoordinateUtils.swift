//
//  PDFCoordinateUtils.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 4/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class PDFCoordinateUtils {
    static func setCoordinatesFromAnnotation(signModel: SignModel, annotation: PDFAnnotation) {
	   let bounds = annotation.bounds
	   let key = "obfuscateUserIdentifiers"
	   let obfuscateUserIdentifiers = UserDefaults.standard.object(forKey: key) == nil ? true : UserDefaults.standard.bool(forKey: key)
	   
	   var newParams = [
		  "signaturePositionOnPageLowerLeftX": "\(Int(bounds.minX))",
		  "signaturePositionOnPageLowerLeftY": "\(Int(bounds.minY))",
		  "signaturePositionOnPageUpperRightX": "\(Int(bounds.maxX))",
		  "signaturePositionOnPageUpperRightY": "\(Int(bounds.maxY))",
		  "signaturePages": "\(annotation.page?.pageRef?.pageNumber ?? 1)"
	   ]
	   
	   newParams["obfuscateCertText"] = obfuscateUserIdentifiers ? "true" : "false"
	   
	   var mergedParams = signModel.dictExtraParams ?? [:]
	   newParams.forEach { key, value in
		  mergedParams[key] = value
	   }
	   
	   signModel.updateExtraParams(dict: mergedParams)
    }
}
