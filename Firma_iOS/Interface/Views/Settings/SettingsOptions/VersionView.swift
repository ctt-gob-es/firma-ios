//
//  VersionView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 12/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct VersionView: View {
    var body: some View {
	   VStack {
            AttributedTextView(text: String(format: NSLocalizedString("version_text", bundle: Bundle.main, comment: ""), Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""))
			 .padding()
	   }
	   .navigationBarTitle(String(format: NSLocalizedString("version_title", bundle: Bundle.main, comment: ""), Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""), displayMode: .inline)
    }
}
