//
//  DeleteHistoricalModal.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 9/8/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

struct DeleteHistoricalModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var viewModel : HistoricalViewModel
    
    var body: some View {
	   VStack(spacing: 10) {
		  HStack {
			 Image("trash")
				.resizable()
				.scaledToFit()
				.frame(width: 64, height: 64)
			 
			 Spacer()
		  }
		  
		  VStack(alignment: .leading, spacing: 0) {
			 AccessibleText(content: NSLocalizedString("delete_historical_title", bundle: Bundle.main, comment: ""))
				.titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
				.accessibilityAddTraits(.isHeader)
				.padding(.bottom)
			 
			 AccessibleText(content: NSLocalizedString("delete_historical_description", bundle: Bundle.main, comment: ""))
				.regularStyle(foregroundColor: ColorConstants.Text.secondary)
		  }
		  
		  Spacer()
		  
		  VStack(spacing: 10) {
			 Button(action: {
				self.presentationMode.wrappedValue.dismiss()
			 }) {
				AccessibleText(content: NSLocalizedString("delete_historical_cancel_button_title", bundle: Bundle.main, comment: ""))
				    .regularBoldStyle(foregroundColor: ColorConstants.Background.buttonEnabled)
				    .underline()
			 }
			 
			 Button(action: {
				viewModel.deleteAllHistory()
			 }) {
				AccessibleText(content: NSLocalizedString("delete_historical_button_title", bundle: Bundle.main, comment: ""))
			 }
			 .buttonStyle(CustomButtonStyle(isEnabled: true))
		  }
	   }
	   .padding()
	   .background(Color.white)
	   .cornerRadius(10)
    }
}
