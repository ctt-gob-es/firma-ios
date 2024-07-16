//
//  CertificateCellView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 15/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
import SwiftUI

struct CertificateCellView: View {
    @EnvironmentObject private var appStatus : AppStatus
    var certificateInfo: AOCertificateInfo
    
    var body: some View {
	   VStack(alignment: .leading, spacing: 10) {
		  AccessibleText(content: certificateInfo.subject)
			 .titleStyleBold(foregroundColor: ColorConstants.Text.primary)
			 .accessibilityAddTraits(.isHeader)
		  AccessibleText(content: "\(NSLocalizedString("certificate_issuer", bundle: Bundle.main, comment: "")) : \(certificateInfo.issuer ?? "")")
			 .regularStyle(foregroundColor: ColorConstants.Text.secondary)
		  HStack {
			 VStack(alignment: .leading) {
				AccessibleText(content: NSLocalizedString("certificate_valid_date", bundle: Bundle.main, comment: ""))
				    .boldStyleSmall(foregroundColor: ColorConstants.Text.secondary)
				AccessibleText(content: certificateInfo.getExpirationDateString())
				    .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
			 }
			 .frame(maxWidth: .infinity, alignment: .leading)
			 
			 Spacer()
			 
			 VStack(alignment: .leading) {
				AccessibleText(content: NSLocalizedString("certificate_use", bundle: Bundle.main, comment: ""))
				    .boldStyleSmall(foregroundColor: ColorConstants.Text.secondary)
				AccessibleText(content: certificateInfo.getPurposeString())
				    .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
			 }
			 .frame(maxWidth: .infinity, alignment: .leading)
		  }
		  .frame(maxWidth: .infinity)
		  
		  Button(action: {
			 appStatus.selectedCertificate = self.certificateInfo
			 appStatus.showDeleteModal.toggle()
		  }) {
			 AccessibleText(content: NSLocalizedString("certificate_delete", bundle: Bundle.main, comment: ""))
				.boldStyleSmall(foregroundColor: ColorConstants.Background.buttonEnabled)
				.underline()
		  }
		  .buttonStyle(PlainButtonStyle())
	   }
	   .padding()
	   .background(ColorConstants.Background.main)
	   .cornerRadius(10)
	   .contentShape(Rectangle())
    }
}

