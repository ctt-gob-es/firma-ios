//
//  TutorialView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 15/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct TutorialView: View {
    let imageName: String
    let title: String
    let description: String
    let buttonText: String
    let buttonAction: () -> Void
    let currentPage: Int
    let numberOfPages: Int

    var body: some View {
	   VStack {
		  VStack(alignment: .leading) {
			 AccessibleText(content: title)
				.titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
				.accessibilityAddTraits(.isHeader)
			 
			 AccessibleText(content: description)
				.regularStyle(foregroundColor: ColorConstants.Text.primary)
				.multilineTextAlignment(.leading)
		  }
		  .frame(maxWidth: .infinity, alignment: .leading)

		  Image(imageName)
			 .resizable()
			 .scaledToFit()

		  Spacer()

		  PageControl(numberOfPages: numberOfPages, currentPage: .constant(currentPage))
			 .padding(.vertical)
			 .accessibility(label: Text("\(currentPage + 1) of \(numberOfPages)"))

		  Button(action: buttonAction) {
			 AccessibleText(content: buttonText)
		  }
		  .buttonStyle(CustomButtonStyle(isEnabled: true))
		  .padding(.bottom, 20)
	   }
	   .padding()
	   .background(Color.white)
	   .accessibilityElement(children: .contain)
    }
}
