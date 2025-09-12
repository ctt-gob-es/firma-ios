//
//  CheckBoxView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

struct CheckBoxView: View {
    @Binding var isChecked: Bool
    var title: String

    var body: some View {
	   Toggle(isOn: $isChecked) {
		  AccessibleText(content: title)
	   }
	   .toggleStyle(CheckBoxToggleStyle())
    }
}

struct CheckBoxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
	   Button(action: { configuration.isOn.toggle() }) {
		  HStack(spacing: 8) {
			 Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
				.foregroundColor(configuration.isOn ? ColorConstants.Text.primary : .secondary)
			 configuration.label
				.foregroundColor(ColorConstants.Text.primary)
		  }
		  .contentShape(Rectangle())
	   }
	   .buttonStyle(.plain)
	   .accessibilityElement(children: .combine)
	   .accessibilityValue(
		  Text(
			 configuration.isOn
			 ? NSLocalizedString("checkbox.state.checked", tableName: "Accessibility", bundle: .main, comment: "")
			 : NSLocalizedString("checkbox.state.unchecked", tableName: "Accessibility", bundle: .main, comment: "")
		  )
	   )
    }
}
