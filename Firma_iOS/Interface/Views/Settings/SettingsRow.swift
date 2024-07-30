//
//  SettingsRow.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 30/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

struct SettingsRow: View {
    let icon: String
    let text: String
    var detailText: String? = nil
    
    var body: some View {
	   HStack {
		  Image(systemName: icon)
			 .foregroundColor(ColorConstants.Text.accent)
		  AccessibleText(content: text)
			 .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
		  
		  Spacer()
		  if let detailText = detailText {
			 AccessibleText(content: detailText)
				.semiboldStyleSmall(foregroundColor: Color(hex: "#224D70"))
				.padding(.horizontal, 10)
				.background(
				    RoundedRectangle(cornerRadius: 12)
					   .stroke(Color(hex: "#224D70"), lineWidth: 1)
				)
			 
		  }
		  Image(systemName: "chevron.right")
			 .foregroundColor(ColorConstants.Text.accent)
	   }
	   .padding(.vertical, 8)
    }
}
