//
//  MainView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
import SwiftUI

// Vista padre que inicializa el Environment Object de AppStatus. La necesitamos para poder ararncar desde el AppDelegate en objetive-c al recibir la url
struct ParentView: View {
    
    @StateObject var appStatus = AppStatus()
    let viewMode: ViewModes?
    let urlReceived: URL?
    
    init(viewMode: ViewModes?, urlReceived: URL?) {
        self.viewMode = viewMode
        self.urlReceived = urlReceived
    }
    
    var body: some View {
        VStack {
            MainView(viewModel: MainViewModel(viewMode: viewMode ?? .home, urlReceived: urlReceived, appStatus: appStatus)).environmentObject(appStatus)
        }
    }
    
}

struct MainView: View {
    @State private var contentSheetHeight: CGFloat = 0
    @EnvironmentObject var appStatus : AppStatus
    @StateObject var viewModel : MainViewModel
    
    let persistenceController = CoreDataStack.shared
    
    init(viewModel: MainViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    private var contentView: some View {
	   VStack {
		  let homeViewModel = HomeViewModel(
			 urlReceived: viewModel.urlReceived,
			 areCertificatesSelectable: viewModel.viewMode == .home ? false : true,
			 viewMode: viewModel.viewMode,
                appStatus: appStatus
		  )
		  
		  HomeView(
			 viewMode: $viewModel.viewMode,
			 shouldSign: $viewModel.shouldSign,
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
				NavigationBarButton(imageName: "close", action: {
				    viewModel.cancelSign()
				})
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
			 .navigationDestination(isPresented: $appStatus.navigateToSelectCertificate) {
				HomeView(
				    viewMode: $viewModel.viewMode,
				    shouldSign: $viewModel.shouldSign,
				    viewModel: HomeViewModel(areCertificatesSelectable: true, appStatus: appStatus),
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
            }
		  loadingView
	   }
	   .frame(maxWidth: .infinity, maxHeight: .infinity)
	   .navigationBarBackButtonHidden(true)
	   .navigationBarColor(UIColor(ColorConstants.Background.main), titleColor: .black)
	   .environment(\.managedObjectContext, persistenceController.context)
	   .onDisappear(perform: onDisappear)
	   //TODO: USE UIKIT SELECTOR for iOS 16
	   // Check if its PADES sign to allow only PDF selection or any Data
	   .fileImporter(
		  isPresented: $appStatus.showDocumentImportingPicker,
		  allowedContentTypes: appStatus.signFormat == PADES_FORMAT || appStatus.signFormat == PADES_TRI_FORMAT ? [.pdf] : [.data],
		  allowsMultipleSelection: false,
		  onCompletion: handleFileImport,
		  onCancellation: handleFileImportCancellation
	   )
	   .sheet(isPresented: $appStatus.showingInfoModal) {
		  InfoModalView(contentHeight: $contentSheetHeight)
			 .presentationDetents([.height(contentSheetHeight)])
			 .accessibility(addTraits: .isModal)
			 .interactiveDismissDisabled(true)
	   }
       .sheet(isPresented: $appStatus.showSuccessModal) {
		  SuccessModalView(
                contentHeight: $contentSheetHeight,
			 title: appStatus.successModalState.title,
			 description: appStatus.successModalState.description
		  )
            .presentationDetents([.height(contentSheetHeight)])
		  .accessibility(addTraits: .isModal)
		  .interactiveDismissDisabled(true)
	   }
	   .sheet(isPresented: $appStatus.showErrorModal) {
		  ErrorModalView(
                contentHeight: $contentSheetHeight,
			 viewMode: $viewModel.viewMode,
			 shouldReloadParentView: $appStatus.navigateToSelectCertificate,
                appError: appStatus.appError ?? AppError.generalSoftwareError
		  )
            .presentationDetents([.height(contentSheetHeight)])
		  .accessibility(addTraits: .isModal)
		  .interactiveDismissDisabled(true)
	   }
	   .sheet(isPresented: $appStatus.showRecoveryModal) {
		  RecoveryModalView(contentHeight: $contentSheetHeight)
			 .presentationDetents([.height(contentSheetHeight)])
			 .accessibility(addTraits: .isModal)
			 .interactiveDismissDisabled(true)
	   }
	   .sheet(isPresented: $appStatus.showDocumentErrorModal) {
		  DocumentErrorModalView()
			 .accessibility(addTraits: .isModal)
			 .interactiveDismissDisabled(true)
	   }
    }
    
    private func onDisappear() {}
    
    private func handleFileImport(result: Result<[URL], Error>) {
	   switch result {
		  case .success(let urls):
			 appStatus.importedDataURLS = urls
			 if let fileName = urls.last?.lastPathComponent {
				let archiveName = fileName.components(separatedBy: ".").dropLast().joined(separator: ".")
				appStatus.importedDataArchiveName = archiveName
			 }
	   
		  case .failure(let error):
			 print("File import failed with error: \(error.localizedDescription)")
			 handleErrorImportingFile(error: error)
	   }
    }
    
    private func handleFileImportCancellation() {
	   appStatus.showErrorModal = true
	   appStatus.appError = AppError.userOperationCanceled
	   viewModel.cancelSign()
    }
    
    func handleErrorImportingFile(error: Error) {
	   appStatus.showErrorModal = true
	   appStatus.appError = AppError.fileLoadingLocalFile
    }

}
