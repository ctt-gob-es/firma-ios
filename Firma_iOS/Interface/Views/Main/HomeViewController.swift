//
//  HomeViewController.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

@objc class HomeViewController: UIViewController {
    var mode: ViewModes
    var urlReceived: URL?
    
    @objc init(mode: ViewModes, urlReceived: URL? = nil) {
	   self.mode = mode
	   self.urlReceived = urlReceived
	   super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
	   fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
	   super.viewDidLoad()
	   
	   let contentView = MainView(viewMode: mode, urlReceived: urlReceived)
	   contentView.viewMode = mode
	   
	   
	   let hostingController = UIHostingController(rootView: contentView)
	   
	   addChild(hostingController)
	   hostingController.view.frame = self.view.bounds
	   view.addSubview(hostingController.view)
	   hostingController.didMove(toParent: self)
    }
    
    @objc public func updateMode(mode: ViewModes) {
	   self.mode = mode
    }
}
