//
//  TextfieldModalView.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 9/8/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

struct TextfieldModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var password: String
    @Binding var shouldCancelOperation: Bool
    
    @State var showFieldError: Bool = false
    @State var buttonEnabled: Bool = false
    
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
		  
		  VStack(alignment: .leading, spacing: 8) {
			 AccessibleText(content: NSLocalizedString("textfield_modal_title", bundle: Bundle.main, comment: ""))
				.titleStyleBlack(
				    foregroundColor: ColorConstants.Text.primary,
				    alignment: .center
				)
				.accessibilityAddTraits(.isHeader)
			 
			 AccessibleText(content: NSLocalizedString("textfield_modal_description", bundle: Bundle.main, comment: ""))
				.regularStyle(
				    foregroundColor: ColorConstants.Text.secondary,
				    alignment: .leading
				)
			 
			 FloatingPlaceholderTextField(
				placeholder: NSLocalizedString("password", bundle: Bundle.main, comment: ""),
				errorplaceholder: NSLocalizedString("add_certificates_error_placeholder", bundle: Bundle.main, comment: ""),
				text: $password,
				showError: $showFieldError,
				imageName: "xmark",
				isSecureTextEntry: true,
				validation: { password in
				    return showFieldError
				}
			 )
			 
			 HStack {
				Spacer()
				Button(action: {
				    self.shouldCancelOperation.toggle()
				    self.presentationMode.wrappedValue.dismiss()
				}) {
				    AccessibleText(content: NSLocalizedString("textfield_modal_cancel_button_title", bundle: Bundle.main, comment: ""))
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
				if buttonEnabled {
				    self.presentationMode.wrappedValue.dismiss()
				}
			 }) {
				AccessibleText(content: NSLocalizedString("textfield_modal_button_title", bundle: Bundle.main, comment: ""))
			 }
			 .buttonStyle(CustomButtonStyle(isEnabled: buttonEnabled))
		  }
	   }
	   .padding()
	   .background(Color.white)
	   .cornerRadius(10)
	   .onChange(of: password, perform: { value in
		  if value.count > 0 {
			 buttonEnabled = true
		  } else {
			 buttonEnabled = false
			 showFieldError = false
		  }
	   })
    }
}
