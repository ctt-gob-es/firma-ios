//
//  MainView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
import SwiftUI

struct MainView: View {
    @StateObject var appStatus = AppStatus()
    @StateObject var viewModel = MainViewModel()
    
    let persistenceController = CoreDataStack.shared
    
    private var contentView: some View {
	   VStack {
		  let homeViewModel = HomeViewModel(
			 urlReceived: viewModel.urlReceived,
			 areCertificatesSelectable: viewModel.viewMode == .home ? false : true,
			 viewMode: viewModel.viewMode,
			 certificates: viewModel.certificates
		  )
		  
		  HomeView(
			 certificates: $viewModel.certificates,
			 viewMode: $viewModel.viewMode,
			 shouldSign: $viewModel.shouldSign,
			 showDocumentSavingPicker: $appStatus.showDocumentSavingPicker,
			 downloadedData: $appStatus.downloadedData,
			 viewModel: homeViewModel,
			 shouldCancel: $viewModel.shouldCancel
		  )
	   }
    }
    
    private var logo: some View {
	   Image("Logo-autofirma_vector")
		  .resizable()
		  .renderingMode(.template)
		  .scaledToFit()
		  .frame(height: 28.94)
		  .foregroundColor(Color(hex: "#C33400"))
    }
    
    private var navigationBarButtons: some View {
	   HStack(spacing: 4) {
		  switch viewModel.viewMode {
			 case .home:
				NavigationBarButton(imageName: "info", action: { appStatus.showingInfoModal = true })
				NavigationBarButtonLink(destination: SettingsView(), imageName: "settings")
			 case .sign:
				NavigationBarButton(imageName: "close", action: { viewModel.cancelSign() })
		  }
	   }
	   .padding(.bottom, 4)
    }
    
    private var loadingView: some View {
	   Group {
		  if appStatus.isLoading {
			 LoadingView()
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.background(ColorConstants.Background.main.opacity(0.8))
				.edgesIgnoringSafeArea(.all)
		  }
	   }
    }
    
