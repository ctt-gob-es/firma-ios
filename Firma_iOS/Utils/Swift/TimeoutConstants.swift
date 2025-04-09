//
//  TimeoutConstants.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 9/4/25.
//  Copyright © 2025 Solid GEAR. All rights reserved.
//

import Foundation

struct TimeoutConstants {
    static let defaultTimeout: Int = 5
    static let availableOptions: [Int] = [ 5, 15, 30, 60, 120 ]

    static func isDefault(_ value: Int) -> Bool {
	   return value == defaultTimeout
    }

    static var stickyTimeoutInSeconds: Int {
	   let saved = UserDefaults.standard.integer(forKey: "cacheTimeout")
	   return (saved > 0 ? saved : defaultTimeout) * 60
    }
}
