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
			 .accessibilityHidden(true)
		  AccessibleText(content: text)
			 .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
		  
		  Spacer()
		  if let detailText = detailText {
			 AccessibleText(content: detailText.uppercased())
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
	   .accessibilityElement(children: .ignore)
	   .accessibilityLabel(Text(text))
	   .accessibilityValue(Text(localizedLanguageName(from: detailText)))
	   .accessibilityAddTraits(.isButton)
    }
    
    private func localizedLanguageName(from code: String?) -> String {
	   guard let code = code else { return "" }
	   if let language = LocalizedLanguage.allLanguages.first(where: { $0.code == code }) {
		  return language.name
	   }
	   return code
    }
}

struct SettingsSection: Identifiable {
    let id = UUID()
    let header: String
    let rows: [SettingsRowItem]
}

struct SettingsRowItem: Identifiable {
    let id = UUID()
    let icon: String
    let text: String
    let detailText: String?
    let destination: AnyView
    
    init(icon: String, text: String, detailText: String? = nil, destination: AnyView) {
	   self.icon = icon
	   self.text = text
	   self.detailText = detailText
	   self.destination = destination
    }
}