    var body: some View {
	   ZStack {
		  NavigationStack {
			 VStack {
				CustomNavigationBar(
				    logo: logo,
				    title: nil,
				    trailingButtons: { navigationBarButtons }
				)
				
				contentView
				    .navigationBarTitle(viewModel.navigationTitle, displayMode: .inline)
				    .navigationBarItems(leading: logo, trailing: navigationBarButtons)
				    .toolbar(.hidden)
				    .navigationTitle(viewModel.navigationTitle)
				    .navigationBarHidden(true)
			 }
			 .frame(maxWidth: .infinity, maxHeight: .infinity)
			 .navigationDestination(isPresented: $appStatus.navigateToDNI) {
				DNIView(hasDismissed: $viewModel.shouldCancel)
			 }
			 .navigationDestination(isPresented: $appStatus.navigateToSelectCertificate) {
				HomeView(
				    certificates: $viewModel.certificates,
				    viewMode: $viewModel.viewMode,
				    shouldSign: $viewModel.shouldSign,
				    showDocumentSavingPicker: $appStatus.showDocumentSavingPicker,
				    downloadedData: $appStatus.downloadedData,
				    viewModel: HomeViewModel(areCertificatesSelectable: true),
				    shouldCancel: $viewModel.shouldCancel
				)
				.onChange(of: viewModel.viewMode, perform: { mode in
				    if mode == .home {
					   appStatus.isLoading = false
					   appStatus.navigateToSelectCertificate = false
				    }
				    })
				.onAppear() {
				    viewModel.viewMode = .sign
				}
				.onDisappear() {
				    viewModel.viewMode = .home
				    appStatus.selectedCertificate = nil
				}
			 }
			 .navigationDestination(isPresented: $appStatus.navigateToAddCertificate) {
				AddCertificateView(
				    viewModel: AddCertificateViewModel(certificateURL: viewModel.certificateURL),
				    shouldReload: $viewModel.shouldReload
				)
			 }
		  }
		  loadingView
	   }
	   .frame(maxWidth: .infinity, maxHeight: .infinity)
	   .navigationBarBackButtonHidden(true)
	   .navigationBarColor(UIColor(ColorConstants.Background.main), titleColor: .black)
	   .environmentObject(appStatus)
	   .environment(\.managedObjectContext, persistenceController.context)
	   .onAppear(perform: onAppear)
	   .onDisappear(perform: onDisappear)
	   .onChange(of: viewModel.shouldReload, perform: handleReload)
	   .onChange(of: appStatus.showDocumentSavingPicker, perform: handleDocumentSavingPicker)
	   //TODO: USE UIKIT SELECTOR for iOS 16
	   .fileImporter(
		  isPresented: $appStatus.showDocumentImportingPicker,
		  allowedContentTypes: [.data],
		  allowsMultipleSelection: false,
		  onCompletion: handleFileImport,
		  onCancellation: handleFileImportCancellation
	   )
	   .sheet(isPresented: $appStatus.showingInfoModal) {
		  InfoModalView()
			 .fixedSize(horizontal: false, vertical: true)
			 .modifier(GetHeightModifier(height: $viewModel.sheetHeight))
			 .presentationDetents([.height(viewModel.sheetHeight)])
			 .accessibility(addTraits: .isModal)
			 .interactiveDismissDisabled(true)
	   }
	   .sheet(isPresented: $appStatus.showDeleteModal) {
		  if let selectedCertificate = appStatus.selectedCertificate {
			 DeleteCertificateModalView(
				shouldReload: $viewModel.shouldReload,
				certificate: selectedCertificate
			 )
			 .fixedSize(horizontal: false, vertical: true)
			 .modifier(GetHeightModifier(height: $viewModel.sheetHeight))
			 .presentationDetents([.height(viewModel.sheetHeight)])
			 .accessibility(addTraits: .isModal)
			 .interactiveDismissDisabled(true)
		  }
	   }
	   .sheet(isPresented: $appStatus.showSignModal,
			onDismiss: {
		  if appStatus.navigateToSelectCertificate == false
			 && appStatus.navigateToDNI == false {
			 appStatus.showSignModal = true
		  }
	   }) {
		  SignModalView(
			 certificateSignAction: $appStatus.navigateToSelectCertificate,
			 dniSignAction: $appStatus.navigateToDNI
		  )
		  .fixedSize(horizontal: false, vertical: true)
		  .modifier(GetHeightModifier(height: $viewModel.sheetHeight))
		  .presentationDetents([.height(viewModel.sheetHeight)])
		  .accessibility(addTraits: .isModal)
		  .interactiveDismissDisabled(true)
	   }
	   .sheet(isPresented: $appStatus.showDocumentPicker) {
		  DocumentPicker(
			 onDocumentsPicked: { url in
				if FileUtils().handleFile(at: url) {
				    viewModel.certificateURL = url
				    appStatus.navigateToAddCertificate.toggle()
				} else {
                        appStatus.errorInfo = ErrorCodes.InternalSoftwareErrorCodes.certificateLoadingError.info
				    appStatus.showErrorModal.toggle()
				}
			 }, onCancel: {
				print("User cancelled the Document Interaction")
			 }
		  )
		  .interactiveDismissDisabled(true)
		  .accessibility(addTraits: .isModal)
	   }
	   .sheet(isPresented: $appStatus.showSuccessModal) {
		  SuccessModalView(
			 title: appStatus.successModalState.title,
			 description: appStatus.successModalState.description
		  )
		  .fixedSize(horizontal: false, vertical: true)
		  .modifier(GetHeightModifier(height: $viewModel.sheetHeight))
		  .presentationDetents([.height(viewModel.sheetHeight)])
		  .accessibility(addTraits: .isModal)
		  .interactiveDismissDisabled(true)
	   }
	   .sheet(isPresented: $appStatus.showErrorModal) {
		  ErrorModalView(
			 viewMode: $viewModel.viewMode,
			 description: $appStatus.errorModalDescription,
			 shouldReloadParentView: $appStatus.navigateToSelectCertificate,
			 errorInfo: appStatus.errorInfo
		  )
		  .environmentObject(appStatus)
		  .fixedSize(horizontal: false, vertical: true)
		  .modifier(GetHeightModifier(height: $viewModel.sheetHeight))
		  .presentationDetents([.height(viewModel.sheetHeight)])
		  .accessibility(addTraits: .isModal)
		  .interactiveDismissDisabled(true)
	   }
	   .sheet(isPresented: $appStatus.showRecoveryModal) {
		  RecoveryModalView()
			 .fixedSize(horizontal: false, vertical: true)
			 .modifier(GetHeightModifier(height: $viewModel.sheetHeight))
			 .presentationDetents([.height(viewModel.sheetHeight)])
			 .accessibility(addTraits: .isModal)
			 .interactiveDismissDisabled(true)
	   }
	   .sheet(isPresented: $appStatus.showDocumentErrorModal) {
		  DocumentErrorModalView()
			 .accessibility(addTraits: .isModal)
			 .interactiveDismissDisabled(true)
	   }
	   .sheet(isPresented: $appStatus.showPseudonymModal) {
		  PseudonymModalView(shouldSign: $viewModel.shouldSign)
			 .fixedSize(horizontal: false, vertical: true)
			 .modifier(GetHeightModifier(height: $viewModel.sheetHeight))
			 .presentationDetents([.height(viewModel.sheetHeight)])
			 .accessibility(addTraits: .isModal)
			 .interactiveDismissDisabled(true)
	   }
	   .sheet(isPresented: $appStatus.showDocumentSavingPicker) {
		  if let url = appStatus.downloadedData {
			 DocumentSavingPicker(fileURL: url, onDismiss: { result in
				viewModel.viewMode = .home
				switch result {
				    case .success(let url):
					   print("URL of the saved archive: " + url.absoluteString)
					   appStatus.showSuccessModal = true
					   appStatus.successModalState = .successArhiveAdded
				    case .failure(let error):
					   print("Error while saving the data, : " + error.localizedDescription)
					   handleErrorSavingData(error: error)
				}
			 })
			 .interactiveDismissDisabled(true)
		  }
	   }
    }
    
