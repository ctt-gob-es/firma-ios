//
//  SettingsHeader.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 30/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

struct SettingsHeaderView: View {
    let title: String
    
    var body: some View {
	   AccessibleText(content: title)
		  .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
    }
}
