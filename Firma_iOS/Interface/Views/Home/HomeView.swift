//
//  HomeView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
	   NavigationView {
		  VStack {
			 VStack(alignment: .center, spacing: 20) {
				VStack(alignment: .leading){
				    Text("home_certificates_label")
					   .titleStyle(
						  foregroundColor: ColorConstants.Text.primary
					   )
				    
				    Text("home_certificates_description")
					   .regularStyle(
						  foregroundColor: ColorConstants.Text.secondary
					   )
				}
				
				Spacer()
				
				NoCertificatesView()
				
				Spacer()
				
				VStack(spacing: 10) {
				    Button(action: {
					   // Acción para Firmar fichero
				    }) {
					   Text("home_certificates_sign_button_title")
				    }
				    .buttonStyle(CustomButtonStyle(isEnabled: true))
				    
				    Button(action: {
					   // Acción para Añadir nuevo certificado
				    }) {
					   Text("home_certificates_add_certificate_button_title")
				    }
				    .buttonStyle(BorderedButtonStyle())
				}
			 }
			 .padding()
			 .navigationBarTitle("", displayMode: .inline)
			 .navigationBarItems(leading:
								Image("Logo-autofirma_vector")
				.resizable()
				.renderingMode(.template)
				.scaledToFit()
				.frame(height: 40)
				.foregroundColor(Color(hex: "#C33400")),
							 trailing:
								HStack(spacing: 10) {
				NavigationBarButton(imageName: "info.circle", action: {
				    // Acción para información
				})
				
				NavigationBarButtonLink(
				    destination: SettingsView(),
				    imageName: "gearshape"
				)
			 })
		  }
	   }
	   .navigationBarBackButtonHidden(true)
	   .navigationBarColor(UIColor(ColorConstants.Background.main), titleColor: .black)
    }
}
