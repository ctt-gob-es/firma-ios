//
//  OperationResultContent.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 14/7/26.
//  Copyright © 2026 Solid GEAR. All rights reserved.
//

import Foundation

struct OperationResultContent {
    let isSuccess: Bool
    let iconName: String
    let title: String
    let description: String
    let continuationText: String
    var showRetryButton: Bool = false

    static func continuationText(appName: String?) -> String {
        if let appName = appName, !appName.isEmpty {
            return String(format: NSLocalizedString("operation_result_continue_with_app", bundle: Bundle.main, comment: ""), appName)
        }
        return NSLocalizedString("operation_result_continue_generic", bundle: Bundle.main, comment: "")
    }
}
