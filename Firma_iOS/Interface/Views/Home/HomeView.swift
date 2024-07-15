//
//  HomeView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
import SwiftUI

struct HomeView: View {
    @State var certificates: [AOCertificateInfo]?
    @State private var selectedCertificate: AOCertificateInfo? = nil
    
    @State private var showingInfoModal = false
    @State private var showDeleteModal = false
    @State private var showSignModal = false
    @State private var showDocumentPicker = false
    
    var body: some View {
	   NavigationView {
		  VStack {
			 VStack(alignment: .center, spacing: 20) {
				VStack(alignment: .leading) {
				    Text(NSLocalizedString("home_certificates_label", bundle: Bundle.main, comment: ""))
					   .titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
				    
				    Text(NSLocalizedString("home_certificates_description", bundle: Bundle.main, comment: ""))
					   .regularStyle(foregroundColor: ColorConstants.Text.secondary)
				}
				.padding([.horizontal, .top])
				
				if let certificates = self.certificates {
				    List {
					   ForEach(certificates, id: \.certificateRef) { certificate in
						  CertificateCellView(certificateInfo: certificate, deleteAction: {
							 self.selectedCertificate = certificate
							 self.showDeleteModal = true
						  })
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
					   showSignModal.toggle()
				    }) {
					   Text(NSLocalizedString("home_certificates_sign_button_title", bundle: Bundle.main, comment: ""))
				    }
				    .buttonStyle(CustomButtonStyle(isEnabled: true))
				    
				    Button(action: {
					   showDocumentPicker.toggle()
				    }) {
					   Text(NSLocalizedString("home_certificates_add_certificate_button_title", bundle: Bundle.main, comment: ""))
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
				.frame(height: 40)
				.foregroundColor(Color(hex: "#C33400")),
							 trailing:
								HStack(spacing: 10) {
				NavigationBarButton(imageName: "info.circle", action: {
				    self.showingInfoModal = true
				})
				
				NavigationBarButtonLink(
				    destination: SettingsView(),
				    imageName: "gearshape"
				)
			 }
			 )
		  }
	   }
	   .navigationBarBackButtonHidden(true)
	   .navigationBarColor(UIColor(ColorConstants.Background.main), titleColor: .black)
	   .sheet(isPresented: $showingInfoModal) {
		  InfoModalView()
			 .presentationDetents([.fraction(0.75)])
	   }
	   .sheet(isPresented: Binding(
		  get: { self.selectedCertificate != nil },
		  set: { if !$0 { self.selectedCertificate = nil } }
	   )) {
		  if let selectedCertificate = selectedCertificate {
			 DeleteCertificateModalView(certificate: selectedCertificate)
				.presentationDetents([.fraction(0.5)])
		  }
	   }
	   .sheet(isPresented: $showSignModal) {
		  SignModalView()
			 .presentationDetents([.fraction(0.25)])
	   }
	   .sheet(isPresented: $showDocumentPicker) {
		  DocumentPicker(onDocumentsPicked: { url in
			 print("Picked document: \(url)")
		  }, onCancel: {
			 // User cancelled Files interaction
		  })
	   }
	   .onAppear() {
		  self.certificates = getCertificates()
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
