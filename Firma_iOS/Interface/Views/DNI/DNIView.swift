//
//  DNIView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 17/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct DNIView: View {
    @EnvironmentObject private var appStatus : AppStatus
    
    @State private var contentSheetHeight: CGFloat = 0
    @Environment(\.presentationMode) var presentationMode
    @State private var isShowingModal: Bool = false
    @State private var navigateToConnection: Bool = false
    @State var signModel: SignModel? = nil
    @State var parameters: NSMutableDictionary? = nil
    @State var isLocalSign: Bool
    @Binding var hasDismissed: Bool
    
    var body: some View {
	   VStack(alignment: .center, spacing: 20) {
		  descriptionView
		  
		  Spacer()
		  
		  compatibleButton
		  
		  signButton
	   }
	   .padding()
	   .background(ColorConstants.Background.main)
	   .navigationDestination(isPresented: $navigateToConnection) {
		  if let signModel = signModel {
			 DNIConnectionView(
				isPresented: $navigateToConnection,
				signModel: signModel,
				parameters: parameters,
				isLocalSign: isLocalSign
			 )
		  }
	   }
	   .sheet(isPresented: $isShowingModal) {
            DNICompatibleModalView(contentHeight: $contentSheetHeight)
                .presentationDetents([.height(contentSheetHeight)])
                .accessibility(addTraits: .isModal)
                .interactiveDismissDisabled(true)
	   }
	   .navigationBarBackButtonHidden(true)
	   .toolbar {
		  ToolbarItem(placement: .navigationBarLeading) {
			 Button(action: {
				handleBackButton()
			 }) {
				HStack {
				    Image("backbutton")
				}
			 }
		  }
	   }
    }
    
    // MARK: - Subviews
    
    private var descriptionView: some View {
	   VStack(alignment: .leading) {
		  AccessibleText(content: NSLocalizedString("dni_view_title", bundle: Bundle.main, comment: ""))
			 .titleBigStyleBlack(
				foregroundColor: ColorConstants.Text.primary,
				alignment: .leading
			 )
			 .padding(.bottom)
		  
		  let descriptionText = NSLocalizedString("dni_view_description_1", bundle: Bundle.main, comment: "")
			 + NSLocalizedString("dni_view_description_2", bundle: Bundle.main, comment: "")
			 + NSLocalizedString("dni_view_description_3", bundle: Bundle.main, comment: "")
			 + NSLocalizedString("dni_view_description_4", bundle: Bundle.main, comment: "")
		  
		  Text(descriptionText)
			 .regularStyle(foregroundColor: ColorConstants.Text.secondary)
			 .accessibilityLabel(Text(descriptionText))
	   }
    }
    
    private var compatibleButton: some View {
	   Button(action: {
		  isShowingModal.toggle()
	   }) {
		  AccessibleText(content: NSLocalizedString("dni_compatible_button_title", bundle: Bundle.main, comment: ""))
			 .titleStyleBlack(foregroundColor: ColorConstants.Background.buttonEnabled)
			 .underline()
	   }
    }
    
    private var signButton: some View {
	   Button(action: {
		  navigateToConnection.toggle()
	   }) {
		  AccessibleText(content: NSLocalizedString("dni_view_button_title", bundle: Bundle.main, comment: ""))
	   }
	   .buttonStyle(CustomButtonStyle(isEnabled: true))
    }
    
    // MARK: - Custom Back Button Handler
    private func handleBackButton() {
	   DispatchQueue.main.async {
		  hasDismissed = true
		  presentationMode.wrappedValue.dismiss()
	   }
    }
}
