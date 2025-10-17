//
//  MainViewController.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
	   NavigationView {
		  ZStack {
			 ColorConstants.Background.main.ignoresSafeArea(.all)
			 
			 VStack(spacing: 20) {
				Spacer()
				
				Image("onboarding")
				    .resizable()
				    .scaledToFit()
				    .frame(height: 200)
				    .accessibilityHidden(true)
				
				AccessibleText(content: NSLocalizedString("onboarding_title", bundle: .main, comment: ""))
				    .titleStyleBlack(
					   foregroundColor: ColorConstants.Text.primary,
					   alignment: .center
				    )
				    .accessibilityAddTraits(.isHeader)
				
				AccessibleText(content: NSLocalizedString("onboarding_message", bundle: .main, comment: ""))
				    .regularStyle(
					   foregroundColor: ColorConstants.Text.onboarding,
					   alignment: .center
				    )
				    .multilineTextAlignment(.center)
				
				Spacer()
				
				NavigationLink(destination: IntroPolicyView()) {
				    AccessibleText(content: NSLocalizedString("onboarding_button_title", bundle: .main, comment: ""))
				}
				.buttonStyle(CustomButtonStyle(isEnabled: true))
				.padding(.bottom)
			 }
			 .padding()
		  }
		  .navigationBarHidden(true)
	   }
	   .navigationViewStyle(StackNavigationViewStyle())
    }
}
