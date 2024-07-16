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
    
    @State private var sheetHeight: CGFloat = .zero
    @State private var navigationTitle = ""
    
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
			 .navigationBarTitle(navigationTitle, displayMode: .inline)
			 .navigationBarItems(leading:
								Image("Logo-autofirma_vector")
				.resizable()
				.renderingMode(.template)
				.scaledToFit()
				.frame(height: 28.94)
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
				.padding(.bottom, 4)
			 )
			 .onAppear {
				navigationTitle = ""
			 }
			 .onDisappear {
				navigationTitle = "Autofirma"
			 }
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
			 .fixedSize(horizontal: false, vertical: true)
			 .modifier(GetHeightModifier(height: $sheetHeight))
			 .presentationDetents([.height(sheetHeight)])
			 .accessibility(addTraits: .isModal)
	   }
	   .sheet(isPresented: $appStatus.showDeleteModal){
		  if let selectedCertificate = appStatus.selectedCertificate {
			 DeleteCertificateModalView(certificate: selectedCertificate)
				.fixedSize(horizontal: false, vertical: true)
				.modifier(GetHeightModifier(height: $sheetHeight))
				.presentationDetents([.height(sheetHeight)])
				.accessibility(addTraits: .isModal)
		  }
	   }
	   .sheet(isPresented: $appStatus.showSignModal) {
		  SignModalView()
			 .fixedSize(horizontal: false, vertical: true)
			 .modifier(GetHeightModifier(height: $sheetHeight))
			 .presentationDetents([.height(sheetHeight)])
			 .accessibility(addTraits: .isModal)
	   }
	   .sheet(isPresented: $appStatus.showDocumentPicker) {
		  DocumentPicker(onDocumentsPicked: { url in
			 
		  }, onCancel: {
			 
		  })
		  .accessibility(addTraits: .isModal)
	   }
	   .sheet(isPresented: $appStatus.showSuccessModal) {
		  SuccessModalView(
			 title: appStatus.successModalState.title,
			 description: appStatus.successModalState.description
		  )
		  .fixedSize(horizontal: false, vertical: true)
		  .modifier(GetHeightModifier(height: $sheetHeight))
		  .presentationDetents([.height(sheetHeight)])
		  .accessibility(addTraits: .isModal)
	   }
	   .sheet(isPresented: $appStatus.showErrorModal) {
		  ErrorModalView(
			 errorModalState: appStatus.errorModalState
		  )
		  .fixedSize(horizontal: false, vertical: true)
		  .modifier(GetHeightModifier(height: $sheetHeight))
		  .presentationDetents([.height(sheetHeight)])
		  .accessibility(addTraits: .isModal)
	   }
	   .sheet(isPresented: $appStatus.showRecoveryModal) {
		  RecoveryModalView()
			 .fixedSize(horizontal: false, vertical: true)
			 .modifier(GetHeightModifier(height: $sheetHeight))
			 .presentationDetents([.height(sheetHeight)])
			 .accessibility(addTraits: .isModal)
	   }
	   .sheet(isPresented: $appStatus.showDocumentErrorModal) {
		  DocumentErrorModalView()
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

struct GetHeightModifier: ViewModifier {
    @Binding var height: CGFloat
    
    func body(content: Content) -> some View {
	   content.background(
		  GeometryReader { geo -> Color in
			 DispatchQueue.main.async {
				height = geo.size.height
			 }
			 return Color.clear
		  }
	   )
    }
}
