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
	   hostingController.view.frame = self.view.bounds
	   view.addSubview(hostingController.view)
	   hostingController.didMove(toParent: self)
    }
}
