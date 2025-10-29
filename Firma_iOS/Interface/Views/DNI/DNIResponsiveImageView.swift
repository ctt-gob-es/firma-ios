//
//  ResponsiveImageView.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 1/10/25.
//  Copyright © 2025 Solid GEAR. All rights reserved.
//

import SwiftUI

struct DNIResponsiveImageView: View {
    let imageName: String
    let imageNameLandscape: String?
    let landscapeMaxHeightRatio: CGFloat
    
    @Environment(\.verticalSizeClass) private var verticalSizeClass

    init(imageName: String, imageNameLandscape: String? = nil, landscapeMaxHeightRatio: CGFloat = 0.3) {
	   self.imageName = imageName
	   self.imageNameLandscape = imageNameLandscape
	   self.landscapeMaxHeightRatio = landscapeMaxHeightRatio
    }

    private var currentImageName: String? {
	   if let landscape = imageNameLandscape,
		 verticalSizeClass == .compact {
		  return landscape
	   } else if verticalSizeClass != .compact {
		  return imageName
	   } else {
		  return nil
	   }
    }

    var body: some View {
	   let isLandscape = verticalSizeClass == .compact

	   Group {
		  if let currentImageName {
			 Image(currentImageName)
				.resizable()
				.scaledToFit()
				.frame(
				    maxWidth: .infinity,
				    maxHeight: isLandscape ? UIScreen.main.bounds.height * landscapeMaxHeightRatio : .none
				)

		  }
	   }
    }
}
