//
//  AttributedText.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 12/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI
import UIKit

struct AttributedTextView: UIViewRepresentable {
    var text: String

    func makeUIView(context: Context) -> UITextView {
	   let textView = UITextView()
	   textView.isEditable = false
	   textView.isSelectable = true
	   textView.isScrollEnabled = true
	   textView.dataDetectorTypes = .link
	   textView.backgroundColor = .clear
	   textView.textContainerInset = .zero
	   textView.textContainer.lineFragmentPadding = 0
	   textView.setContentHuggingPriority(.defaultHigh, for: .vertical)
	   textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
	   
	   DispatchQueue.global(qos: .userInitiated).async {
		  let attributedText = self.getAttributedString(from: self.text)
		  DispatchQueue.main.async {
			 textView.attributedText = attributedText
		  }
	   }
	   
	   return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
	   DispatchQueue.global(qos: .userInitiated).async {
		  let attributedText = self.getAttributedString(from: self.text)
		  DispatchQueue.main.async {
			 uiView.attributedText = attributedText
		  }
	   }
    }

    private func getAttributedString(from text: String) -> NSAttributedString {
	   let attributedString = NSMutableAttributedString(string: text)
	   let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
	   let matches = detector?.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
	   
	   matches?.forEach { match in
		  if let range = Range(match.range, in: text) {
			 let url = text[range]
			 attributedString.addAttribute(.link, value: url, range: match.range)
		  }
	   }
	   
	   let bodyFont = UIFont.customFont(forTextStyle: .body, customFontName: "NunitoSans10pt-Regular")
	   attributedString.addAttribute(.font, value: bodyFont, range: NSRange(location: 0, length: attributedString.length))
	   
	   return attributedString
    }
}

extension UIFont {
    static func customFont(forTextStyle style: UIFont.TextStyle, customFontName: String) -> UIFont {
	   let userFont = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
	   let pointSize = userFont.pointSize
	   return UIFont(name: customFontName, size: pointSize) ?? UIFont.systemFont(ofSize: pointSize)
    }
}
