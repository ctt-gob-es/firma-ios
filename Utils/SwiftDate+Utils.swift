//
//  SwiftDate+Utils.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 30/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

extension DateFormatter {
    static var shortDate: DateFormatter {
	   let formatter = DateFormatter()
	   formatter.dateStyle = .short
	   return formatter
    }
}

extension Date {
    var shortFormatted: String {
	   let formatter = DateFormatter.shortDate
	   return formatter.string(from: self)
    }
}
