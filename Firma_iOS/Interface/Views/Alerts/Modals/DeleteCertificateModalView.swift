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
    var certificate: AOCertificateInfo
    
    var body: some View {
	   GeometryReader { geometry in
		  VStack(spacing: 10) {
			 HStack {
				Image("trash")
				    .resizable()
				    .scaledToFit()
				    .frame(width: 64, height: 64)
				
				Spacer()
			 }
			 
			 VStack(alignment: .leading, spacing: 0) {
				Text(NSLocalizedString("delete_certificate_title", bundle: Bundle.main, comment: ""))
				    .titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
				    .padding(.bottom)
				
				let text1 = Text(NSLocalizedString("delete_certificate_subtitle", bundle: Bundle.main, comment: ""))
				    .regularStyle(foregroundColor: ColorConstants.Text.secondary)
				
				let text2 = Text(certificate.issuer)
				    .regularBoldStyle(foregroundColor: ColorConstants.Text.secondary)
				
				let text3 = Text("?")
				    .regularStyle(foregroundColor: ColorConstants.Text.secondary)
				
				HStack {
				    Group {
					   text1
					   text2
					   text3
				    }
				}
				
				Text(NSLocalizedString("delete_certificate_description", bundle: Bundle.main, comment: ""))
				    .regularStyle(foregroundColor: ColorConstants.Text.secondary)
			 }
			 
			 Spacer()
			 
			 VStack(spacing: 10) {
				Button(action: {
				    self.presentationMode.wrappedValue.dismiss()
				}) {
				    Text(NSLocalizedString("delete_certificate_cancel_button_title", bundle: Bundle.main, comment: ""))
					   .regularBoldStyle(foregroundColor: ColorConstants.Background.buttonEnabled)
					   .underline()
				}
				
				Button(action: {
				    let status = deleteCertificate(certificate)

				    if status == errSecSuccess {
					   print("Certificate deleted successfully")
				    } else {
					   print("Failed to delete certificate with status: \(status)")
				    }
				}) {
				    Text(NSLocalizedString("delete_certificate_button_title", bundle: Bundle.main, comment: ""))
				}
				.buttonStyle(CustomButtonStyle(isEnabled: true))
			 }
		  }
		  .padding()
		  .background(Color.white)
		  .cornerRadius(10)
	   }
    }
    
    func deleteCertificate(_ certificateInfo: AOCertificateInfo) -> OSStatus {
	   var status: OSStatus = noErr
	   status = OpenSSLCertificateHelper.deleteCertificate(certificateInfo)
	   return status
    }
}
