//
//  TutorialView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 15/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct TutorialView: View {
    @StateObject var viewModel: TutorialViewModel
    @Binding var currentPage: Int
    
    var body: some View {
	   VStack {
		  VStack(alignment: .leading) {
			 AccessibleText(content: viewModel.title)
				.titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
				.accessibilityAddTraits(.isHeader)
			 
			 AccessibleText(content: viewModel.description)
				.regularStyle(foregroundColor: ColorConstants.Text.primary)
				.multilineTextAlignment(.leading)
		  }
		  .frame(maxWidth: .infinity, alignment: .leading)

		  Image(viewModel.imageName)
			 .resizable()
			 .scaledToFit()

		  Spacer()

		  PageControl(numberOfPages: viewModel.numberOfPages, currentPage: $currentPage)
			 .padding(.vertical)
			 .accessibility(label: Text("\(viewModel.currentPage + 1) of \(viewModel.numberOfPages)"))

		  Button(action: viewModel.buttonAction) {
			 AccessibleText(content: viewModel.buttonText)
		  }
		  .buttonStyle(CustomButtonStyle(isEnabled: true))
		  .padding(.bottom, 20)
	   }
	   .padding()
	   .background(Color.white)
	   .accessibilityElement(children: .contain)
    }
}
