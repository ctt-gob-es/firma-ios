//
//  TimeoutSelectionModal.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 9/4/25.
//  Copyright © 2025 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

struct TimeoutSelectionModalView: View {
    @Binding var contentHeight: CGFloat
    @Binding var selectedTimeout: Int
    @Binding var isPresented: Bool

    let timeoutOptions = TimeoutConstants.availableOptions
    
    @State private var tempSelection: Int = 1

    var body: some View {
	   ScrollView {
		  VStack(spacing: 0) {
			 VStack(spacing: 20) {
				HStack {
				    AccessibleText(content: NSLocalizedString("timeout_modal_title", bundle: Bundle.main, comment: ""))
					   .mediumBoldStyle(foregroundColor: ColorConstants.Text.primary)
					   .accessibilityAddTraits(.isHeader)
				    Spacer()
				    Button(action: {
					   isPresented = false
				    }) {
					   ExitButton()
				    }
				}
				
				VStack(spacing: 0) {
				    ForEach(timeoutOptions, id: \.self) { value in
					   Button(action: {
						  tempSelection = value
					   }) {
						  TimeCell(
							 language: "\(value)",
							 isSelected: tempSelection == value
						  )
					   }
				    }
				}

				Button(action: {
				    selectedTimeout = tempSelection
				    UserDefaults.standard.set(tempSelection, forKey: "cacheTimeout")
				    isPresented = false
				}) {
				    AccessibleText(content: NSLocalizedString("select_button_title", bundle: .main, comment: ""))
				}
				.buttonStyle(CustomButtonStyle(isEnabled: true))
				.padding(.top, 24)
			 }
			 .padding()
			 .background(
				GeometryReader { geometry in
				    Color.white.onAppear {
					   contentHeight = geometry.size.height
				    }
				}
			 )
			 .modifier(GetHeightModifier(height: $contentHeight))
			 .cornerRadius(10)
		  }
	   }
	   .onAppear {
		  tempSelection = selectedTimeout
	   }
    }
}

struct TimeCell: View {
    let language: String
    let isSelected: Bool

    var body: some View {
	   VStack(spacing: 0) {
		  VStack(alignment: .leading, spacing: 4) {
			 HStack {
				AccessibleText(content: language)
				    .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
				Spacer()
				
				if TimeoutConstants.isDefault(Int(language) ?? 0) {
				    Text(NSLocalizedString("default_label", bundle: .main, comment: ""))
					   .font(.footnote)
					   .fontWeight(.semibold)
					   .foregroundColor(ColorConstants.Text.primary)
					   .padding(.horizontal, 10)
					   .padding(.vertical, 2)
					   .background(
						  RoundedRectangle(cornerRadius: 12)
							 .fill(ColorConstants.Background.chip)
							 .overlay(
								RoundedRectangle(cornerRadius: 12)
								    .stroke(ColorConstants.Border.chip, lineWidth: 1)
							 )
					   )
				}

				if isSelected {
				    Image(systemName: "checkmark")
					   .foregroundColor(ColorConstants.Text.accent)
				}
			 }
		  }
		  .padding()
		  .background(isSelected ? Color(UIColor.systemGray6) : Color.white)
		  .cornerRadius(isSelected ? 10 : 0)
	   }
    }
}
