//
//  MainViewModel.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 2/8/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

@objc class MainViewModel: NSObject, ObservableObject {
    @Published var sheetHeight: CGFloat = .zero
    @Published var navigationTitle = "Autofirma"
    @objc @Published var viewMode: ViewModes = .home
    @objc @Published var urlReceived: URL?
    @Published var shouldSign: Bool = false
    
    
    @Published var isNavigationDisabled: Bool = false
    @Published var shouldCancel: Bool = false
    
    var appStatus: AppStatus

    init(viewMode: ViewModes, urlReceived: URL?, appStatus: AppStatus) {
        self.viewMode = viewMode
        self.urlReceived = urlReceived
        self.appStatus = appStatus
    }
    
    /*func reset() {
        self.appStatus.certificates = []
	   self.sheetHeight = .zero
	   self.navigationTitle = ""
	   self.certificateURL = nil
	   self.viewMode = .home
	   self.urlReceived = nil
	   self.shouldSign = false
	   self.shouldReload = false
    }*/
    
    func cancelSign() {
        DispatchQueue.main.async {
           NotificationCenter.default.post(name: .ErrorModalCancelButtonAction, object: nil, userInfo: nil)
        }
    }
}

@objc enum ViewModes: Int {
    case home
    case sign
}
