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
		  PrivacyPolicyHTMLWeb(htmlFileName: "privacy_policy")
			 
			 VStack(alignment: .leading, spacing: 10) {
				CheckBoxView(
				    isChecked: $isPrivacyPolicyAccepted,
				    title: NSLocalizedString("privacy_policy_checkbox_description", bundle: Bundle.main, comment: "")
				)
				CheckBoxView(
				    isChecked: $isTermsAccepted,
				    title: NSLocalizedString("privacy_tou_checkbox_description", bundle: Bundle.main, comment: "")
				)
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

