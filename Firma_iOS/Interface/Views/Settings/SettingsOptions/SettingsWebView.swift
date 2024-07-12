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

struct WebView: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
	   WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
	   if let url = URL(string: urlString) {
		  let request = URLRequest(url: url)
		  uiView.load(request)
	   }
    }
}
