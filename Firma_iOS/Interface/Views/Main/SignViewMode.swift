//
//  SignView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 19/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI
import Combine

struct SignViewMode: View {
    @EnvironmentObject private var appStatus: AppStatus
    @StateObject private var viewModel: SignViewModel
    
    @Binding var certificates: [AOCertificateInfo]?
    @Binding var shouldSign: Bool
    @Binding var showDocumentSavingPicker: Bool
    @Binding var downloadedData: URL?
    @Binding var viewMode: ViewModes
    
    init(certificates: Binding<[AOCertificateInfo]?>,
	    viewMode: Binding<ViewModes>,
	    shouldSign: Binding<Bool>,
	    showDocumentSavingPicker: Binding<Bool>,
	    downloadedData: Binding<URL?>,
	    viewModel: SignViewModel) {
	   self._viewModel = StateObject(wrappedValue: viewModel)
	   self._certificates = certificates
	   self._shouldSign = shouldSign
	   self._showDocumentSavingPicker = showDocumentSavingPicker
	   self._downloadedData = downloadedData
	   self._viewMode = viewMode
    }
    
    var body: some View {
	   VStack {
		  if appStatus.connectionError {
			 HomeErrorView(state: .connectionError)
		  } else if appStatus.updateNeeded {
			 HomeErrorView(state: .updateNeeded)
		  } else {
			 mainContent
		  }
	   }
	   .onAppear() { viewModel.onAppear() }
	   .onChange(of: viewModel.viewMode) { viewMode = $0 ?? .home}
	   .onChange(of: appStatus.selectedCertificate, perform: viewModel.handleCertificateChange)
	   .onChange(of: shouldSign, perform: viewModel.handleShouldSignChange)
	   .onChange(of: appStatus.importedDataURLS, perform: viewModel.handleImportedDataURLsChange)
	   .onChange(of: viewModel.isLoading) { appStatus.isLoading = $0 ?? false }
	   .onChange(of: viewModel.showPseudonymModal) { appStatus.showPseudonymModal = $0 ?? false }
	   .onChange(of: viewModel.errorModalState) { appStatus.errorModalState = $0 ?? .globalError }
	   .onChange(of: viewModel.successModalState) { appStatus.successModalState = $0 ?? .successSign}
	   .onChange(of: viewModel.showErrorModal) { appStatus.showErrorModal = $0 ?? false }
	   .onChange(of: viewModel.showSuccessModal) { appStatus.showSuccessModal = $0 ?? false }
	   .onChange(of: viewModel.showDocumentImportingPicker) { appStatus.showDocumentImportingPicker = $0 ?? false }
	   .onChange(of: viewModel.showDocumentSavingPicker) { appStatus.showDocumentSavingPicker = $0 ?? false }
	   .onChange(of: viewModel.errorModalDescription) { appStatus.errorModalDescription = $0 ?? "" }
    }
    
    private var mainContent: some View {
	   VStack(alignment: .center, spacing: 20) {
		  header
		  certificateListOrNoDataView
		  actionButton
	   }
    }
    
    private var header: some View {
	   VStack(alignment: .leading) {
		  AccessibleText(content: NSLocalizedString("home_certificates_label", bundle: Bundle.main, comment: ""))
			 .titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
			 .accessibilityAddTraits(.isHeader)
		  
		  AccessibleText(content: NSLocalizedString("select_certificates_description", bundle: Bundle.main, comment: ""))
			 .regularStyle(foregroundColor: ColorConstants.Text.secondary)
	   }
	   .padding([.horizontal, .top])
    }
    
    private var certificateListOrNoDataView: some View {
	   Group {
		  if let certificates = certificates {
			 List(certificates, id: \.certificateRef) { certificate in
				CertificateCellView(
				    certificateInfo: certificate,
				    isSelectable: $viewModel.areCertificatesSelectable,
				    isSelected: appStatus.selectedCertificate == certificate
				)
				.listRowSeparator(.hidden)
			 }
			 .listStyle(PlainListStyle())
		  } else {
			 VStack {
				Spacer()
				NoDataView(
				    title: NSLocalizedString("home_certificates_not_available_title", bundle: Bundle.main, comment: ""),
				    description: NSLocalizedString("home_certificates_not_available_description", bundle: Bundle.main, comment: "")
				)
				Spacer()
			 }
		  }
	   }
    }
    
    private var actionButton: some View {
	   VStack(spacing: 10) {
		  if let buttonTitle = viewModel.buttonTitle {
			 Button(action: viewModel.handleButtonAction) {
				AccessibleText(content: buttonTitle)
			 }
			 .buttonStyle(CustomButtonStyle(isEnabled: viewModel.buttonEnabled ?? false))
		  }
	   }
    }
}
