//
//  DNIConnectionView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 17/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct DNIConnectionView: View {
    @Binding var isPresented: Bool
    @State var step: ConnectionSteps = .canStep
    @State var buttonEnabled: Bool = false
    @State var isSearching: Bool = false
    @State private var sheetHeight: CGFloat = .zero
    @State private var navigationTitle = ""
    
    var body: some View {
	   VStack {
		  DNIStepHeaderView(step: $step)
		  
		  if step == .canStep {
			 DNICanView(
				buttonEnabled: $buttonEnabled, can: ""
			 )
		  } else if step == .pinStep {
			 DNIPinView(
				pin: ""
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
		  FindDNIModalView()
			 .fixedSize(horizontal: false, vertical: true)
			 .modifier(GetHeightModifier(height: $sheetHeight))
			 .presentationDetents([.height(sheetHeight)])
			 .accessibility(addTraits: .isModal)
	   }
	   .onAppear() {
		  navigationTitle = ""
	   }
	   .onDisappear {
		  navigationTitle = step.title
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

enum ConnectionSteps {
    case canStep
    case pinStep
    case nfcStep
    
    var step: Int {
	   switch self {
		  case .canStep:
			 return 1
		  case .pinStep:
			 return 2
		  case .nfcStep:
			 return 3
	   }
    }
    
    var title: String {
	   switch self {
		  case .canStep:
			 return NSLocalizedString("dni_connection_step_one_title", bundle: Bundle.main, comment: "")
		  case .pinStep:
			 return NSLocalizedString("dni_connection_step_two_title", bundle: Bundle.main, comment: "")
		  case .nfcStep:
			 return NSLocalizedString("dni_connection_step_three_title", bundle: Bundle.main, comment: "")
	   }
    }
    
    var buttonTitle: String {
	   switch self {
		  case .canStep:
			 return NSLocalizedString("dni_connection_step_one_button_title", bundle: Bundle.main, comment: "")
		  case .pinStep:
			 return NSLocalizedString("dni_connection_step_two_button_title", bundle: Bundle.main, comment: "")
		  case .nfcStep:
			 return NSLocalizedString("dni_connection_step_three_button_title", bundle: Bundle.main, comment: "")
	   }
    }
}



