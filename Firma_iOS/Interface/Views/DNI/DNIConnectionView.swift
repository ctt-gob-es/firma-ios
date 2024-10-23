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
    @State var nfcViewModel: NFCViewModel?
    
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
			 .onAppear() {
				DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
				    isSearching = false
				    appStatus.isLoading = true
				}
			 }
		  }
	   }
	   .onReceive(NotificationCenter.default.publisher(for: .DNIeError)) { notification in
		  appStatus.isLoading = false
		  appStatus.showErrorModal = true
		  step = .canStep
		  
		  if let userInfo = notification.userInfo,
			let errorCode = userInfo["errorCode"] as? Int,
			let _ = userInfo["errorMessage"] as? String {
			 nfcViewModel?.invalidateSession(errorMessage: selectInvalidationReason(error: errorCode))
		  }
	   }
    }
    
    func initModel() {
	   self.nfcViewModel = NFCViewModel(
		  can: can,
		  pin: pin,
		  signModel: signModel
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
    
    func selectInvalidationReason(error: Int) -> String {
	   if let errorCode = DNIeErrorCodes(rawValue: error) {
		  switch errorCode {
			 case .invalidCard:
				appStatus.errorModalState = .dniReadingError
			 case .burnedCard:
				appStatus.errorModalState = .dniBroken
			 case .connectionError:
				appStatus.errorModalState = .dniReadingErrorLong
			 case .notInitialized:
				appStatus.errorModalState = .dniReadingError
			 case .operationError:
				appStatus.errorModalState = .dniReadingError
			 case .badPin:
				appStatus.errorModalState = .dniIncorrectPin
			 case .lockedCard:
				appStatus.errorModalState = .dniBlockedPin
			 case .pinError:
				appStatus.errorModalState = .dniIncorrectPin
			 case .badCan:
				appStatus.errorModalState = .dniIncorrectCan
			 case .severeError:
				appStatus.errorModalState = .dniReadingErrorLong
		  }
	   }
	   
	   return appStatus.errorModalState.title
    }
}
