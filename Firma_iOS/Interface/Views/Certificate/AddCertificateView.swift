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
    @StateObject var viewModel: AddCertificateViewModel
    @Binding var isPresented: Bool
    @Binding var shouldReload: Bool
    
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
				if let url = viewModel.certificateURL {
				    let fileName = url.lastPathComponent
				    AccessibleText(content: fileName)
					   .boldStyleSmall(foregroundColor: ColorConstants.Text.secondary)
				}
				
				FloatingPlaceholderTextField(
				    placeholder: NSLocalizedString("password", bundle: Bundle.main, comment: ""),
				    errorplaceholder: NSLocalizedString("add_certificates_error_placeholder", bundle: Bundle.main, comment: ""),
				    text: $viewModel.password,
				    showError: $viewModel.showFieldError,
				    imageName: "xmark",
				    isSecureTextEntry: true,
				    validation: { password in
					   return viewModel.showFieldError
				    }
				)
			 }
			 .padding([.horizontal, .top])
			 
			 Spacer()
			 
			 VStack(spacing: 10) {
				Button(action: {
				    if viewModel.buttonEnabled {
					   if let url = viewModel.certificateURL {
						  let fileName = url.lastPathComponent
						  validateStatus(status: SwiftCertificateUtils.loadCertificate(certName: fileName, password: viewModel.password, fromDocument: true))
					   }
				    }
				}) {
				    AccessibleText(content: NSLocalizedString("install_certificate_button_one_title", bundle: Bundle.main, comment: ""))
				}
				.buttonStyle(CustomButtonStyle(isEnabled: viewModel.buttonEnabled))
			 }
		  }
		  .dismissKeyboardOnTap()
	   }
	   .onChange(of: viewModel.password, perform: { value in
		  if value.count > 0 {
			 viewModel.buttonEnabled = true
		  } else {
			 viewModel.buttonEnabled = false
			 viewModel.showFieldError = false
		  }
	   })
    }
    
    func validateStatus(status: OSStatus?) {
	   if let status = status {
		  if status == noErr {
                isPresented = false
                shouldReload = true
			 
                let delayDuration: TimeInterval = 0.1
			 DispatchQueue.main.asyncAfter(deadline: .now() + delayDuration) {
				appStatus.showSuccessModal = true
				appStatus.successModalState = .successCertificateAdded
			
			 }
		  } else {
			 switch (status) {
				case errSecItemNotFound:
				    break;
				case errSecAuthFailed:
				    viewModel.showFieldError.toggle()
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
