//
//  NavigationBarButtonLink.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct NavigationBarButtonLink<Destination: View>: View {
    let destination: Destination
    let accesibilityLabel: String
    let imageName: String
    
    var body: some View {
	   NavigationLink(destination: destination) {
		  Image(imageName)
			 .resizable()
			 .scaledToFit()
			 .frame(height: 40)
			 .padding(.vertical,8)
                .accessibilityLabel(accesibilityLabel)
	   }
    }
}
