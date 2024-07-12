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
    let imageName: String
    
    var body: some View {
	   NavigationLink(destination: destination) {
		  Image(systemName: imageName)
			 .resizable()
			 .scaledToFit()
			 .frame(height: 24)
			 .padding(8)
			 .background(Color(hex: "#E0E6EB"))
			 .clipShape(Circle())
			 .foregroundColor(ColorConstants.Text.primary)
	   }
    }
}
