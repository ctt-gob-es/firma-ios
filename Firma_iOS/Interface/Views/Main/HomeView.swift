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
    
    @Binding var certificates: [AOCertificateInfo]?
    @Binding var shouldSign: Bool
    @Binding var showDocumentSavingPicker: Bool
    @Binding var downloadedData: URL?
    @Binding var viewMode: ViewModes
    
    @State var password: String = ""
    @Binding var shouldCancelOperation: Bool
    @State var shouldSendStopSign: Bool = false
    
    init(certificates: Binding<[AOCertificateInfo]?>,
	    viewMode: Binding<ViewModes>,
	    shouldSign: Binding<Bool>,
	    showDocumentSavingPicker: Binding<Bool>,
	    downloadedData: Binding<URL?>,
	    viewModel: HomeViewModel,
	    shouldCancel: Binding<Bool>) {
	   self._viewModel = StateObject(wrappedValue: viewModel)
	   self._certificates = certificates
	   self._shouldSign = shouldSign
	   self._showDocumentSavingPicker = showDocumentSavingPicker
	   self._downloadedData = downloadedData
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
		  certificates: $certificates,
		  shouldSign: $shouldSign,
		  shouldCancelOperation: $shouldCancelOperation,
		  shouldSendStopSign: $shouldSendStopSign,
		  viewMode: $viewMode,
		  password: $password
	   )
	   .sheet(isPresented: $viewModel.showTextfieldModal) {
		  TextfieldModalView(password: $password, shouldCancelOperation: $shouldCancelOperation)
			 .fixedSize(horizontal: false, vertical: true)
			 .modifier(GetHeightModifier(height: $viewModel.sheetHeight))
			 .presentationDetents([.height(viewModel.sheetHeight)])
			 .accessibility(addTraits: .isModal)
			 .interactiveDismissDisabled(true)
	   }
	   .sheet(isPresented: $viewModel.showSelectSignMode,
			onDismiss: {
		  if viewMode == .sign {
			 if (appStatus.keepParentController == false && viewModel.selectDNIe == false) {
				//User aborted sign
                    viewModel.sendError(error: ErrorCodes.FunctionalErrorCodes.userOperationCanceled.info)
				shouldCancelOperation = true
			 } else {
				if appStatus.keepParentController && ( self.certificates?.count == 0 || self.certificates == nil)  {
				    //There is no certificate in the app
                        let errorCertificateNeeded = ErrorCodes.FunctionalErrorCodes.certificateNeeded.info
                        viewModel.sendError(error: errorCertificateNeeded)
				    viewModel.showErrorModal(error: errorCertificateNeeded)
				}
				if let visibleSignature = viewModel.signModel?.visibleSignature,
				    visibleSignature {
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
			 certificateSignAction: viewMode == .sign ? $appStatus.keepParentController : $appStatus.navigateToSelectCertificate,
			 dniSignAction: $viewModel.selectDNIe
		  )
		  .fixedSize(horizontal: false, vertical: true)
		  .modifier(GetHeightModifier(height: $viewModel.sheetHeight))
		  .presentationDetents([.height(viewModel.sheetHeight)])
		  .accessibility(addTraits: .isModal)
		  .interactiveDismissDisabled(true)
	   }
	   .sheet(isPresented: $viewModel.showSignCoordinatesModal, onDismiss: {
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
		  if viewMode == .home {
			 homeButtons
		  } else {
			 signButtons
		  }
	   }
    }
    
    private var homeButtons : some View {
	   VStack {
		  /*Button(action: {
		  appStatus.showSignModal = true
		  }) {
		  AccessibleText(content: NSLocalizedString("home_certificates_sign_button_title", bundle: Bundle.main, comment: ""))
		  }
		  .buttonStyle(CustomButtonStyle(isEnabled: true))*/
		 
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

