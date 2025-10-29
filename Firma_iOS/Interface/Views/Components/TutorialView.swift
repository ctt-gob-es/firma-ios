//
//  TutorialView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 15/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct TutorialStepOneView: View {
    @Environment(\.horizontalSizeClass) private var hSize
    @Environment(\.verticalSizeClass) private var vSize
    @EnvironmentObject var appStatus: AppStatus

    var body: some View {
	   VStack(alignment: .center, spacing: 20) {
		  ScrollView {
			 AccessibleText(content: NSLocalizedString("install_certificate_title_one", bundle: .main, comment: ""))
				.titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
				.accessibilityAddTraits(.isHeader)
				.frame(maxWidth: .infinity, alignment: .leading)
			 
			 AccessibleText(content: NSLocalizedString("install_certificate_description_one", bundle: .main, comment: ""))
				.regularStyle(foregroundColor: ColorConstants.Text.primary)
				.frame(maxWidth: .infinity, alignment: .leading)
			 
			 Spacer()
			 
			 if DeviceUtils.shouldShowTutorialImage(horizontalSizeClass: hSize, verticalSizeClass: vSize) {
				Image("install_certificate_1")
				    .resizable()
				    .scaledToFit()
				    .accessibilityHidden(true)
				
				Spacer()
			 }
		  }
		  
		  TutorialPageIndicator(numberOfPages: 2, currentPage: 0)


		  NavigationLink(destination: TutorialStepTwoView().environmentObject(appStatus)) {
			 AccessibleText(content: NSLocalizedString("install_certificate_button_one_title", bundle: .main, comment: ""))
		  }
		  .buttonStyle(CustomButtonStyle(isEnabled: true))
		  .padding(.bottom, 20)
	   }
	   .padding()
	   .background(Color.white)
	   .accessibilityElement(children: .contain)
    }
}

struct TutorialStepTwoView: View {
    @Environment(\.horizontalSizeClass) private var hSize
    @Environment(\.verticalSizeClass) private var vSize
    @EnvironmentObject var appStatus: AppStatus

    var body: some View {
	   VStack(alignment: .center, spacing: 20) {
		  ScrollView {
			 AccessibleText(content: NSLocalizedString("install_certificate_title_two", bundle: .main, comment: ""))
				.titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
				.accessibilityAddTraits(.isHeader)
				.frame(maxWidth: .infinity, alignment: .leading)
			 
			 AccessibleText(content: NSLocalizedString("install_certificate_description_two", bundle: .main, comment: ""))
				.regularStyle(foregroundColor: ColorConstants.Text.primary)
				.frame(maxWidth: .infinity, alignment: .leading)
			 
			 Spacer()
			 
			 if DeviceUtils.shouldShowTutorialImage(horizontalSizeClass: hSize, verticalSizeClass: vSize) {
				Image("install_certificate_2")
				    .resizable()
				    .scaledToFit()
				    .accessibilityHidden(true)
				Spacer()
			 }
		  }
		  TutorialPageIndicator(numberOfPages: 2, currentPage: 1)

		  Button {
			 appStatus.showDocumentPicker.toggle()
		  } label: {
			 AccessibleText(content: NSLocalizedString("install_certificate_button_two_title", bundle: .main, comment: ""))
		  }
		  .buttonStyle(CustomButtonStyle(isEnabled: true))
		  .padding(.bottom, 20)
	   }
	   .padding()
	   .background(Color.white)
	   .accessibilityElement(children: .contain)
	   .navigationTitle(NSLocalizedString("install_certificate_title", bundle: Bundle.main, comment: ""))
    }
}

struct TutorialPageIndicator: View {
    let numberOfPages: Int
    let currentPage: Int
    
    var body: some View {
	   HStack(spacing: 8) {
		  ForEach(0..<numberOfPages, id: \.self) { index in
			 Circle()
				.fill(index == currentPage ? ColorConstants.Text.accent : Color.gray.opacity(0.3))
				.frame(width: 8, height: 8)
		  }
	   }
	   .frame(maxWidth: .infinity)
	   .padding(.vertical, 8)
	   .accessibilityHidden(true)
    }
}
