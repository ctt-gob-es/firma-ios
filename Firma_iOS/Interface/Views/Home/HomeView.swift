//
//  HomeView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
import SwiftUI

struct HomeView: View {
    @StateObject private var appStatus = AppStatus()
    @State var certificates: [AOCertificateInfo]?
    
    var body: some View {
	   NavigationView {
		  VStack {
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
						  CertificateCellView(certificateInfo: certificate)
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
					   appStatus.showSignModal.toggle()
				    }) {
					   AccessibleText(content: NSLocalizedString("home_certificates_sign_button_title", bundle: Bundle.main, comment: ""))
				    }
				    .buttonStyle(CustomButtonStyle(isEnabled: true))
				    
				    Button(action: {
					   appStatus.showDocumentPicker.toggle()
				    }) {
					   AccessibleText(content: NSLocalizedString("home_certificates_add_certificate_button_title", bundle: Bundle.main, comment: ""))
				    }
				    .buttonStyle(BorderedButtonStyle())
				}
			 }
			 .navigationBarTitle("", displayMode: .inline)
			 .navigationBarItems(leading:
								Image("Logo-autofirma_vector")
				.resizable()
				.renderingMode(.template)
				.scaledToFit()
				.frame(height: 44)
				.foregroundColor(Color(hex: "#C33400")),
							 trailing:
								HStack(spacing: 4) {
				NavigationBarButton(imageName: "info", action: {
				    self.appStatus.showingInfoModal = true
				})
				
				NavigationBarButtonLink(
				    destination: SettingsView(),
				    imageName: "settings"
				)
			 }
				.padding(.bottom, 8)
			 )
		  }
	   }
	   .navigationBarBackButtonHidden(true)
	   .navigationBarColor(UIColor(ColorConstants.Background.main), titleColor: .black)
	   .environmentObject(appStatus)
	   .onAppear() {
		  self.certificates = getCertificates()
	   }
	   .sheet(isPresented: $appStatus.showingInfoModal) {
		  InfoModalView()
			 .presentationDetents([.fraction(0.75)])
	   }
	   .accessibility(addTraits: .isModal)
	   .sheet(isPresented: Binding(
		  get: { self.appStatus.selectedCertificate != nil },
		  set: { if !$0 { self.appStatus.selectedCertificate = nil }}
	   )) {
		  if let selectedCertificate = appStatus.selectedCertificate {
			 DeleteCertificateModalView(certificate: selectedCertificate)
				.presentationDetents([.fraction(0.5)])
				.accessibility(addTraits: .isModal)
		  }
	   }
	   .sheet(isPresented: $appStatus.showSignModal) {
		  SignModalView()
			 .presentationDetents([.fraction(0.4)])
			 .accessibility(addTraits: .isModal)
	   }
	   .sheet(isPresented: $appStatus.showDocumentPicker) {
		  DocumentPicker(onDocumentsPicked: { url in
			 
		  }, onCancel: {
			
		  })
		  .accessibility(addTraits: .isModal)
	   }
    }
    
    func getCertificates() -> [AOCertificateInfo] {
	   if let certificates = OpenSSLCertificateHelper.getAddedCertificatesInfo() as? [AOCertificateInfo] {
		  return certificates
	   } else {
		  return []
	   }
    }
}
