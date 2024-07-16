//
//  DocumentErrorModalView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 16/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct DocumentErrorModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
	   NavigationView {
		  VStack(spacing: 10) {
			 Spacer()
			 
			 Group {
				Image("info_hectagon")
				    .resizable()
				    .frame(width: 72, height: 72)
				    .scaledToFit()
				    .padding(.vertical, 16)
				
				AccessibleText(content: NSLocalizedString("document_error_title", bundle: Bundle.main, comment: ""))
				    .titleStyleBlack(
					   foregroundColor: ColorConstants.Text.primary,
					   alignment: .center
				    )
				
				AccessibleText(content: NSLocalizedString("document_error_description", bundle: Bundle.main, comment: ""))
				    .regularStyle(
					   foregroundColor: ColorConstants.Text.secondary,
					   alignment: .center
				    )
				
				Button(action: {
				    self.presentationMode.wrappedValue.dismiss()
				}) {
				    AccessibleText(content: NSLocalizedString("go_home_button_title", bundle: Bundle.main, comment: ""))
					   .boldStyleSmall(foregroundColor: ColorConstants.Background.buttonEnabled)
					   .underline()
				}
				.padding(.top, 32)
			 }
			 
			 Spacer()
			 
			 Button(action: {
				// Retry action
			 }) {
				AccessibleText(content: NSLocalizedString("retry_button_title", bundle: Bundle.main, comment: ""))
			 }
			 .buttonStyle(CustomButtonStyle(isEnabled: true))
		  }
		  .padding()
		  .navigationTitle(NSLocalizedString("document_error_controller_title", bundle: Bundle.main, comment: ""))
		  .navigationBarTitleDisplayMode(.inline)
		  .navigationBarColor(UIColor(ColorConstants.Background.main), titleColor: .black)
	   }
    }
}
