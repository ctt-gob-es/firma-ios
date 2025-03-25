//
//  LegalNoticeView.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 25/3/25.
//  Copyright © 2025 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

struct LegalAdviceView: View {
    @State var selectedLanguage: LocalizedLanguage
    
    var body: some View {
	   VStack(alignment: .leading) {
		  VStack(alignment: .leading, spacing: 20) {
			 HTMLWeb(
				htmlFileName: "legal_advice",
				languageCode: selectedLanguage.code
			 )
			 .padding()
			 .border(Color.gray)
		  }
	   }
	   .navigationBarTitle(NSLocalizedString("settings_legal_advice_row", bundle: Bundle.main, comment: ""), displayMode: .inline)
	   .padding()
    }
}
