//
//  SignModalView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 15/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct SignModalView: View {
    @Binding var certificateSignAction: Bool
    @Binding var dniSignAction: Bool
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
	   VStack(spacing: 20) {
		  HStack {
			 AccessibleText(content: NSLocalizedString("sign_file_title", bundle: Bundle.main, comment: ""))
				.mediumBoldStyle(foregroundColor: ColorConstants.Text.primary)
				.accessibilityAddTraits(.isHeader)
			 Spacer()
			 Button(action: {
				self.presentationMode.wrappedValue.dismiss()
			 }) {
				ExitButton()
			 }
		  }
		  
		  VStack(alignment: .leading, spacing: 20) {
			 HStack {
				Image("documents")
				    .foregroundColor(ColorConstants.Background.buttonEnabled)
				AccessibleText(content: NSLocalizedString("sign_with_certificate", bundle: Bundle.main, comment: ""))
				    .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
			 }
			 .frame(maxWidth: .infinity, alignment: .leading)
			 .onTapGesture {
				self.presentationMode.wrappedValue.dismiss()
				certificateSignAction.toggle()
			 }
			 
			 HStack {
				Image("credit-card")
				    .foregroundColor(ColorConstants.Background.buttonEnabled)
				AccessibleText(content: NSLocalizedString("sign_with_dni", bundle: Bundle.main, comment: "o"))
				    .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
			 }
			 .frame(maxWidth: .infinity, alignment: .leading)
			 .onTapGesture {
				self.presentationMode.wrappedValue.dismiss()
				dniSignAction.toggle()
			 }
		  }
		  Spacer()
	   }
	   .padding()
	   .background(Color.white)
	   .cornerRadius(10)
    }
}
