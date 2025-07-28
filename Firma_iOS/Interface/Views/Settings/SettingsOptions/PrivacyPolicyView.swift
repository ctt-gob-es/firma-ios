//
//  PrivacyPolicyView.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 25/3/25.
//  Copyright © 2025 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

struct PrivacyPolicyView: View {
    @State var selectedLanguage: LocalizedLanguage
    
    var body: some View {
	   VStack(alignment: .leading) {
		  VStack(alignment: .leading, spacing: 20) {
			 HTMLWeb(
				htmlFileName: "privacy_policy",
				languageCode: selectedLanguage.code
			 )
			 .padding()
			 .border(Color.gray)
		  }
	   }
	   .navigationBarTitle(NSLocalizedString("settings_privacy_policy_row", bundle: Bundle.main, comment: ""), displayMode: .inline)
	   .padding()
    }
}
