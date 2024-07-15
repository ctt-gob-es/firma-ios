//
//  CertificateCellView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 15/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
import SwiftUI

struct CertificateCellView: View {
    var certificateInfo: AOCertificateInfo
    var deleteAction: () -> Void
    
    var body: some View {
	   VStack(alignment: .leading, spacing: 10) {
		  Text(certificateInfo.subject)
			 .titleStyleBold(foregroundColor: ColorConstants.Text.primary)
		  Text("\(NSLocalizedString("certificate_issuer", bundle: Bundle.main, comment: "")) : \(certificateInfo.issuer)")
			 .regularStyle(foregroundColor: ColorConstants.Text.secondary)
		  
		  HStack {
			 VStack(alignment: .leading) {
				Text(NSLocalizedString("certificate_valid_date", bundle: Bundle.main, comment: ""))
				    .boldStyleSmall(foregroundColor: ColorConstants.Text.secondary)
				Text(certificateInfo.getExpirationDateString())
				    .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
			 }
			 .frame(maxWidth: .infinity, alignment: .leading)
			 
			 Spacer()
			 
			 VStack(alignment: .leading) {
				Text(NSLocalizedString("certificate_use", bundle: Bundle.main, comment: ""))
				    .boldStyleSmall(foregroundColor: ColorConstants.Text.secondary)
				Text(certificateInfo.getPurposeString())
				    .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
			 }
			 .frame(maxWidth: .infinity, alignment: .leading)
		  }
		  .frame(maxWidth: .infinity)
		  
		  Button(action: {
			 deleteAction()
		  }) {
			 Text(NSLocalizedString("certificate_delete", bundle: Bundle.main, comment: ""))
				.boldStyleSmall(foregroundColor: ColorConstants.Background.buttonEnabled)
				.underline()
		  }
		  .frame(maxWidth: .infinity, alignment: .leading)
	   }
	   .padding()
	   .background(ColorConstants.Background.main)
	   .cornerRadius(10)
    }
}

