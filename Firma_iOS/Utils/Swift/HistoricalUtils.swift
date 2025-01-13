//
//  HistoricalUtils.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 9/1/25.
//  Copyright © 2025 Solid GEAR. All rights reserved.
//

import Foundation

class HistoricalUtils {
    static func getTextToShowFromHistory(history: History) -> String {
	   let operationKey = history.operation ?? "unknown_operation"
	   let localizedOperation = NSLocalizedString("operation_\(operationKey)", bundle: Bundle.main, comment: "")
	   let returnURL = history.returnURL
	   let appname = history.externalApp
	   let defaultFilename = NSLocalizedString("default_autofirma_document_name", bundle: Bundle.main, comment: "")
	   let filename = history.filename ?? ""
	   // Treat filename as empty if it's equal to the default localized filename
	   let hasFilename = !filename.isEmpty && filename != defaultFilename
	   
	   if [OPERATION_SIGN, OPERATION_COSIGN, OPERATION_COUNTERSIGN].contains(operationKey) {
		  if returnURL != nil {
			 // External app
			 if let appname = appname {
				return hasFilename
				? String(format: NSLocalizedString("history_app_name_file", bundle: Bundle.main, comment: ""), localizedOperation, appname, filename)
				: String(format: NSLocalizedString("history_app_name_no_file", bundle: Bundle.main, comment: ""), localizedOperation, appname)
			 } else {
				return hasFilename
				? String(format: NSLocalizedString("history_no_app_name_file", bundle: Bundle.main, comment: ""), localizedOperation, filename)
				: String(format: NSLocalizedString("history_no_app_name_no_file", bundle: Bundle.main, comment: ""), localizedOperation)
			 }
		  } else {
			 // Web operations
			 if let appname = appname {
				return hasFilename
				? String(format: NSLocalizedString("history_web_app_name_file", bundle: Bundle.main, comment: ""), localizedOperation, appname, filename)
				: String(format: NSLocalizedString("history_web_app_name_no_file", bundle: Bundle.main, comment: ""), localizedOperation, appname)
			 } else {
				return hasFilename
				? String(format: NSLocalizedString("history_web_no_app_name_file", bundle: Bundle.main, comment: ""), localizedOperation, filename)
				: String(format: NSLocalizedString("history_web_no_app_name_no_file", bundle: Bundle.main, comment: ""), localizedOperation)
			 }
		  }
	   } else if operationKey == OPERATION_BATCH {
		  // Batch operations
		  if returnURL != nil {
			 if let appname = appname {
				return String(format: NSLocalizedString("history_batch_app_name", bundle: Bundle.main, comment: ""), appname)
			 } else {
				return NSLocalizedString("history_batch_no_app_name", bundle: Bundle.main, comment: "")
			 }
		  } else {
			 if let appname = appname {
				return String(format: NSLocalizedString("history_web_batch_app_name", bundle: Bundle.main, comment: ""), appname)
			 } else {
				return NSLocalizedString("history_web_batch_no_app_name", bundle: Bundle.main, comment: "")
			 }
		  }
	   } else {
		  return NSLocalizedString("history_unknown_operation", bundle: Bundle.main, comment: "")
	   }
    }
    
    static func registerLocalizationKeys() {
	   _ = NSLocalizedString("operation_sign", bundle: Bundle.main, comment: "Operation: Sign")
	   _ = NSLocalizedString("operation_cosign", bundle: Bundle.main, comment: "Operation: Co-sign")
	   _ = NSLocalizedString("operation_countersign", bundle: Bundle.main, comment: "Operation: Counter-sign")
	   _ = NSLocalizedString("operation_batch", bundle: Bundle.main, comment: "Operation: Batch")
	   _ = NSLocalizedString("operation_unknown_operation", bundle: Bundle.main, comment: "Operation: Unknown")
    }
}
