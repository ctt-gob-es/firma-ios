//
//  CertificateView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 18/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI
import Combine

struct HomeViewMode: View {
    @EnvironmentObject private var appStatus : AppStatus
    @Binding var certificates: [AOCertificateInfo]?
    @State var areCertificatesSelectable: Bool = false
    
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
							 isSelectable: $areCertificatesSelectable
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
				    
				    /*
					Button(action: {
					appStatus.showDocumentImportingPicker = true
					}) {
					AccessibleText(content: NSLocalizedString("home_certificates_sign_button_title", bundle: Bundle.main, comment: ""))
					}
					.buttonStyle(CustomButtonStyle(isEnabled: true))
					*/
				    
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
	   .onChange(of: appStatus.importedDataURLS, perform: { value in
		  if let url = value {
			 FileUtils.convertURLFileToData(urls: url) { result in
				switch result {
				    case .success(let data):
					   let localArchiveToSign = Base64Utils.encode(data)
					   print("Data from local archive: " + (localArchiveToSign ?? ""))
					   appStatus.showSignModal = true
				    case .failure(let error):
					   handleError(error: error)
				}
			 }
		  }
	   })
    }
    
    func handleError(error: Error) {
	   appStatus.showErrorModal = true
	   appStatus.errorModalState = .globalError
	   appStatus.errorModalDescription = error.localizedDescription
    }
}
