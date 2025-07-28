//
//  Color+Utils.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
	   var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
	   hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

	   var rgb: UInt64 = 0
	   Scanner(string: hexSanitized).scanHexInt64(&rgb)

	   let red, green, blue, alpha: Double
	   if hexSanitized.count == 8 {
		  red = Double((rgb >> 24) & 0xFF) / 255.0
		  green = Double((rgb >> 16) & 0xFF) / 255.0
		  blue = Double((rgb >> 8) & 0xFF) / 255.0
		  alpha = Double(rgb & 0xFF) / 255.0
	   } else {
		  red = Double((rgb >> 16) & 0xFF) / 255.0
		  green = Double((rgb >> 8) & 0xFF) / 255.0
		  blue = Double(rgb & 0xFF) / 255.0
		  alpha = 1.0
	   }

	   self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
	   var hexFormatted: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

	   if hexFormatted.hasPrefix("#") {
		  hexFormatted.remove(at: hexFormatted.startIndex)
	   }

	   assert(hexFormatted.count == 6, "Invalid hex code used.")

	   var rgbValue: UInt64 = 0
	   Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

	   let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
	   let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
	   let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

	   self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension Color {
    func toUIColor() -> UIColor {
	   let components = self.components()
	   return UIColor(
		  red: components.red,
		  green: components.green,
		  blue: components.blue,
		  alpha: components.alpha
	   )
    }

    private func components() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
	   let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
	   var hexNumber: UInt64 = 0
	   var r, g, b, a: CGFloat
	   let result = scanner.scanHexInt64(&hexNumber)
	   
	   if result {
		  r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
		  g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
		  b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
		  a = CGFloat(hexNumber & 0x000000ff) / 255
		  return (r, g, b, a)
	   } else {
		  return (0, 0, 0, 1)
	   }
    }
}
