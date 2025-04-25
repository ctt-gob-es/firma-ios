//
//  NavigationBarButton.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
import SwiftUI

struct NavigationBarButton: View {
    let imageName: String
    let accesibilityLabel: String
    var isNativeIcon: Bool = false
    let action: () -> Void
    
    var body: some View {
	   Button(action: action) {
		  if isNativeIcon {
			 Image(systemName: imageName)
				.resizable()
				.scaledToFit()
				.frame(height: 30)
				.padding(.vertical,6)
				.foregroundColor(ColorConstants.Text.secondary)
                    .accessibilityLabel(accesibilityLabel)
		  } else {
			 Image(imageName)
				.resizable()
				.scaledToFit()
				.frame(height: 40)
				.padding(.vertical,6)
                    .accessibilityLabel(accesibilityLabel)
		  }
	   }
    }
}
