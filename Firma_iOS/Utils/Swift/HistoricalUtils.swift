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
	   let hasFilename = history.filename != nil
	   let operationKey = history.operation ?? "unknown_operation"
	   let localizedOperation = NSLocalizedString("operation_\(operationKey)", bundle: Bundle.main, comment: "")
	   let returnURL = history.returnURL
	   let appname = history.externalApp
	   let filename = history.filename ?? ""
	   let docId = hasFilename ? String(format: NSLocalizedString("history_file_info_format", bundle: Bundle.main, comment: ""), filename) : ""

	   if [OPERATION_SIGN, OPERATION_COSIGN, OPERATION_COUNTERSIGN].contains(operationKey) {
		  if returnURL != nil {
			 if let appname = appname {
				return String(format: NSLocalizedString("history_operation_requested_by_app", bundle: Bundle.main, comment: ""), localizedOperation, appname, docId)
			 } else {
				return String(format: NSLocalizedString("history_operation_requested_by_other_app", bundle: Bundle.main, comment: ""), localizedOperation, docId)
			 }
		  } else {
			 if let appname = appname {
				return String(format: NSLocalizedString("history_web_operation_requested_by_app", bundle: Bundle.main, comment: ""), localizedOperation, appname, docId)
			 } else {
				return String(format: NSLocalizedString("history_web_operation", bundle: Bundle.main, comment: ""), localizedOperation, docId)
			 }
		  }
	   } else if operationKey == OPERATION_BATCH {
		  if returnURL != nil {
			 if let appname = appname {
				return String(format: NSLocalizedString("history_batch_sign_requested_by_app", bundle: Bundle.main, comment: ""), appname)
			 } else {
				return NSLocalizedString("history_batch_sign", bundle: Bundle.main, comment: "")
			 }
		  } else {
			 if let appname = appname {
				return String(format: NSLocalizedString("history_web_batch_sign_requested_by_app", bundle: Bundle.main, comment: ""), appname)
			 } else {
				return NSLocalizedString("history_web_batch_sign", bundle: Bundle.main, comment: "")
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
