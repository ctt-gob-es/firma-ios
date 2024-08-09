//
//  MainViewModel.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 2/8/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

@objc class MainViewModel: NSObject, ObservableObject {
    @Published var certificates: [AOCertificateInfo]?
    @Published var sheetHeight: CGFloat = .zero
    @Published var navigationTitle = "Autofirma"
    @Published var certificateURL: URL?
    @objc @Published var viewMode: ViewModes = .home
    @objc @Published var urlReceived: URL?
    @Published var shouldSign: Bool = false
    @Published var shouldReload: Bool = false
    
    func updateCertificates(_ newCertificates: [AOCertificateInfo]) {
	   self.certificates = newCertificates
    }
    
    func reset() {
	   self.certificates = nil
	   self.sheetHeight = .zero
	   self.navigationTitle = ""
	   self.certificateURL = nil
	   self.viewMode = .home
	   self.urlReceived = nil
	   self.shouldSign = false
	   self.shouldReload = false
    }
    
    
    func getCertificates() -> [AOCertificateInfo] {
	   if let certificates = OpenSSLCertificateHelper.getAddedCertificatesInfo() as? [AOCertificateInfo] {
		  return certificates
	   } else {
		  return []
	   }
    }
}

@objc enum ViewModes: Int {
    case home
    case sign
}
