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
			 Text(title)
				.titleStyleBlack(foregroundColor: .black)
			 
			 Text(description)
				.regularStyle(foregroundColor: .black)
				.multilineTextAlignment(.leading)
		  }
		  .frame(maxWidth: .infinity, alignment: .leading)

		  Image(imageName)
			 .resizable()
			 .scaledToFit()

		  Spacer()

		  PageControl(numberOfPages: numberOfPages, currentPage: .constant(currentPage))
			 .padding(.vertical)

		  Button(action: buttonAction) {
			 Text(buttonText)
		  }
		  .buttonStyle(CustomButtonStyle(isEnabled: true))
		  .padding(.bottom, 20)
	   }
	   .padding()
	   .background(Color.white)
    }
}
