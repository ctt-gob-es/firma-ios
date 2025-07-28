//
//  TutorialViewModel.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 5/8/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class TutorialViewModel: ObservableObject {
    let imageName: String
    let title: String
    let description: String
    let buttonText: String
    let buttonAction: () -> Void
    @Published var currentPage: Int
    let numberOfPages: Int

    init(imageName: String, title: String, description: String, buttonText: String, buttonAction: @escaping () -> Void, currentPage: Int, numberOfPages: Int) {
	   self.imageName = imageName
	   self.title = title
	   self.description = description
	   self.buttonText = buttonText
	   self.buttonAction = buttonAction
	   self.currentPage = currentPage
	   self.numberOfPages = numberOfPages
    }
}
