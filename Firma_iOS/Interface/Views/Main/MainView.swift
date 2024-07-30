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
    @State var shouldSign: Bool = false
    @State var shouldReload: Bool = false
    
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
							 shouldSign: $shouldSign,
							 showDocumentSavingPicker: $appStatus.showDocumentSavingPicker,
							 downloadedData: $appStatus.downloadedData,
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
				    viewMode: $viewMode,
				    shouldSign: $shouldSign,
				    showDocumentSavingPicker: $appStatus.showDocumentSavingPicker,
				    downloadedData: $appStatus.downloadedData,
				    areCertificablesSelectable: true
				)
			 }
			 .navigationDestination(isPresented: $appStatus.navigateToAddCertificate) {
				AddCertificateView(certificateURL: certificateURL, shouldReload: $shouldReload)
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
	   .onChange(of: shouldReload, perform: { value in
		  if value {
			 certificates = getCertificates()
			 shouldReload = false
		  }
	   })
	   .onChange(of: appStatus.showDocumentSavingPicker, perform: { value in
		  if !value{
			 viewMode = .home
		  }
	   })
	   .sheet(isPresented: $appStatus.showingInfoModal) {
		  InfoModalView()
			 .fixedSize(horizontal: false, vertical: true)
			 .modifier(GetHeightModifier(height: $sheetHeight))
			 .presentationDetents([.height(sheetHeight)])
			 .accessibility(addTraits: .isModal)
	   }
	   .sheet(isPresented: $appStatus.showDeleteModal){
		  if let selectedCertificate = appStatus.selectedCertificate {
			 DeleteCertificateModalView(
				shouldReload: $shouldReload,
				certificate: selectedCertificate
			 )
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
			 viewMode: $viewMode,
			 description: $appStatus.errorModalDescription,
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
	   .sheet(isPresented: $appStatus.showPseudonymModal) {
		  PseudonymModalView(shouldSign: $shouldSign)
			 .fixedSize(horizontal: false, vertical: true)
			 .modifier(GetHeightModifier(height: $sheetHeight))
			 .presentationDetents([.height(sheetHeight)])
			 .accessibility(addTraits: .isModal)
	   }
	   .sheet(isPresented: $appStatus.showDocumentSavingPicker) {
		  if let url = appStatus.downloadedData {
			 DocumentSavingPicker(fileURL: url, onDismiss: { result in
				viewMode = .home
				switch result {
				    case .success(let resultURL):
					   print("User saved the data downloaded here: " + resultURL.absoluteString)
					   
				    case .failure(let error):
					   print("Error while saving the data, : " + error.localizedDescription)
					   handleError(error: error)
				}
			 })
		  }
	   }
	   .fileImporter(isPresented: $appStatus.showDocumentImportingPicker,
				  allowedContentTypes: [.data],
				  allowsMultipleSelection: false) { result in
		  switch result {
			 case .success(let urls):
				appStatus.importedDataURLS = urls
			 case .failure(let error):
				print("File import failed with error: \(error.localizedDescription)")
				handleError(error: error)
		  }
	   }
    }
    
    func handleError(error: Error) {
	   appStatus.showErrorModal = true
	   appStatus.errorModalState = .globalError
	   appStatus.errorModalDescription = error.localizedDescription
    }
    
    func getCertificates() -> [AOCertificateInfo] {
	   if let certificates = OpenSSLCertificateHelper.getAddedCertificatesInfo() as? [AOCertificateInfo] {
		  return certificates
	   } else {
		  return []
	   }
    }
}
