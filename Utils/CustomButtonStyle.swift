//
//  ButtonStyles.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
	   configuration.label
		  .font(.custom("NunitoSans10pt-Bold", size: 20))
		  .foregroundColor(isEnabled ? .white : ColorConstants.Text.buttonDisabled)
		  .frame(maxWidth: .infinity)
		  .padding()
		  .background(isEnabled ? ColorConstants.Background.buttonEnabled : ColorConstants.Background.buttonDisabled)
		  .cornerRadius(10)
		  .padding(.horizontal)
		  .scaleEffect(configuration.isPressed && isEnabled ? 0.95 : 1.0)
		  .opacity(configuration.isPressed && isEnabled ? 0.8 : 1.0)
    }
}

struct BorderedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
	   configuration.label
		  .font(.custom("NunitoSans10pt-Bold", size: 20))
		  .foregroundColor(ColorConstants.Background.buttonEnabled)
		  .frame(maxWidth: .infinity)
		  .padding()
		  .background(Color.white)
		  .overlay(
			 RoundedRectangle(cornerRadius: 10)
				.stroke(ColorConstants.Background.buttonEnabled, lineWidth: 1)
		  )
		  .cornerRadius(10)
		  .padding(.horizontal)
		  .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
		  .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}
