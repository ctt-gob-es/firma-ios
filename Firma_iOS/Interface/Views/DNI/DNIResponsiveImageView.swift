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
    let landscapeMaxHeightRatio: CGFloat

    @Environment(\.verticalSizeClass) private var verticalSizeClass

    init(imageName: String, landscapeMaxHeightRatio: CGFloat = 0.3) {
        self.imageName = imageName
        self.landscapeMaxHeightRatio = landscapeMaxHeightRatio
    }

    var body: some View {
        let isLandscape = verticalSizeClass == .compact

        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(
                maxWidth: .infinity,
                maxHeight: isLandscape ? UIScreen.main.bounds.height * landscapeMaxHeightRatio : .none
            )
    }
}
