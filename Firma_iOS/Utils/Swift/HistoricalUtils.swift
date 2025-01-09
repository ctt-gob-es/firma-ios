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
	   let operation = history.operation ?? "unknown_operation"
	   let returnURL = history.returnURL
	   let appname = history.externalApp
	   let docId = hasFilename ? "" : String(format: NSLocalizedString("history_file_info_format", bundle: Bundle.main, comment: ""), history.filename ?? "")

	   if [OPERATION_SIGN, OPERATION_COSIGN, OPERATION_COUNTERSIGN].contains(operation) {
		  if returnURL != nil {
			 if let appname = appname {
				return String(format: NSLocalizedString("history_operation_requested_by_app", bundle: Bundle.main, comment: ""), operation.uppercased(), appname, docId)
			 } else {
				return String(format: NSLocalizedString("history_operation_requested_by_other_app", bundle: Bundle.main, comment: ""), operation.uppercased(), docId)
			 }
		  } else {
			 if let appname = appname {
				return String(format: NSLocalizedString("history_web_operation_requested_by_app", bundle: Bundle.main, comment: ""), operation.uppercased(), appname, docId)
			 } else {
				return String(format: NSLocalizedString("history_web_operation", bundle: Bundle.main, comment: ""), operation.uppercased(), docId)
			 }
		  }
	   } else if operation == OPERATION_BATCH {
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
}
