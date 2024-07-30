//
//  NoCertificatesView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct NoDataView: View {
    let title: String
    let description: String

    var body: some View {
	   VStack(spacing: 10) {
		  Image("info_red")
			 .resizable()
			 .scaledToFit()
			 .frame(width: 72, height: 72)
			 .padding(.vertical, 16)
		  
		  AccessibleText(content: title)
			 .titleStyleBlack(
				foregroundColor: ColorConstants.Text.primary,
				alignment: .center
			 )
		  
		  AccessibleText(content: description)
			 .regularStyle(
				foregroundColor: ColorConstants.Text.secondary,
				alignment: .center
			 )
	   }
    }
}
