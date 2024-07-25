//
//  MainView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
import SwiftUI

@objc enum ViewModes: Int {
    case home
    case sign
}

struct MainView: View {
    @StateObject private var appStatus = AppStatus()
    @State var certificates: [AOCertificateInfo]?
    @State private var sheetHeight: CGFloat = .zero
    @State private var navigationTitle = ""
    @State var certificateURL: URL?
    @State var viewMode: ViewModes = .home
    @State var urlReceived: URL?
    
    var body: some View {
	   ZStack {
		  NavigationStack {
			 VStack {
				VStack {
				    if viewMode == .home {
					   HomeViewMode(
						  certificates: $certificates
						  )
				    } else if viewMode == .sign {
					   if let urlReceived = urlReceived {
						  SignViewMode(
							 certificates: $certificates,
							 viewMode: $viewMode,
							 urlReceived: urlReceived
						  )
					   }
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
			 }
			 .frame(maxWidth: .infinity, maxHeight: .infinity)
			 .navigationDestination(isPresented: $appStatus.navigateToDNI) {
				DNIView()
			 }
			 .navigationDestination(isPresented: $appStatus.navigateToSelectCertificate) {
				SignViewMode(
				    certificates: $certificates,
				    viewMode: $viewMode
				)
			 }
			 .navigationDestination(isPresented: $appStatus.navigateToAddCertificate) {
				AddCertificateView(certificateURL: certificateURL)
			 }
		  }
		  if appStatus.isLoading {
			 LoadingView()
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.background(ColorConstants.Background.main.opacity(0.8))
				.edgesIgnoringSafeArea(.all)
		  }
	   }
	   .frame(maxWidth: .infinity, maxHeight: .infinity)
	   .navigationBarBackButtonHidden(true)
	   .navigationBarColor(UIColor(ColorConstants.Background.main), titleColor: .black)
	   .environmentObject(appStatus)
	   .onAppear() {
		  navigationTitle = ""
		  self.certificates = getCertificates()
	   }
	   .onDisappear {
		  navigationTitle = "Autofirma"
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
		  SignModalView(
			 certificateSignAction: $appStatus.navigateToSelectCertificate,
			 dniSignAction: $appStatus.navigateToDNI
		  )
		  .fixedSize(horizontal: false, vertical: true)
		  .modifier(GetHeightModifier(height: $sheetHeight))
		  .presentationDetents([.height(sheetHeight)])
		  .accessibility(addTraits: .isModal)
	   }
	   .sheet(isPresented: $appStatus.showDocumentPicker) {
		  DocumentPicker(onDocumentsPicked: { url in
			 if FileUtils().handleFile(at: url) {
				self.certificateURL = url
				appStatus.navigateToAddCertificate.toggle()
			 } else{
				appStatus.errorModalState = .certificateNotImported
				appStatus.showErrorModal.toggle()
			 }
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
