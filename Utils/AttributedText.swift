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
	   textView.attributedText = getAttributedString(from: text)
	   textView.backgroundColor = .clear
	   textView.textContainerInset = .zero
	   textView.textContainer.lineFragmentPadding = 0
	   textView.setContentHuggingPriority(.defaultHigh, for: .vertical)
	   textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
	   return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
	   uiView.attributedText = getAttributedString(from: text)
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
	   return attributedString
    }
}


