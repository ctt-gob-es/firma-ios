//
//  SignModalView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 15/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct SignModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
	   GeometryReader { geometry in
		  VStack(spacing: 20) {
			 HStack {
				Text(NSLocalizedString("sign_file_title", bundle: Bundle.main, comment: "¿Con qué firmarás el fichero?"))
				    .mediumBoldStyle(foregroundColor: ColorConstants.Text.primary)
				Spacer()
				Button(action: {
				    self.presentationMode.wrappedValue.dismiss()
				}) {
				    Image(systemName: "xmark")
					   .foregroundColor(.gray)
					   .padding()
					   .background(Color(UIColor.systemGray5))
					   .clipShape(Circle())
				}
			 }
			 .padding(.trailing)
			 
			 VStack(alignment: .leading, spacing: 20) {
				HStack {
				    Image("documents")
					   .foregroundColor(ColorConstants.Background.buttonEnabled)
				    Text(NSLocalizedString("sign_with_certificate", bundle: Bundle.main, comment: "Certificado electrónico"))
					   .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
				}
				.frame(maxWidth: .infinity, alignment: .leading)
				
				HStack {
				    Image("credit-card")
					   .foregroundColor(ColorConstants.Background.buttonEnabled)
				    Text(NSLocalizedString("sign_with_dni", bundle: Bundle.main, comment: "DNI electrónico"))
					   .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
				}
				.frame(maxWidth: .infinity, alignment: .leading)
			 }
			 
			 Spacer()
		  }
		  .padding()
		  .background(Color.white)
		  .cornerRadius(10)
	   }
    }
}
