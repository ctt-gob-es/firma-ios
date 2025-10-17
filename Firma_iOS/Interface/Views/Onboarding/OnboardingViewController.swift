//
//  OnboardingViewController.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI
import UIKit

class OnboardingViewController: UIViewController {
    override func viewDidLoad() {
	   super.viewDidLoad()

	   let contentView = OnboardingView()
	   let hostingController = UIHostingController(rootView: contentView)

	   addChild(hostingController)
	   
	   view.addSubview(hostingController.view)
	   
	   hostingController.view.translatesAutoresizingMaskIntoConstraints = false
	   
	   NSLayoutConstraint.activate([
		  hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
		  hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
		  hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		  hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
	   ])
	   
	   hostingController.didMove(toParent: self)
    }
}
