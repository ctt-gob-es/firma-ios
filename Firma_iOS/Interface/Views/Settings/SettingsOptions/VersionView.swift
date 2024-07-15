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
		  AttributedTextView(text: NSLocalizedString("version_text",bundle: Bundle.main ,comment: ""))
			 .padding()
	   }
	   .navigationBarTitle(NSLocalizedString("version_title",bundle: Bundle.main ,comment: ""), displayMode: .inline)
    }
}