    private func onAppear() {
	   viewModel.updateCertificates(viewModel.getCertificates())
    }
    
    private func onDisappear() {}
    
    private func handleReload(_ value: Bool) {
	   if value {
		  viewModel.updateCertificates(viewModel.getCertificates())
		  viewModel.shouldReload = false
	   }
    }
    
    private func handleDocumentSavingPicker(_ value: Bool) {
	   if !value {
		  viewModel.viewMode = .home
	   }
    }
    
    private func handleFileImport(result: Result<[URL], Error>) {
	   switch result {
		  case .success(let urls):
			 appStatus.importedDataURLS = urls
		  case .failure(let error):
			 print("File import failed with error: \(error.localizedDescription)")
			 handleErrorImportingFile(error: error)
	   }
    }
    
    private func handleFileImportCancellation() {
	   appStatus.showErrorModal = true
	   appStatus.errorInfo = ErrorCodes.FunctionalErrorCodes.userOperationCanceled.info
	   appStatus.navigateToDNI = false
	   appStatus.navigateToAddCertificate = false
    }
    
    func handleErrorImportingFile(error: Error) {
	   appStatus.showErrorModal = true
	   appStatus.errorInfo = ErrorCodes.InternalSoftwareErrorCodes.fileLoadingLocalFile.info
	   appStatus.errorModalDescription = error.localizedDescription
	   appStatus.navigateToDNI = false
	   appStatus.navigateToAddCertificate = false
    }
    
    func handleErrorSavingData(error: Error) {
	   appStatus.showErrorModal = true
	   appStatus.errorInfo = ErrorCodes.InternalSoftwareErrorCodes.dataSavingFileSaveDisk.info
	   appStatus.errorModalDescription = error.localizedDescription
	   appStatus.navigateToDNI = false
	   appStatus.navigateToAddCertificate = false
    }
}
