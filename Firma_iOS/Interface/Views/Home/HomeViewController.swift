//
//  HomeViewController.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

class HomeViewController: UIViewController {
    override func viewDidLoad() {
	   super.viewDidLoad()

	   let contentView = HomeView()
	   let hostingController = UIHostingController(rootView: contentView)

	   addChild(hostingController)
	   hostingController.view.frame = self.view.bounds
	   view.addSubview(hostingController.view)
	   hostingController.didMove(toParent: self)
    }
}
