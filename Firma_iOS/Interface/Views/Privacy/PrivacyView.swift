//
//  PrivacyView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
import Foundation
import SwiftUI

struct PrivacyView: View {
    @State private var isPrivacyPolicyAccepted: Bool = false
    @State private var isTermsAccepted: Bool = false
    
    var body: some View {
	   VStack(alignment: .leading, spacing: 20) {
		  Text("privacy_title")
			 .titleStyle(foregroundColor: ColorConstants.Text.primary)
			 .accessibility(label: Text("privacy_title"))
			 .accessibility(addTraits: .isHeader)
		  
		  Text("privacy_subtitle")
			 .subtitleStyle(foregroundColor: ColorConstants.Text.primary)
			 .accessibility(label: Text("privacy_subtitle"))
		  
		  ScrollView {
			 VStack(alignment: .leading, spacing: 10) {
				Text("""
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    """)
				.regularStyle(foregroundColor: ColorConstants.Text.primary)
				
				CheckBoxView(
				    isChecked: $isPrivacyPolicyAccepted,
				    title: "privacy_policy_checkbox_description"
				)
				.accessibility(label: Text("Casilla de verificación"))
				.accessibility(hint: Text("Marcar si está de acuerdo con la Política de Privacidad"))
				
				CheckBoxView(
				    isChecked: $isTermsAccepted,
				    title: "privacy_tou_checkbox_description"
				)
				.accessibility(label: Text("Casilla de verificación"))
				.accessibility(hint: Text("Marcar si está de acuerdo con el Aviso Legal y los Términos y Condiciones de Uso"))
			 }
		  }
		  
		  Spacer()
		  
		  NavigationLink(destination: HomeView()) {
			 Text("privacy_button_title")
		  }
		  .buttonStyle(CustomButtonStyle(isEnabled: (isPrivacyPolicyAccepted && isTermsAccepted)))
		  .disabled(!(isPrivacyPolicyAccepted && isTermsAccepted))
	   }
	   .navigationBarBackButtonHidden(true)
	   .navigationBarTitle("privacy_controller_title", displayMode: .inline)
	   .navigationBarColor(UIColor(ColorConstants.Background.main), titleColor: .black)
	   .padding()
	   .onDisappear {
		  UserDefaults.standard.setValue(true, forKey: "user_privacy_accepted")
	   }
    }
}

