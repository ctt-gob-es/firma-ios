//
//  PrivacyPolicyHTMLWeb.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 20/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct PrivacyPolicyHTMLWeb: UIViewRepresentable {
    let htmlFileName: String

    func makeUIView(context: Context) -> WKWebView {
	   let webView = WKWebView()
	   webView.navigationDelegate = context.coordinator

	   webView.scrollView.isScrollEnabled = true
	   webView.scrollView.alwaysBounceHorizontal = false
	   webView.scrollView.showsHorizontalScrollIndicator = false

	   let savedLanguageCode = UserDefaults.standard.string(forKey: "appLanguage") ?? Locale.current.language.languageCode?.identifier ?? "es"
	   let localizedHtmlFileName = "\(htmlFileName)_\(savedLanguageCode)"
	   
	   if let filePath = Bundle.main.path(forResource: localizedHtmlFileName, ofType: "html") {
		  let fileURL = URL(fileURLWithPath: filePath)
		  webView.loadFileURL(fileURL, allowingReadAccessTo: fileURL.deletingLastPathComponent())
	   } else if let defaultFilePath = Bundle.main.path(forResource: "\(htmlFileName)_es", ofType: "html") {
		  // Si no existe cargamos por defecto la página en Castellano
		  let fileURL = URL(fileURLWithPath: defaultFilePath)
		  webView.loadFileURL(fileURL, allowingReadAccessTo: fileURL.deletingLastPathComponent())
	   } else {
		  print("Error: Both localized and default HTML files not found.")
	   }

	   let cssScript = """
	   var meta = document.createElement('meta');
	   meta.name = 'viewport';
	   meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';
	   document.head.appendChild(meta);

	   var style = document.createElement('style');
	   style.innerHTML = 'body { margin: 0; padding: 0; overflow-x: hidden; }';
	   document.head.appendChild(style);
	   """
	   let userScript = WKUserScript(source: cssScript, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
	   webView.configuration.userContentController.addUserScript(userScript)

	   return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    func makeCoordinator() -> Coordinator {
	   Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
	   let parent: PrivacyPolicyHTMLWeb

	   init(_ parent: PrivacyPolicyHTMLWeb) {
		  self.parent = parent
	   }

	   func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		  let script = """
		  document.body.innerText;
		  """
		  webView.evaluateJavaScript(script) { result, error in
			 if let text = result as? String {
				webView.accessibilityLabel = text
			 }
		  }
	   }

	   func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
		  if let url = navigationAction.request.url, navigationAction.navigationType == .linkActivated {
			 UIApplication.shared.open(url)
			 decisionHandler(.cancel)
		  } else {
			 decisionHandler(.allow)
		  }
	   }
    }
}
