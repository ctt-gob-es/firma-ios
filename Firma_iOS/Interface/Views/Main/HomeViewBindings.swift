//
//  HomeViewBindings.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 16/10/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

import SwiftUI

extension View {
    func applyHomeViewBindings(
	   viewModel: HomeViewModel,
	   appStatus: AppStatus,
	   certificates: Binding<[AOCertificateInfo]?>,
	   shouldSign: Binding<Bool>,
	   shouldCancelOperation: Binding<Bool>,
	   shouldSendStopSign: Binding<Bool>,
	   viewMode: Binding<ViewModes>,
	   password: Binding<String>
    ) -> some View {
	   self
	   .onAppear { viewModel.onAppear() }
	   .onChange(of: viewModel.viewMode) { viewMode.wrappedValue = $0 ?? .home }
	   .onChange(of: appStatus.selectedCertificate, perform: viewModel.handleCertificateChange)
	   .onChange(of: shouldSign.wrappedValue, perform: viewModel.handleShouldSignChange)
	   .onChange(of: appStatus.importedDataURLS, perform: viewModel.handleImportedDataURLsChange)
	   .onChange(of: viewModel.isLoading) { appStatus.isLoading = $0 ?? false }
	   .onChange(of: viewModel.showPseudonymModal) { appStatus.showPseudonymModal = $0 ?? false }
	   .onChange(of: viewModel.errorModalState) { appStatus.errorModalState = $0 ?? .globalError }
	   .onChange(of: viewModel.successModalState) { appStatus.successModalState = $0 ?? .successSign }
	   .onChange(of: viewModel.showErrorModal) { appStatus.showErrorModal = $0 ?? false }
	   .onChange(of: viewModel.showSuccessModal) { appStatus.showSuccessModal = $0 ?? false }
	   .onChange(of: viewModel.showDocumentImportingPicker) { appStatus.showDocumentImportingPicker = $0 ?? false }
	   .onChange(of: viewModel.showDocumentSavingPicker) { appStatus.showDocumentSavingPicker = $0 ?? false }
	   .onChange(of: viewModel.downloadedData) { appStatus.downloadedData = $0 }
	   .onChange(of: viewModel.showSignModal) { appStatus.showSignModal = $0 ?? false }
	   .onChange(of: viewModel.selectDNIe) { oldValue, newValue in
		  if newValue == true {
			 viewModel.signMode = .idCard
		  }
	   }
	   .onChange(of: shouldCancelOperation.wrappedValue) {
		  if $0 == true {
			 viewModel.viewMode = .home
			 viewModel.areCertificatesSelectable = false
		  }
	   }
	   .onChange(of: shouldSendStopSign.wrappedValue) {
		  if $0 == true {
			 viewModel.viewMode = .home
			 viewModel.areCertificatesSelectable = false
			 viewModel.sendError(error: NSError(domain: "SignError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Unknown error"]))
		  }
	   }
	   .onChange(of: viewModel.showTextfieldModal) { oldValue, newValue in
		  if !newValue {
			 if password.wrappedValue != "" {
				viewModel.signModel?.updateExtraParams(dict: ["ownerPassword": password.wrappedValue])
			 }
		  }
	   }
	   .onChange(of: appStatus.keepParentController) { oldValue, newValue in
		  if newValue {
			 viewModel.signMode = .electronicCertificate
			 viewModel.areCertificatesSelectable = true
		  }
	   }
	   .onReceive(NotificationCenter.default.publisher(for: .DNIeSuccess)) { _ in
		  viewModel.handleFinishDNISign()
		  appStatus.isLoading = false
		  appStatus.showSuccessModal = true
		  appStatus.successModalState = .successSign
	   }
	   .onReceive(NotificationCenter.default.publisher(for: .ErrorModalCancelButtonAction)) { _ in
		  viewModel.handleFinishDNISign()
		  appStatus.isLoading = false
	   }
    }
}
