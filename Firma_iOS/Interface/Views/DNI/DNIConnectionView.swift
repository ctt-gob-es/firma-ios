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
    @Binding var isPresented: Bool
    @State var step: DNIConnectionSteps = .canStep
    @State var buttonEnabled: Bool = false
    @State var showFieldError: Bool = false
    @State var isSearching: Bool = false
    @State private var sheetHeight: CGFloat = .zero
    @State var can: String = PrivateConstants.can
    @State var pin: String = PrivateConstants.pin
    @State var algorithm: String
    @State var signModel: SignModel
    @State var certificateUtils: CertificateUtils
    
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
		  FindDNIModalView(
			 model: NFCViewModel(
				can: can,
				pin: pin,
				algorithm: algorithm,
				signModel: signModel,
				certificateUtils: certificateUtils
			 )
		  )
		  .fixedSize(horizontal: false, vertical: true)
		  .modifier(GetHeightModifier(height: $sheetHeight))
		  .presentationDetents([.height(sheetHeight)])
		  .accessibility(addTraits: .isModal)
		  .onAppear() {
			 DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
				isSearching = false
			 }
		  }
	   }
    }
    
    func doStep() {
	   if step == .canStep {
		  step = .pinStep
	   } else if step == .pinStep {
		  step = .nfcStep
	   } else if step == .nfcStep {
		  isSearching = true
	   }
    }
}
