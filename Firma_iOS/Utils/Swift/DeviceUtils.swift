//
//  DeviceUtils.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 16/10/25.
//  Copyright © 2025 Solid GEAR. All rights reserved.
//


import SwiftUI

enum DeviceUtils {
    static func shouldShowTutorialImage(horizontalSizeClass: UserInterfaceSizeClass?, verticalSizeClass: UserInterfaceSizeClass?) -> Bool {
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            return true
        case .phone:
            return verticalSizeClass == .regular && horizontalSizeClass == .compact
        default:
            return true
        }
    }
}
