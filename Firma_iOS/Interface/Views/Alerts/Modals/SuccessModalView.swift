//
//  SuccessModalView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 16/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct SuccessModalView: View {
    @Environment(\.presentationMode) var presentationMode
    var title: String
    var description: String
    
    var body: some View {
	   VStack(spacing: 10) {
		  HStack {
			 Image("tick")
				.resizable()
				.scaledToFit()
				.frame(width: 64, height: 64)
			 Spacer()
		  }
		  .padding(.leading)
		  
		  VStack(alignment: .leading, spacing: 0) {
			 AccessibleText(content: title)
				.titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
				.accessibilityAddTraits(.isHeader)
				.padding(.bottom)
			 
			 AccessibleText(content: description)
				.regularStyle(foregroundColor: ColorConstants.Text.secondary)
		  }
		  .padding(.horizontal)
		  .frame(maxWidth: .infinity, alignment: .leading)
		  
		  Spacer()
		  
		  VStack(spacing: 10) {
			 Button(action: {
				self.presentationMode.wrappedValue.dismiss()
			 }) {
				AccessibleText(content: NSLocalizedString("info_view_button_title", bundle: Bundle.main, comment: ""))
			 }
			 .buttonStyle(CustomButtonStyle(isEnabled: true))
		  }
	   }
	   .padding()
	   .background(Color.white)
	   .cornerRadius(10)
    }
}

enum SuccessModalState {
    case successCertificateAdded
    case successCertificateSent
    case successCertificateDeleted
    case successSign
    
    var title: String {
	   switch self {
		  case .successCertificateAdded:
			 return NSLocalizedString("certificate_added_success_title",bundle: Bundle.main, comment: "")
		  case .successCertificateSent:
			 return NSLocalizedString("certificate_sent_success_title",bundle: Bundle.main, comment: "")
		  case .successCertificateDeleted:
			 return NSLocalizedString("certificate_delete_success_title",bundle: Bundle.main, comment: "")
		  case .successSign:
			 return NSLocalizedString("sign_success_title",bundle: Bundle.main, comment: "")
	   }
    }
    
    var description: String {
	   switch self {
		  case .successCertificateAdded:
			 return NSLocalizedString("certificate_added_success_description",bundle: Bundle.main, comment: "")
		  case .successCertificateSent:
			 return NSLocalizedString("certificate_sent_success_description",bundle: Bundle.main, comment: "")
		  case .successCertificateDeleted:
			 return NSLocalizedString("certificate_delete_success_description",bundle: Bundle.main, comment: "")
		  case .successSign:
			 return NSLocalizedString("sign_success_description",bundle: Bundle.main, comment: "")
	   }
    }
}
