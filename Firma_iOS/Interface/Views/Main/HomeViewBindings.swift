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
		  .onChange(of: viewModel.viewMode) {  _, newValue in viewMode.wrappedValue = newValue ?? .home }
		  .onChange(of: viewModel.selectDNIe) { _, newValue in
			 if newValue == true {
				viewModel.signMode = .idCard
			 }
		  }
    }
    
    // MARK: - Status Bindings
    
    private func applyStatusBindings(viewModel: HomeViewModel, appStatus: AppStatus) -> some View {
	   self
            .onChange(of: appStatus.selectedCertificate) { _, newValue in viewModel.handleCertificateChange(newValue) }
		  .onChange(of: viewModel.isLoading) { _, newValue in appStatus.isLoading = newValue ?? false }
            .onChange(of: appStatus.keepParentController) { _, newValue in
			 if newValue {
				viewModel.signMode = .electronicCertificate
				viewModel.areCertificatesSelectable = true
			 }
		  }
		  .onChange(of: viewModel.annotations) { _, newValue in
			 if newValue.count > 0 {
				viewModel.handleCoordinatesSelection(annotation: newValue[0])
			 }
		  }
		  .onChange(of: viewModel.password) { _, newValue in
			 viewModel.handlePasswordEncryption(password: newValue)
		  }
    }
    
    // MARK: - Modal Bindings
    
    private func applyModalBindings(viewModel: HomeViewModel, appStatus: AppStatus) -> some View {
	   self
		  .onChange(of: viewModel.appError) {_, newValue in appStatus.appError = newValue ?? AppError.generalSoftwareError }
		  .onChange(of: viewModel.successModalState) {_, newValue in appStatus.successModalState = newValue ?? .successSign }
		  .onChange(of: viewModel.showErrorModal) {_, newValue in appStatus.showErrorModal = newValue ?? false }
		  .onChange(of: viewModel.showSuccessModal) {_, newValue in appStatus.showSuccessModal = newValue ?? false }
		  .onChange(of: viewModel.showSignCoordinatesModal) {_, newValue in appStatus.showSignCoordinatesModal = newValue }
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
            .onChange(of: viewModel.shouldReloadCertificates) {_, newValue in viewModel.getCertificates(newValue) }
            .onChange(of: shouldSign.wrappedValue) {_, newValue in viewModel.handleShouldSignChange(newValue) }
		  .onChange(of: shouldCancelOperation.wrappedValue) { _, newValue in
			 if newValue {
				viewModel.viewMode = .home
				viewModel.areCertificatesSelectable = false
				appStatus.showErrorModal = true
				appStatus.appError = AppError.userOperationCanceled
			 }
		  }
		  .onChange(of: shouldSendStopSign.wrappedValue) { _, newValue in
			 if newValue == true {
				viewModel.cancelOperation()
			 }
		  }
		  .onChange(of: viewModel.showTextfieldModal) { _, newValue in
			 if !newValue {
				if password.wrappedValue != "" {
				    viewModel.signModel?.updateExtraParams(dict: ["ownerPassword": password.wrappedValue])
				}
			 }
		  }
		  .onChange(of: viewModel.shouldCancel) {_, newValue in
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
    }
}
