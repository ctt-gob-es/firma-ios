//
//  ChipButton.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 9/4/25.
//  Copyright © 2025 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

struct ChipButton: View {
    var label: String
    var onTap: () -> Void

    var body: some View {
	   Button(action: onTap) {
		  HStack(spacing: 4) {
			 Image(systemName: "chevron.down")
				.font(.system(size: 12, weight: .medium))
			 AccessibleText(content: label)
		  }
		  .padding(.horizontal, 10)
		  .padding(.vertical, 6)
		  .foregroundColor(Color(UIColor.systemGray))
		  .overlay(
			 RoundedRectangle(cornerRadius: 10)
				.stroke(ColorConstants.Border.borderColor, lineWidth: 2)
		  )
	   }
	   .buttonStyle(PlainButtonStyle())
    }
}
