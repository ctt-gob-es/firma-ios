//
//  AddCertificateView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 18/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct AddCertificateView: View {
    @EnvironmentObject private var appStatus : AppStatus
    @State var certificateURL: URL?
    @State var password: String = ""
    @State var showFieldError: Bool = false
    @State var buttonEnabled: Bool = false
    
    var body: some View {
	   VStack {
		  VStack(alignment: .center, spacing: 20) {
			 VStack(alignment: .leading) {
				AccessibleText(content: NSLocalizedString("home_certificates_label", bundle: Bundle.main, comment: ""))
				    .titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
				    .accessibilityAddTraits(.isHeader)
				
				AccessibleText(content: NSLocalizedString("select_certificates_description", bundle: Bundle.main, comment: ""))
				    .regularStyle(foregroundColor: ColorConstants.Text.secondary)
			 }
			 .padding([.horizontal, .top])
			 
			 VStack(alignment: .leading) {
				if let url = certificateURL {
				    let fileName = url.lastPathComponent
				    AccessibleText(content: fileName)
					   .boldStyleSmall(foregroundColor: ColorConstants.Text.secondary)
				}
				
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
			 }
			 .padding([.horizontal, .top])
			 
			 Spacer()
			 
			 VStack(spacing: 10) {
				Button(action: {
				    if buttonEnabled {
					   if let url = certificateURL {
						  let fileName = url.lastPathComponent
						  validateStatus(status: loadCertificate(certName: fileName, password: password, fromDocument: true))
					   }
				    }
				}) {
				    AccessibleText(content: NSLocalizedString("install_certificate_button_one_title", bundle: Bundle.main, comment: ""))
				}
				.buttonStyle(CustomButtonStyle(isEnabled: buttonEnabled))
			 }
		  }
		  .dismissKeyboardOnTap()
	   }
	   .onChange(of: password, perform: { value in
		  if value.count > 0 {
			 buttonEnabled = true
		  } else {
			 buttonEnabled = false
			 showFieldError = false
		  }
	   })
    }
    
    func loadCertificate(
	   certName: String,
	   password: String,
	   fromDocument: Bool
    ) -> OSStatus? {
	   var status: OSStatus?
	   
	   let certificateUtils = CertificateUtils.sharedWrapper()
	   
	   if let certificateUtils = certificateUtils {
		  status = certificateUtils.loadCertKeyChain(withName: certName, password: password, fromDocument: fromDocument)
	   }
	   
	   return status
    }
    
    func validateStatus(status: OSStatus?) {
	   if let status = status {
		  if status == noErr {
			 appStatus.navigateToAddCertificate = false
			 let delayDuration: TimeInterval = 0.1
			 
			 DispatchQueue.main.asyncAfter(deadline: .now() + delayDuration) {
				appStatus.showSuccessModal = true
				appStatus.successModalState = .successCertificate
			 }
		  } else {
			 switch (status) {
				case errSecItemNotFound:
				    
				    break;
				case errSecAuthFailed:
				    showFieldError.toggle()
				    break;
				case errSecDuplicateItem:
				    
				    break;
				    
				default:
				   
				    break;
			 }
		  }
	   }
    }
}
