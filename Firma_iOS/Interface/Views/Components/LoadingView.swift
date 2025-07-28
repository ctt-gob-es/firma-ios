//
//  LoadingView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 18/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    var body: some View {
	   ZStack {
		  Spacer()
		  ProgressView()
			 .progressViewStyle(CircularProgressViewStyle(tint: ColorConstants.Text.primary))
			 .scaleEffect(1.5)
		  Spacer()
	   }
	   .edgesIgnoringSafeArea(.all)
    }
}
