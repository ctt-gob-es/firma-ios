//
//  NoCertificatesView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct NoCertificatesView: View {
    var body: some View {
	   VStack(spacing: 10) {
		  Image(systemName: "info.circle")
			 .resizable()
			 .scaledToFit()
			 .frame(height: 50) // Ajusta el tamaño de la imagen
			 .foregroundColor(ColorConstants.Background.buttonEnabled)
			 .background(
				Circle()
				    .fill(ColorConstants.Background.main)
				    .frame(width: 70, height: 70) // Ajusta el tamaño del fondo circular
			 )
			 .padding(.vertical, 16)
		  
		  Text("home_certificates_not_available_title")
			 .titleStyle(
				foregroundColor: ColorConstants.Text.primary,
				alignment: .center
			 )
		  
		  Text("home_certificates_not_available_description")
			 .regularStyle(
				foregroundColor: ColorConstants.Text.secondary,
				alignment: .center
			 )
	   }
	   .padding()
    }
}
