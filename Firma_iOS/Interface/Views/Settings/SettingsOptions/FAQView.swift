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
	   FAQItem(question: NSLocalizedString("faq_question_one",bundle: Bundle.main, comment: ""), answer: NSLocalizedString("faq_answer_one", bundle: Bundle.main, comment: "")),
	   FAQItem(question: NSLocalizedString("faq_question_two",bundle: Bundle.main, comment: ""), answer: NSLocalizedString("faq_answer_two", bundle: .main, comment: "")),
	   FAQItem(question: NSLocalizedString("faq_question_three",bundle: Bundle.main, comment: ""), answer: NSLocalizedString("faq_answer_three",bundle: Bundle.main, comment: "")),
	   FAQItem(question: NSLocalizedString("faq_question_four",bundle: Bundle.main, comment: ""), answer: NSLocalizedString("faq_answer_four",bundle: Bundle.main, comment: ""))
    ]
    
    var body: some View {
	   List(faqItems) { item in
		  ExpandableCellView(faqItem: item)
	   }
	   .listStyle(PlainListStyle())
	   .navigationBarTitle(NSLocalizedString("faq_title",bundle: Bundle.main, comment: ""), displayMode: .inline)
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
