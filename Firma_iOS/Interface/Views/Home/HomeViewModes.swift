//
//  CertificateView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 18/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct SignViewMode: View {
    @EnvironmentObject private var appStatus : AppStatus
    @Binding var certificates: [AOCertificateInfo]?
    @Binding var viewMode: ViewModes
    @State var buttonEnabled: Bool = false
    
    var body: some View {
	   VStack {
		  if appStatus.connectionError {
			 HomeErrorView(state: .connectionError)
		  } else if appStatus.updateNeeded {
			 HomeErrorView(state: .updateNeeded)
		  } else {
			 VStack(alignment: .center, spacing: 20) {
				VStack(alignment: .leading) {
				    AccessibleText(content: NSLocalizedString("home_certificates_label", bundle: Bundle.main, comment: ""))
					   .titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
					   .accessibilityAddTraits(.isHeader)
				    
				    AccessibleText(content: NSLocalizedString("select_certificates_description", bundle: Bundle.main, comment: ""))
					   .regularStyle(foregroundColor: ColorConstants.Text.secondary)
				}
				.padding([.horizontal, .top])
				
				if let certificates = self.certificates {
				    List {
					   ForEach(certificates, id: \.certificateRef) { certificate in
						  CertificateCellView(
							 certificateInfo: certificate,
							 isSelectable: true,
							 isSelected: appStatus.selectedCertificate == certificate ? true : false
						  )
						  .listRowSeparator(.hidden)
					   }
				    }
				    .listStyle(PlainListStyle())
				    
				} else {
				    Spacer()
				    
				    NoCertificatesView()
				    
				    Spacer()
				}
				
				VStack(spacing: 10) {
				    Button(action: {
					   if buttonEnabled {
						  //TODO: SIGN and navigate home
						  //appStatus.showSignModal.toggle()
						  viewMode = .home
						  
						  appStatus.successModalState = .successSign
						  appStatus.showSuccessModal = true
					   }
				    }) {
					   AccessibleText(content: NSLocalizedString("home_certificates_sign_button_title", bundle: Bundle.main, comment: ""))
				    }
				    .buttonStyle(CustomButtonStyle(isEnabled: buttonEnabled))
				}
			 }
		  }
	   }
	   .onChange(of: appStatus.selectedCertificate, perform: { value in
		  buttonEnabled = true
	   })
    }
}

struct HomeViewMode: View {
    @EnvironmentObject private var appStatus : AppStatus
    @Binding var certificates: [AOCertificateInfo]?
    
    var body: some View {
	   VStack {
		  if appStatus.connectionError {
			 HomeErrorView(state: .connectionError)
		  } else if appStatus.updateNeeded {
			 HomeErrorView(state: .updateNeeded)
		  } else {
			 VStack(alignment: .center, spacing: 20) {
				VStack(alignment: .leading) {
				    AccessibleText(content: NSLocalizedString("home_certificates_label", bundle: Bundle.main, comment: ""))
					   .titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
					   .accessibilityAddTraits(.isHeader)
				    
				    AccessibleText(content: NSLocalizedString("home_certificates_description", bundle: Bundle.main, comment: ""))
					   .regularStyle(foregroundColor: ColorConstants.Text.secondary)
				}
				.padding([.horizontal, .top])
				
				if let certificates = self.certificates {
				    List {
					   ForEach(certificates, id: \.certificateRef) { certificate in
						  CertificateCellView(
							 certificateInfo: certificate,
							 isSelectable: false
						  )
						  .listRowSeparator(.hidden)
					   }
				    }
				    .listStyle(PlainListStyle())
				    
				} else {
				    Spacer()
				    
				    NoCertificatesView()
				    
				    Spacer()
				}
				
				VStack(spacing: 10) {
				    //TODO: Next implementation, locally sign documents
				    /*Button(action: {
					appStatus.showSignModal.toggle()
					}) {
					AccessibleText(content: NSLocalizedString("home_certificates_sign_button_title", bundle: Bundle.main, comment: ""))
					}
					.buttonStyle(CustomButtonStyle(isEnabled: true))*/
				    
				    Button(action: {
					   appStatus.showDocumentPicker.toggle()
				    }) {
					   AccessibleText(content: NSLocalizedString("home_certificates_add_certificate_button_title", bundle: Bundle.main, comment: ""))
				    }
				    .buttonStyle(BorderedButtonStyle())
				}
			 }
		  }
	   }
    }
    
}
