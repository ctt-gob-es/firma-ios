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

    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    init(imageName: String, landscapeMaxHeightRatio: CGFloat = 0.3) {
        self.imageName = imageName
        self.landscapeMaxHeightRatio = landscapeMaxHeightRatio
    }

    var body: some View {
        let isLandscape = horizontalSizeClass == .regular

        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(
                maxWidth: .infinity,
                maxHeight: isLandscape ? UIScreen.main.bounds.height * landscapeMaxHeightRatio : .none
            )
    }
}
