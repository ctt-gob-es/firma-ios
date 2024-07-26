//
//  PseudonymModalView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 26/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

struct PseudonymModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var shouldSign: Bool
    
    var body: some View {
	   VStack(spacing: 10) {
		  HStack {
			 Image("info_red")
				.resizable()
				.scaledToFit()
				.frame(width: 64, height: 64)
			 Spacer()
		  }
		  .padding(.leading)
		  
		  VStack(alignment: .leading, spacing: 0) {
			 AccessibleText(content: NSLocalizedString("pseudonym_modal_title", bundle: Bundle.main, comment: ""))
				.titleStyleBlack(
				    foregroundColor: ColorConstants.Text.primary,
				    alignment: .center
				)
				.accessibilityAddTraits(.isHeader)
			 
			 AccessibleText(content: NSLocalizedString("pseudonym_modal_description", bundle: Bundle.main, comment: ""))
				.regularStyle(
				    foregroundColor: ColorConstants.Text.secondary,
				    alignment: .leading
				)
			 
			 HStack {
				Spacer()
				Button(action: {
				    self.presentationMode.wrappedValue.dismiss()
				}) {
				    AccessibleText(content: NSLocalizedString("change_certificate_button_title", bundle: Bundle.main, comment: ""))
					   .boldStyleSmall(foregroundColor: ColorConstants.Background.buttonEnabled)
					   .underline()
				}
				Spacer()
			 }
			 .padding(.top, 32)
		  }
		  .padding(.horizontal)
		  
		  Spacer()
		  
		  VStack(spacing: 10) {
			 Button(action: {
				self.presentationMode.wrappedValue.dismiss()
				shouldSign.toggle()
			 }) {
				AccessibleText(content: NSLocalizedString("accept_button_title", bundle: Bundle.main, comment: ""))
			 }
			 .buttonStyle(CustomButtonStyle(isEnabled: true))
		  }
	   }
	   .padding()
	   .background(Color.white)
	   .cornerRadius(10)
    }
}
