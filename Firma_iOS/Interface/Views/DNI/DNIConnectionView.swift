//
//  DNIConnectionView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 17/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct DNIConnectionView: View {
    @EnvironmentObject private var appStatus : AppStatus
    @Environment(\.presentationMode) var presentationMode
    @Binding var isPresented: Bool
    @State var step: DNIConnectionSteps = .canStep
    @State var buttonEnabled: Bool = false
    @State var showFieldError: Bool = false
    @State var isSearching: Bool = false
    @State private var sheetHeight: CGFloat = .zero
    @State var can: String = PrivateConstants.can
    @State var pin: String = PrivateConstants.pin
    @State var signModel: SignModel
    @State var parameters: NSMutableDictionary?
    @State var nfcViewModel: NFCViewModel?
    @State var showSignCoordinatesModal: Bool = false
    @State var annotations: [PDFAnnotation] = []
    @State var password: String = ""
    
    var body: some View {
	   VStack {
		  DNIStepHeaderView(step: $step)
		  
		  if step == .canStep {
			 DNICanView(
				buttonEnabled: $buttonEnabled,
				showError: $showFieldError,
				can: $can
			 )
		  } else if step == .pinStep {
			 DNIPinView(
				pin: $pin
			 )
		  } else if step == .nfcStep {
			 DNIScanView(
				isSearching: $isSearching
			 )
		  }
		  
		  Spacer()
		  
		  Button(action: {
			 if buttonEnabled {
				doStep()
			 }
		  }) {
			 AccessibleText(content: step.buttonTitle)
		  }
		  .buttonStyle(CustomButtonStyle(isEnabled: buttonEnabled))
	   }
	   .onAppear() {
		  onAppear()
	   }
	   .dismissKeyboardOnTap()
	   .navigationBarItems(trailing: HStack(spacing: 4) {
		  NavigationBarButton(imageName: "cross_gray", action: {
			 isPresented.toggle()
		  })
	   }
		  .padding(.bottom, 4)
	   )
	   .sheet(isPresented: $isSearching) {
		  if let nfcViewModel = nfcViewModel {
			 FindDNIModalView(
				model: nfcViewModel
			 )
			 .fixedSize(horizontal: false, vertical: true)
			 .modifier(GetHeightModifier(height: $sheetHeight))
			 .presentationDetents([.height(sheetHeight)])
			 .accessibility(addTraits: .isModal)
			 .interactiveDismissDisabled(true)
			 .onAppear() {
				DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
				    isSearching = false
				    appStatus.isLoading = true
				}
			 }
		  }
	   }
	   .sheet(isPresented: $showSignCoordinatesModal, onDismiss: {
		  if self.annotations.isEmpty {
			 
		  }
	   }) {
		  if let stringBase64Data = signModel.datosInUse,
			let pdfData = Base64Utils.decode(stringBase64Data, urlSafe: true) {
			 PDFCoordinatesModalWrapper(
				pdfData: pdfData,
				annotations: $annotations,
				password: $password
			 )
			 .interactiveDismissDisabled(true)
		  }
	   }
	   .onChange(of: annotations) {
		  if $0.count > 0 {
			 handleCoordinatesSelection(annotation: $0[0])
		  }
	   }
	   .onChange(of: password) {
		  handlePasswordEncryption(password: password)
	   }
	   .onReceive(NotificationCenter.default.publisher(for: .DNIeError)) { notification in
		  appStatus.isLoading = false
		  appStatus.showErrorModal = true
		  
		  if let userInfo = notification.userInfo,
			let error = userInfo["errorInfo"] as? ErrorInfo {
                
                if (error.code == ErrorCodes.DNIeErrorCodes.badCan.info.code) {
				step = .canStep
                } else if (error.code == ErrorCodes.DNIeErrorCodes.badPin.info.code) {
				step = .pinStep
			 } else {
				step = .nfcStep
				initModel()
			 }
			 appStatus.errorInfo = error
                nfcViewModel?.invalidateSession(errorMessage: error.errorModalType.title)
		  } else {
			 print("No user info available in the notification")
		  }
	   }
    }
    
    func initModel() {
	   self.nfcViewModel = NFCViewModel(
		  can: can,
		  pin: pin,
		  signModel: signModel,
		  parameters: parameters
	   )
    }
    
    func doStep() {
	   if step == .canStep {
		  step = .pinStep
	   } else if step == .pinStep {
		  step = .nfcStep
		  initModel()
	   } else if step == .nfcStep {
		  isSearching = true
	   }
    }
    
    func handleCoordinatesSelection(annotation: PDFAnnotation) {
	   PDFCoordinateUtils.setCoordinatesFromAnnotation(signModel: self.signModel, annotation: annotation)
    }
    
    func handlePasswordEncryption(password: String) {
	   self.signModel.updateExtraParams(dict: ["ownerPassword": password])
    }
    
}
