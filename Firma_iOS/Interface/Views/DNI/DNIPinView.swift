//
//  DNIPinView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 17/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct DNIPinView: View {
    @State var pin: String
    @State var showError: Bool = false
    
    var body: some View {
	   VStack {
		  ScrollView {
			 AccessibleText(content: NSLocalizedString("dni_connection_pin_description", bundle: Bundle.main, comment: ""))
				.regularStyle(foregroundColor: ColorConstants.Text.primary)
			 
			 FloatingPlaceholderTextField(
				placeholder: NSLocalizedString("dni_connection_pin_placeholder", bundle: Bundle.main, comment: ""),
				errorplaceholder: NSLocalizedString("dni_connection_pin_error", bundle: Bundle.main, comment: ""),
				text: $pin,
				showError: $showError,
				imageName: "exclamationmark.triangle",
				isSecureTextEntry: true,
				validation: { pin in
				    return pinValidation(pin: pin)
				}
			 )
			 .padding(.vertical)
			 
			 Image("email_sample")
		  }
		  .dismissKeyboardOnTap()
	   }
	   .padding()
    }
    
    func pinValidation(pin: String) -> Bool{
	   if pin.count != 6 {
		  return true
	   } else {
		  return false
	   }
    }
}
