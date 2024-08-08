//
//  MainView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
import SwiftUI

struct MainView: View {
    @StateObject private var appStatus = AppStatus()
    @StateObject var viewModel = MainViewModel()
    
    let persistenceController = CoreDataStack.shared
    
    private var contentView: some View {
	   VStack {
		  let homeViewModel = HomeViewModel(
			 urlReceived: viewModel.urlReceived,
			 areCertificatesSelectable: viewModel.viewMode == .home ? false : true,
			 viewMode: viewModel.viewMode
		  )
		  
		  HomeView(
			 certificates: $viewModel.certificates,
			 viewMode: $viewModel.viewMode,
			 shouldSign: $viewModel.shouldSign,
			 showDocumentSavingPicker: $appStatus.showDocumentSavingPicker,
			 downloadedData: $appStatus.downloadedData,
			 viewModel: homeViewModel
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
		  NavigationBarButton(imageName: "info", action: { appStatus.showingInfoModal = true })
		  NavigationBarButtonLink(destination: SettingsView(), imageName: "settings")
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
				contentView
				    .navigationBarTitle(viewModel.navigationTitle, displayMode: .inline)
				    .navigationBarItems(leading: logo, trailing: navigationBarButtons)
			 }
			 .frame(maxWidth: .infinity, maxHeight: .infinity)
			 .navigationDestination(isPresented: $appStatus.navigateToDNI) {
				DNIView()
			 }
			 .navigationDestination(isPresented: $appStatus.navigateToSelectCertificate) {
				HomeView(
				    certificates: $viewModel.certificates,
				    viewMode: $viewModel.viewMode,
				    shouldSign: $viewModel.shouldSign,
				    showDocumentSavingPicker: $appStatus.showDocumentSavingPicker,
				    downloadedData: $appStatus.downloadedData,
				    viewModel: HomeViewModel(areCertificatesSelectable: true)
				)
			 }
			 .navigationDestination(isPresented: $appStatus.navigateToAddCertificate) {
				AddCertificateView(viewModel: AddCertificateViewModel(certificateURL: viewModel.certificateURL), shouldReload: $viewModel.shouldReload)
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
	   .fileImporter(isPresented: $appStatus.showDocumentImportingPicker, allowedContentTypes: [.data], allowsMultipleSelection: false, onCompletion: handleFileImport)
	   .sheet(isPresented: $appStatus.showingInfoModal) {
		  InfoModalView()
			 .fixedSize(horizontal: false, vertical: true)
			 .modifier(GetHeightModifier(height: $viewModel.sheetHeight))
			 .presentationDetents([.height(viewModel.sheetHeight)])
			 .accessibility(addTraits: .isModal)
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
		  }
	   }
	   .sheet(isPresented: $appStatus.showSignModal) {
		  SignModalView(
			 certificateSignAction: $appStatus.navigateToSelectCertificate,
			 dniSignAction: $appStatus.navigateToDNI
		  )
		  .fixedSize(horizontal: false, vertical: true)
		  .modifier(GetHeightModifier(height: $viewModel.sheetHeight))
		  .presentationDetents([.height(viewModel.sheetHeight)])
		  .accessibility(addTraits: .isModal)
	   }
	   .sheet(isPresented: $appStatus.showDocumentPicker) {
		  DocumentPicker(onDocumentsPicked: { url in
			 if FileUtils().handleFile(at: url) {
				viewModel.certificateURL = url
				appStatus.navigateToAddCertificate.toggle()
			 } else {
				appStatus.errorModalState = .certificateNotImported
				appStatus.showErrorModal.toggle()
			 }
		  }, onCancel: {})
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
	   }
	   .sheet(isPresented: $appStatus.showErrorModal) {
		  ErrorModalView(
			 viewMode: $viewModel.viewMode,
			 description: $appStatus.errorModalDescription,
			 errorModalState: appStatus.errorModalState
		  )
		  .fixedSize(horizontal: false, vertical: true)
		  .modifier(GetHeightModifier(height: $viewModel.sheetHeight))
		  .presentationDetents([.height(viewModel.sheetHeight)])
		  .accessibility(addTraits: .isModal)
	   }
	   .sheet(isPresented: $appStatus.showRecoveryModal) {
		  RecoveryModalView()
			 .fixedSize(horizontal: false, vertical: true)
			 .modifier(GetHeightModifier(height: $viewModel.sheetHeight))
			 .presentationDetents([.height(viewModel.sheetHeight)])
			 .accessibility(addTraits: .isModal)
	   }
	   .sheet(isPresented: $appStatus.showDocumentErrorModal) {
		  DocumentErrorModalView()
			 .accessibility(addTraits: .isModal)
	   }
	   .sheet(isPresented: $appStatus.showPseudonymModal) {
		  PseudonymModalView(shouldSign: $viewModel.shouldSign)
			 .fixedSize(horizontal: false, vertical: true)
			 .modifier(GetHeightModifier(height: $viewModel.sheetHeight))
			 .presentationDetents([.height(viewModel.sheetHeight)])
			 .accessibility(addTraits: .isModal)
	   }
	   .sheet(isPresented: $appStatus.showDocumentSavingPicker) {
		  if let url = appStatus.downloadedData {
			 DocumentSavingPicker(fileURL: url, onDismiss: { result in
				viewModel.viewMode = .home
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
    }
    
    private func onAppear() {
	   viewModel.navigationTitle = ""
	   viewModel.updateCertificates(viewModel.getCertificates())
    }
    
    private func onDisappear() {
	   viewModel.navigationTitle = "Autofirma"
    }
    
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
			 handleError(error: error)
	   }
    }
    
    private func handleError(error: Error) {
	   appStatus.showErrorModal = true
	   appStatus.errorModalState = .globalError
	   appStatus.errorModalDescription = error.localizedDescription
    }
}
