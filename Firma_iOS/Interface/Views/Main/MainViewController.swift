//
//  MainViewController.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

@objc class MainViewController: UIViewController {
    var viewMode: ViewModes?
    var urlReceived: URL?
    
    @objc init(urlReceived: URL?) {
        if let urlReceived = urlReceived {
            self.viewMode = ViewModes.sign
            self.urlReceived = urlReceived
        } else {
            self.viewMode = ViewModes.home
        }
        
	   super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
	   fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
	   super.viewDidLoad()
	   
	   let contentView = ParentView(viewMode: viewMode, urlReceived: urlReceived)
		  .environmentObject(AppStatus.shared)
	   
	   let hostingController = UIHostingController(rootView: contentView)
	   hostingController.modalPresentationStyle = .fullScreen
	   self.navigationController?.modalPresentationStyle = .fullScreen
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
