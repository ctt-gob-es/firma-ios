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
				.accessibilityElement(children: .ignore)
				.accessibilityLabel(
				    Text(NSLocalizedString("ES_Financiado_UE.image.label", tableName: "Accessibility", bundle: Bundle.main, comment: ""))
				)
				.accessibilityAddTraits(.isStaticText)

			 Image("img_logo_PRTR")
				.resizable()
				.scaledToFit()
				.accessibilityElement(children: .ignore)
				.accessibilityLabel(
				    Text(NSLocalizedString("PRTR.image.label", tableName: "Accessibility", bundle: Bundle.main, comment: ""))
				)
				.accessibilityAddTraits(.isStaticText)
		  }

		  Image("img_logo_ED2026")
			 .resizable()
			 .scaledToFit()
			 .frame(width: max(0, (availableWidth - 40) / 2))
			 .accessibilityElement(children: .ignore)
			 .accessibilityLabel(
				Text(NSLocalizedString("ED2026.image.label", tableName: "Accessibility", bundle: Bundle.main, comment: ""))
			 )
			 .accessibilityAddTraits(.isStaticText)
	   }
	   .padding()
	   .frame(maxWidth: .infinity, alignment: .bottom)
	   .background(
		  GeometryReader { proxy in
			 Color.clear
				.onAppear { availableWidth = proxy.size.width }
				.onChange(of: proxy.size) { newSize in
				    availableWidth = newSize.width
				}
		  }
	   )
    }
}
