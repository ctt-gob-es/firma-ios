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
    @Environment(\.presentationMode) var presentationMode
    @State var isShowingModal: Bool = false
    @State private var sheetHeight: CGFloat = .zero
    @State var navigateToConnection = false
    @State var signModel: SignModel? = nil
    
    var body: some View {
	   VStack(alignment: .center, spacing: 20) {
		  VStack(alignment: .leading) {
			 AccessibleText(content: NSLocalizedString("dni_view_title", bundle: Bundle.main, comment: ""))
				.titleBigStyleBlack(
				    foregroundColor: ColorConstants.Text.primary,
				    alignment: .leading
				)
				.padding(.bottom)
			 
			 (
				Text(NSLocalizedString("dni_view_description_1", bundle: Bundle.main, comment: ""))
				    .regularStyle(foregroundColor: ColorConstants.Text.secondary)
				+ Text(NSLocalizedString("dni_view_description_2", bundle: Bundle.main, comment: ""))
				    .regularBoldStyle(foregroundColor: ColorConstants.Text.secondary)
				+ Text(NSLocalizedString("dni_view_description_3", bundle: Bundle.main, comment: ""))
				    .regularStyle(foregroundColor: ColorConstants.Text.secondary)
				+ Text(NSLocalizedString("dni_view_description_4", bundle: Bundle.main, comment: ""))
				    .regularBoldStyle(foregroundColor: ColorConstants.Text.secondary)
			 )
			 .accessibilityLabel(Text(NSLocalizedString("dni_view_description_1", bundle: Bundle.main, comment: "") + NSLocalizedString("dni_view_description_2", bundle: Bundle.main, comment: "")  + NSLocalizedString("dni_view_description_3", bundle: Bundle.main, comment: "")  + NSLocalizedString("dni_view_description_4", bundle: Bundle.main, comment: "")))
		  }
		  
		  Spacer()
		  
		  Button(action: {
			 isShowingModal.toggle()
		  }) {
			 AccessibleText(content: NSLocalizedString("dni_compatible_button_title", bundle: Bundle.main, comment: ""))
				.titleStyleBlack(foregroundColor: ColorConstants.Background.buttonEnabled)
				.underline()
		  }
		  
		  Button(action: {
			 navigateToConnection.toggle()
		  }) {
			 AccessibleText(content: NSLocalizedString("dni_view_button_title", bundle: Bundle.main, comment: ""))
		  }
		  .buttonStyle(CustomButtonStyle(isEnabled: true))
	   }
	   .padding()
	   .background(ColorConstants.Background.main)
	   .navigationDestination(isPresented: $navigateToConnection) {
		  if let signModel = signModel {
			 DNIConnectionView(
				isPresented: $navigateToConnection,
				signModel: signModel
			 )
		  }
	   }
	   .sheet(isPresented: $isShowingModal) {
		  DNICompatibleModalView()
			 .fixedSize(horizontal: false, vertical: true)
			 .modifier(GetHeightModifier(height: $sheetHeight))
			 .presentationDetents([.height(sheetHeight)])
			 .accessibility(addTraits: .isModal)
	   }
	   .onReceive(NotificationCenter.default.publisher(for: .ErrorModalCancelButtonAction)) { _ in
		  navigateToConnection = false
		  appStatus.navigateToDNI = false
		  presentationMode.wrappedValue.dismiss()
	   }
    }
}
