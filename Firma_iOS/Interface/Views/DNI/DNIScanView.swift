//
//  DNIScanView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 17/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct DNIScanView: View {
    var body: some View {
	   VStack {
		  ScrollView {
			 (
				Text(NSLocalizedString("dni_connection_nfc_description_1", bundle: Bundle.main, comment: ""))
				    .regularStyle(foregroundColor: ColorConstants.Text.secondary)
				+ Text(NSLocalizedString("dni_connection_nfc_description_2", bundle: Bundle.main, comment: ""))
				    .regularBoldStyle(foregroundColor: ColorConstants.Text.secondary)
				+ Text(NSLocalizedString("dni_connection_nfc_description_3", bundle: Bundle.main, comment: ""))
				    .regularStyle(foregroundColor: ColorConstants.Text.secondary)
			 )
			 .accessibilityLabel(Text(NSLocalizedString("dni_connection_nfc_description_1", bundle: Bundle.main, comment: "")) + Text(NSLocalizedString("dni_connection_nfc_description_2", bundle: Bundle.main, comment: "")) +
							 Text(NSLocalizedString("dni_connection_nfc_description_3", bundle: Bundle.main, comment: "")))
			 
			 Image("nfc_sample")
				.resizable()
				.scaledToFit()
				.padding()
		  }
	   }
	   .padding()
    }
}
