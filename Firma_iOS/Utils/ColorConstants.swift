//
//  ColorConstants.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

struct ColorConstants {
    struct Background {
	   static let main = Color(hex: "#F5F7FA")
	   static let buttonEnabled = Color(hex: "#B44D3D")
	   static let buttonDisabled = Color(hex: "#E5E5E5")
    }
    
    struct Text {
	   static let primary = Color(hex: "#000000")
	   static let secondary = Color(hex: "#5B5B5B")
	   static let accent = Color(hex: "#A6301E")
	   static let background = Color(hex: "#F5F0EF")
	   static let onboarding = Color(hex: "#0E202FB3")
	   static let buttonDisabled = Color(hex: "#767676")
    }
    
    struct Border {
	   static let borderColor = Color(hex: "#767676")
    }
    
    struct Status {
	   static let success = Color(hex: "#54CF8F")
	   static let error = Color(hex: "#AB1228")
    }
}
