//
//  SignView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 19/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI
import Combine

struct HomeView: View {
    @EnvironmentObject private var appStatus: AppStatus
    @StateObject private var viewModel: HomeViewModel
    @State private var contentSheetHeight: CGFloat = 0
    
    @Binding var shouldSign: Bool
    @Binding var viewMode: ViewModes
    
    @State var password: String = ""
    @Binding var shouldCancelOperation: Bool
    @State var shouldSendStopSign: Bool = false
    
    init(viewMode: Binding<ViewModes>,
	    shouldSign: Binding<Bool>,
	    viewModel: HomeViewModel,
	    shouldCancel: Binding<Bool>) {
	   self._viewModel = StateObject(wrappedValue: viewModel)
	   self._shouldSign = shouldSign
	   self._viewMode = viewMode
	   self._shouldCancelOperation = shouldCancel
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
	   .applyHomeViewBindings(
		  viewModel: viewModel,
		  appStatus: appStatus,
		  shouldSign: $shouldSign,
		  shouldCancelOperation: $shouldCancelOperation,
		  shouldSendStopSign: $shouldSendStopSign,
		  viewMode: $viewMode,
		  password: $password
	   )
        .sheet(isPresented: $appStatus.showDocumentPicker) {
           DocumentPicker(
              onDocumentsPicked: { url in
                 if FileUtils().handleFile(at: url) {
                     viewModel.certificateURL = url
                     viewModel.navigateToAddCertificate.toggle()
                 } else {
                         appStatus.appError = AppError.certificateLoadingError
                     appStatus.showErrorModal.toggle()
                 }
              }, onCancel: {
                 print("User cancelled the Document Interaction")
              }
           )
           .interactiveDismissDisabled(true)
           .accessibility(addTraits: .isModal)
        }
        .sheet(isPresented: $appStatus.showDeleteModal) {
           if let selectedCertificate = appStatus.selectedCertificate {
              DeleteCertificateModalView(
                 contentHeight: $contentSheetHeight,
                 shouldReload: $viewModel.shouldReloadCertificates,
                 certificate: selectedCertificate
              )
              .presentationDetents([.height(contentSheetHeight)])
              .accessibility(addTraits: .isModal)
              .interactiveDismissDisabled(true)
           }
        }
        .sheet(isPresented: $viewModel.showPseudonymModal) {
            CertificateInfoModalView(contentHeight: $contentSheetHeight, title: "pseudonym_modal_title", message: "pseudonym_modal_description", onContinue: {
                viewModel.checkCertificateSelected(step: .pseudonymPass)})
                .presentationDetents([.height(contentSheetHeight)])
                .accessibility(addTraits: .isModal)
                .interactiveDismissDisabled(true)
        }
        .sheet(isPresented: $viewModel.showCertificateInfoModal) {
            CertificateInfoModalView(contentHeight: $contentSheetHeight, title: viewModel.titleCertificateInfoModal, message: viewModel.messageCertificateInfoModal, onContinue: { viewModel.checkCertificateSelected(step: .expiredNearPass)})
                .presentationDetents([.height(contentSheetHeight)])
                .accessibility(addTraits: .isModal)
                .interactiveDismissDisabled(true)
        }
	   .sheet(isPresented: $viewModel.showTextfieldModal) {
		  TextfieldModalView(contentHeight: $contentSheetHeight, password: $password, shouldCancelOperation: $shouldCancelOperation)
                .presentationDetents([.height(contentSheetHeight)])
			 .accessibility(addTraits: .isModal)
			 .interactiveDismissDisabled(true)
	   }
	   .sheet(isPresented: $viewModel.showSelectSignMode,
			onDismiss: {
		  if viewMode == .sign {
			 if (appStatus.keepParentController == false && viewModel.selectDNIe == false) {
				//User aborted sign
                    viewModel.cancelOperation()
                    shouldCancelOperation = true
			 } else {
                    if appStatus.keepParentController && self.viewModel.certificates.isEmpty {
				    //There is no certificate in the app
                        viewModel.sendErrorOperation(error: AppError.certificateNeeded)
				}
				if let visibleSignature = viewModel.signModel?.visibleSignature {
				    //We need to select the coordinates of the sign
				    viewModel.showSignCoordinatesModal = true
				}
			 }
		  } else {
			 if (appStatus.navigateToSelectCertificate == false && viewModel.selectDNIe == false) {
				//User aborted local archive sign
			 }
		  }
	   }) {
		  SignModalView(
                contentHeight: $contentSheetHeight,
			 certificateSignAction: viewMode == .sign ? $appStatus.keepParentController : $appStatus.navigateToSelectCertificate,
			 dniSignAction: $viewModel.selectDNIe
		  )
		  .presentationDetents([.height(contentSheetHeight)])
		  .accessibility(addTraits: .isModal)
		  .interactiveDismissDisabled(true)
	   }
	   .fullScreenCover(isPresented: $viewModel.showSignCoordinatesModal, onDismiss: {
		  if viewModel.annotations.isEmpty {
			 viewModel.handleNotAnyCoordinatesSelected()
		  }
	   }) {
		  if let stringBase64Data = viewModel.signModel?.datosInUse,
			let pdfData = Base64Utils.decode(stringBase64Data, urlSafe: true) {
			 PDFCoordinatesModalWrapper(
				pdfData: pdfData,
				annotations: $viewModel.annotations,
				password: $viewModel.password
			 )
			 .interactiveDismissDisabled(true)
		  }
	   }
        .navigationDestination(isPresented: $viewModel.navigateToAddCertificate) {
            AddCertificateView(
                viewModel: AddCertificateViewModel(certificateURL: viewModel.certificateURL),
                isPresented: $viewModel.navigateToAddCertificate,
                shouldReload: $viewModel.shouldReloadCertificates
           )
        }
	   .navigationDestination(isPresented: $viewModel.selectDNIe) {
		  DNIView(
			 signModel: viewModel.signModel,
			 parameters: viewModel.parameters,
			 hasDismissed: $shouldSendStopSign
		  )
        }
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
		  
		  AccessibleText(content: viewMode == .sign ? NSLocalizedString("select_certificates_description", bundle: Bundle.main, comment: "") : NSLocalizedString("home_certificates_description", bundle: Bundle.main, comment: ""))
			 .regularStyle(foregroundColor: ColorConstants.Text.secondary)
	   }
	   .padding([.horizontal, .top])
    }
    
    private var certificateListOrNoDataView: some View {
	   Group {
            if !viewModel.certificates.isEmpty {
                List(viewModel.certificates, id: \.certificateRef) { certificate in
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
		  if viewMode == .home {
			 homeButtons
		  } else {
			 signButtons
		  }
	   }
    }
    
    private var homeButtons : some View {
	   VStack {
		  Button(action: {
			appStatus.showDocumentPicker.toggle()
		 }) {
			AccessibleText(content: NSLocalizedString("home_certificates_add_certificate_button_title", bundle: Bundle.main, comment: ""))
		 }
		 .buttonStyle(BorderedButtonStyle())
	   }
    }
    
    private var signButtons: some View {
	   Button(action: viewModel.handleButtonAction) {
		  if let buttonTitle = viewModel.buttonTitle {
			 AccessibleText(content: buttonTitle)
		  }
	   }
	   .buttonStyle(CustomButtonStyle(isEnabled: viewModel.buttonEnabled ?? false))
    }
}

