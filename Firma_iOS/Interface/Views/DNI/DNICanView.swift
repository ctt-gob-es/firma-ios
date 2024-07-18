//
//  DNICanView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 17/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct DNICanView: View {
    @Binding var buttonEnabled: Bool
    @State var can: String
    var body: some View {
	   VStack {
		  ScrollView {
			 (
				Text(NSLocalizedString("dni_can_view_description_1", bundle: Bundle.main, comment: ""))
				    .regularStyle(foregroundColor: ColorConstants.Text.secondary)
				+ Text(NSLocalizedString("dni_can_view_description_2", bundle: Bundle.main, comment: ""))
				    .regularBoldStyle(foregroundColor: ColorConstants.Text.secondary)
				+ Text(NSLocalizedString("dni_can_view_description_3", bundle: Bundle.main, comment: ""))
				    .regularStyle(foregroundColor: ColorConstants.Text.secondary)
			 )
			 .accessibilityLabel(Text(NSLocalizedString("dni_compatible_view_description_1", bundle: Bundle.main, comment: "")) + Text(NSLocalizedString("dni_compatible_view_description_2", bundle: Bundle.main, comment: "")) + Text(NSLocalizedString("dni_compatible_view_description_3", bundle: Bundle.main, comment: "")))
			 
			 FloatingPlaceholderTextField(
				placeholder: NSLocalizedString("dni_connection_can_placeholder", bundle: Bundle.main, comment: ""),
				errorplaceholder: NSLocalizedString("dni_connection_can_error", bundle: Bundle.main, comment: ""),
				text: $can,
				showError: $buttonEnabled,
				imageName: "exclamationmark.triangle",
				isSecureTextEntry: false,
				validation: { can in
				    return canValidation(can: can)
				}
			 )
			 .padding(.vertical)
			 
			 Image("dni_sample")
		  }
	   }
	   .padding()
    }
    
    func canValidation(can: String) -> Bool{
	   if can.count != 6 {
		  buttonEnabled = false
		  return true
	   } else {
		  buttonEnabled = true
		  return false
	   }
    }
}
