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
    var title: LocalizedStringKey
    
    var body: some View {
	   Button(action: {
		  self.isChecked.toggle()
	   }) {
		  HStack {
			 Image(systemName: isChecked ? "checkmark.square.fill" : "square")
				.foregroundColor(isChecked ? ColorConstants.Text.primary : Color.secondary)
			 Text(title)
				.foregroundColor(ColorConstants.Text.primary)
				.accessibility(label: Text(title))
				.accessibility(addTraits: .isButton)
		  }
	   }
	   .buttonStyle(PlainButtonStyle())
    }
}
