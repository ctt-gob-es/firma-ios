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
	   shouldSign: Binding<Bool>,
	   shouldCancelOperation: Binding<Bool>,
	   shouldSendStopSign: Binding<Bool>,
	   viewMode: Binding<ViewModes>,
	   password: Binding<String>
    ) -> some View {
	   self
		  .applyAppearBindings(viewModel: viewModel)
		  .applyViewModeBindings(viewModel: viewModel, viewMode: viewMode)
		  .applyStatusBindings(viewModel: viewModel, appStatus: appStatus)
		  .applyModalBindings(viewModel: viewModel, appStatus: appStatus)
		  .applyActionBindings(
			 appStatus: appStatus,
			 viewModel: viewModel,
			 shouldSign: shouldSign,
			 shouldCancelOperation: shouldCancelOperation,
			 shouldSendStopSign: shouldSendStopSign,
			 password: password
		  )
    }
    
    // MARK: - Appearance Bindings
    
    private func applyAppearBindings(viewModel: HomeViewModel) -> some View {
	   self
		  .onAppear { viewModel.onAppear() }
    }
    
    // MARK: - View Mode Bindings
    
    private func applyViewModeBindings(viewModel: HomeViewModel, viewMode: Binding<ViewModes>) -> some View {
	   self
		  .onChange(of: viewModel.viewMode) { viewMode.wrappedValue = $0 ?? .home }
		  .onChange(of: viewModel.selectDNIe) { newValue in
			 if newValue == true {
				viewModel.signMode = .idCard
			 }
		  }
    }
    
    // MARK: - Status Bindings
    
    private func applyStatusBindings(viewModel: HomeViewModel, appStatus: AppStatus) -> some View {
	   self
		  .onChange(of: appStatus.selectedCertificate, perform: viewModel.handleCertificateChange)
		  .onChange(of: appStatus.importedDataURLS, perform: viewModel.handleImportedDataURLsChange)
		  .onChange(of: viewModel.isLoading) { appStatus.isLoading = $0 ?? false }
		  .onChange(of: appStatus.keepParentController) { newValue in
			 if newValue {
				viewModel.signMode = .electronicCertificate
				viewModel.areCertificatesSelectable = true
			 }
		  }
		  .onChange(of: viewModel.annotations) {
			 if $0.count > 0 {
				viewModel.handleCoordinatesSelection(annotation: $0[0])
			 }
		  }
		  .onChange(of: viewModel.password) {
			 viewModel.handlePasswordEncryption(password: $0)
		  }
    }
    
    // MARK: - Modal Bindings
    
    private func applyModalBindings(viewModel: HomeViewModel, appStatus: AppStatus) -> some View {
	   self
		  .onChange(of: viewModel.appError) { appStatus.appError = $0 ?? AppError.generalSoftwareError }
		  .onChange(of: viewModel.successModalState) { appStatus.successModalState = $0 ?? .successSign }
		  .onChange(of: viewModel.showErrorModal) { appStatus.showErrorModal = $0 ?? false }
		  .onChange(of: viewModel.showSuccessModal) { appStatus.showSuccessModal = $0 ?? false }
		  .onChange(of: viewModel.showDocumentImportingPicker) { appStatus.showDocumentImportingPicker = $0 ?? false }
		  .onChange(of: viewModel.showSignCoordinatesModal) { appStatus.showSignCoordinatesModal = $0 ?? false }
    }
    
    // MARK: - Action Bindings
    
    private func applyActionBindings(
	   appStatus: AppStatus,
	   viewModel: HomeViewModel,
	   shouldSign: Binding<Bool>,
	   shouldCancelOperation: Binding<Bool>,
	   shouldSendStopSign: Binding<Bool>,
	   password: Binding<String>
    ) -> some View {
	   self
            .onChange(of: viewModel.shouldReloadCertificates, perform: viewModel.getCertificates)
		  .onChange(of: shouldSign.wrappedValue, perform: viewModel.handleShouldSignChange)
		  .onChange(of: shouldCancelOperation.wrappedValue) {
			 if $0 == true {
				viewModel.viewMode = .home
				viewModel.areCertificatesSelectable = false
				appStatus.showErrorModal = true
				appStatus.appError = AppError.userOperationCanceled
			 }
		  }
		  .onChange(of: shouldSendStopSign.wrappedValue) {
			 if $0 == true {
				viewModel.cancelOperation()
			 }
		  }
		  .onChange(of: viewModel.showTextfieldModal) { newValue in
			 if !newValue {
				if password.wrappedValue != "" {
				    viewModel.signModel?.updateExtraParams(dict: ["ownerPassword": password.wrappedValue])
				}
			 }
		  }
		  .onChange(of: viewModel.shouldCancel) { newValue in
			 viewModel.areCertificatesSelectable = false
		  }
		  .onReceive(NotificationCenter.default.publisher(for: .DNIeSuccess)) { resultBatch in
                appStatus.isLoading = false
                viewModel.handleOperationSuccess(successState: .successSign)
		  }
		  .onReceive(NotificationCenter.default.publisher(for: .ErrorModalCancelButtonAction)) { _ in
			 viewModel.cancelOperation()
			 appStatus.isLoading = false
		  }
            .onReceive(NotificationCenter.default.publisher(for: .CloseSignMode)) { _ in
               viewModel.resetHomeViewModelVariables()
               appStatus.isLoading = false
            }
		  .onReceive(NotificationCenter.default.publisher(for: .SuccessSavingArchive)) { _ in
			 viewModel.sendSuccessSavingArchive()
		  }
		  .onReceive(NotificationCenter.default.publisher(for: .ErrorSavingArchive)) { _ in
			 viewModel.sendErrorOperation(error: AppError.saveHistorySign)
		  }
    }
}
