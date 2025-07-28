//
//  TimeoutSelectionRow.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 9/4/25.
//  Copyright © 2025 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

struct TimeoutSelectionView: View {
    var selectedTimeout: Int
    var onTap: () -> Void

    var body: some View {
	   Button(action: onTap) {
		  HStack {
			 AccessibleText(content: NSLocalizedString("timeout_selection_title", bundle: Bundle.main, comment: ""))
				.regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
			 Spacer()
			 ChipButton(label: "\(selectedTimeout) min") {
				onTap()
			 }
		  }
	   }
    }
}
