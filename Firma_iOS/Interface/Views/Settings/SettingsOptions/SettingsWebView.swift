//
//  SettingsWebView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 12/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

enum SettingsWebKeys {
    case legal_advise
    case privacy_policy
    case accesibility
}

struct WebView: UIViewRepresentable {
    let settingKey: SettingsWebKeys
    
    func makeUIView(context: Context) -> WKWebView {
	   WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        var stringUrl: String =
        switch settingKey {
        case .legal_advise:
            NSLocalizedString("url_aviso_legal", bundle: Bundle.main, comment: "")
        case .privacy_policy:
            NSLocalizedString("url_privacy_policy", bundle: Bundle.main, comment: "")
        case .accesibility:
            NSLocalizedString("url_accessibility_statement", bundle: Bundle.main, comment: "")
        }
        
	   if let url = URL(string: stringUrl) {
		  let request = URLRequest(url: url)
		  uiView.load(request)
	   }
    }
}
