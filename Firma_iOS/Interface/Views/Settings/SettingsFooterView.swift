//
//  SettingsFooterView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct SettingsFooterView: View {
    @State private var availableWidth: CGFloat = 0
    
    var body: some View {
	   VStack(spacing: 20) {
		  HStack(spacing: 20) {
			 Image("img_logo_ES_Financiado_UE")
				.resizable()
				.scaledToFit()
				.accessibilityLabel(
				    Text(String(localized: "ES_Financiado_UE.image.label", table: "Accessibility", bundle: Bundle.main))
				)

			 Image("img_logo_PRTR")
				.resizable()
				.scaledToFit()
				.accessibilityLabel(
				    Text(String(localized: "PRTR.image.label", table: "Accessibility", bundle: Bundle.main))
				)
		  }

		  Image("img_logo_ED2026")
			 .resizable()
			 .scaledToFit()
			 .frame(width: max(0, (availableWidth - 40) / 2))
			 .accessibilityLabel(
				Text(String(localized: "ED2026.image.label", table: "Accessibility", bundle: Bundle.main))
			 )
	   }
	   .padding()
	   .frame(maxWidth: .infinity, alignment: .bottom)
	   .background(
		  GeometryReader { proxy in
			 Color.clear
				.onAppear { availableWidth = proxy.size.width }
				.onChange(of: proxy.size) { oldSize, newSize in
				    availableWidth = newSize.width
				}
		  }
	   )
    }
}
