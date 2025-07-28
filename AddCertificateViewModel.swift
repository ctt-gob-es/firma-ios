//
//  AddCertificateModel.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 5/8/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class AddCertificateViewModel: ObservableObject {
    @Published var certificateURL: URL?
    @Published var password: String = ""
    @Published var showFieldError: Bool = false
    @Published var buttonEnabled: Bool = false
    
    init(certificateURL: URL? = nil, password: String = "", showFieldError: Bool = false, buttonEnabled: Bool = false) {
	   self.certificateURL = certificateURL
	   self.password = password
	   self.showFieldError = showFieldError
	   self.buttonEnabled = buttonEnabled
    }

    func validatePassword() {
	   buttonEnabled = !password.isEmpty
	   showFieldError = false
    }
}
