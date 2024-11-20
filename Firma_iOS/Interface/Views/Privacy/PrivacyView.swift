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
		  AccessibleText(content: NSLocalizedString("privacy_title", bundle: Bundle.main, comment: ""))
			 .titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
		  
		  AccessibleText(content: NSLocalizedString("privacy_subtitle", bundle: Bundle.main, comment: ""))
			 .subtitleStyle(foregroundColor: ColorConstants.Text.primary)
		  
		  ScrollView {
			 VStack(alignment: .leading, spacing: 10) {
				AccessibleText(content: """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    """)
				.regularStyle(foregroundColor: ColorConstants.Text.primary)
				
				CheckBoxView(
				    isChecked: $isPrivacyPolicyAccepted,
				    title: NSLocalizedString("privacy_policy_checkbox_description", bundle: Bundle.main, comment: "")
				)
				
				CheckBoxView(
				    isChecked: $isTermsAccepted,
				    title: NSLocalizedString("privacy_tou_checkbox_description", bundle: Bundle.main, comment: "")
				)
			 }
		  }
		  
		  Spacer()
		  
            NavigationLink(destination: ParentView(viewMode: ViewModes.home, urlReceived: nil)) {
			 AccessibleText(content: NSLocalizedString("accept_button_title", bundle: Bundle.main, comment: ""))
		  }
		  .buttonStyle(CustomButtonStyle(isEnabled: (isPrivacyPolicyAccepted && isTermsAccepted)))
		  .disabled(!(isPrivacyPolicyAccepted && isTermsAccepted))
	   }
	   .navigationBarBackButtonHidden(true)
	   .navigationBarTitle(NSLocalizedString("privacy_controller_title", bundle: Bundle.main, comment: ""), displayMode: .inline)
	   .padding()
	   .onDisappear {
		  UserDefaults.standard.setValue(true, forKey: "user_privacy_accepted")
	   }
    }
}

