//
//  DeleteCertificateModal.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 15/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct DeleteCertificateModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var shouldReload: Bool
    
    var certificate: AOCertificateInfo
    
    var body: some View {
	   VStack(spacing: 10) {
		  HStack {
			 Image("trash")
				.resizable()
				.scaledToFit()
				.frame(width: 64, height: 64)
			 
			 Spacer()
		  }
		  
		  VStack(alignment: .leading, spacing: 0) {
			 AccessibleText(content: NSLocalizedString("delete_certificate_title", bundle: Bundle.main, comment: ""))
				.titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
				.accessibilityAddTraits(.isHeader)
				.padding(.bottom)
			 
			 (
				Text(NSLocalizedString("delete_certificate_subtitle", bundle: Bundle.main, comment: ""))
				    .regularStyle(foregroundColor: ColorConstants.Text.secondary)
				+ Text(" ")
				+ Text(certificate.issuer)
				    .regularBoldStyle(foregroundColor: ColorConstants.Text.secondary)
				+ Text("?")
				    .regularStyle(foregroundColor: ColorConstants.Text.secondary)
			 )
			 .accessibilityLabel(Text(NSLocalizedString("delete_certificate_subtitle", bundle: Bundle.main, comment: "") + certificate.issuer + "?"))
			 
			 AccessibleText(content: NSLocalizedString("delete_certificate_description", bundle: Bundle.main, comment: ""))
				.regularStyle(foregroundColor: ColorConstants.Text.secondary)
		  }
		  
		  Spacer()
		  
		  VStack(spacing: 10) {
			 Button(action: {
				self.presentationMode.wrappedValue.dismiss()
			 }) {
				AccessibleText(content: NSLocalizedString("delete_certificate_cancel_button_title", bundle: Bundle.main, comment: ""))
				    .regularBoldStyle(foregroundColor: ColorConstants.Background.buttonEnabled)
				    .underline()
			 }
			 
			 Button(action: {
				if SwiftCertificateUtils.deleteCertificate(certificate) == noErr {
				    self.shouldReload = true
				    self.presentationMode.wrappedValue.dismiss()
				}
			 }) {
				AccessibleText(content: NSLocalizedString("delete_certificate_button_title", bundle: Bundle.main, comment: ""))
			 }
			 .buttonStyle(CustomButtonStyle(isEnabled: true))
		  }
	   }
	   .padding()
	   .background(Color.white)
	   .cornerRadius(10)
    }
}
