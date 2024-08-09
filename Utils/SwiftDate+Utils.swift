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
	   formatter.timeStyle = .short
	   return formatter
    }
    
    static var mediumDate: DateFormatter {
	   let formatter = DateFormatter()
	   formatter.dateStyle = .medium
	   formatter.timeStyle = .medium
	   return formatter
    }
    
    static var longDate: DateFormatter {
	   let formatter = DateFormatter()
	   formatter.dateStyle = .long
	   formatter.timeStyle = .long
	   return formatter
    }
}

extension Date {
    var shortFormatted: String {
	   let formatter = DateFormatter.shortDate
	   return formatter.string(from: self)
    }
    
    var mediumFormatted: String {
	   let formatter = DateFormatter.mediumDate
	   return formatter.string(from: self)
    }
    
    var longFormatted: String {
	   let formatter = DateFormatter.longDate
	   return formatter.string(from: self)
    }
}
