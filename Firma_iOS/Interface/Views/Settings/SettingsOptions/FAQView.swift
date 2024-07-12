//
//  CommonQuestionsView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 12/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct FAQItem: Identifiable {
    let id = UUID()
    let question: String
    let answer: String
}

struct FAQView: View {
    let faqItems = [
	   FAQItem(question: NSLocalizedString("faq_question_one", comment: ""), answer: NSLocalizedString("faq_answer_one", comment: "")),
	   FAQItem(question: NSLocalizedString("faq_question_two", comment: ""), answer: NSLocalizedString("faq_answer_two", comment: "")),
	   FAQItem(question: NSLocalizedString("faq_question_three", comment: ""), answer: NSLocalizedString("faq_answer_three", comment: "")),
	   FAQItem(question: NSLocalizedString("faq_question_four", comment: ""), answer: NSLocalizedString("faq_answer_four", comment: ""))
    ]
    
    var body: some View {
	   List(faqItems) { item in
		  ExpandableCellView(faqItem: item)
	   }
	   .listStyle(PlainListStyle())
	   .navigationBarTitle("faq_title", displayMode: .inline)
    }
}

struct ExpandableCellView: View {
    @State private var expanded: Bool = false
    let faqItem: FAQItem
    
    var body: some View {
	   DisclosureGroup(isExpanded: $expanded) {
		  Text(faqItem.answer)
			 .font(.body)
			 .padding(.horizontal, 0)
			 .listRowInsets(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
	   } label: {
		  Text(faqItem.question)
			 .font(.headline)
			 .padding(.vertical)
	   }
	   .tint(.black)
	   .background(Color.white)
    }
}
