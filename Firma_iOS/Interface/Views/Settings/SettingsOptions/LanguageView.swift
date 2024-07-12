//
//  LanguageView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 12/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct LocalizedLanguage: Identifiable {
    let id = UUID()
    let name: LocalizedStringKey
}

extension LocalizedLanguage {
    static let allLanguages: [LocalizedLanguage] = [
	   LocalizedLanguage(name: LocalizedStringKey("language_es")),
	   LocalizedLanguage(name: LocalizedStringKey("language_en")),
	   LocalizedLanguage(name: LocalizedStringKey("language_ca")),
	   LocalizedLanguage(name: LocalizedStringKey("language_ga")),
	   LocalizedLanguage(name: LocalizedStringKey("language_eu")),
	   LocalizedLanguage(name: LocalizedStringKey("language_va"))
    ]
}

struct LanguageView: View {
    @State private var selectedLanguage: LocalizedStringKey = LocalizedStringKey("language_es")
    let languages = LocalizedLanguage.allLanguages

    var body: some View {
	   List {
		  ForEach(languages) { language in
			 LanguageCell(language: language.name, isSelected: language.name == selectedLanguage)
				.onTapGesture {
				    selectedLanguage = language.name
				}
				.listRowSeparator(.hidden)
		  }
		  .listRowBackground(Color.white)
	   }
	   .navigationTitle(LocalizedStringKey("language_title"))
	   .listStyle(PlainListStyle())
	   .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct LanguageCell: View {
    let language: LocalizedStringKey
    let isSelected: Bool

    var body: some View {
	   VStack(spacing: 0) {
		  HStack(spacing: 4) {
			 Text(language)
				.foregroundColor(.black)
			 Spacer()
			 if isSelected {
				Image(systemName: "checkmark")
				    .foregroundColor(ColorConstants.Text.accent)
			 }
		  }
		  .padding()
		  .background(isSelected ? Color(UIColor.systemGray6) : Color.white)
		  .cornerRadius(isSelected ? 10 : 0) // Rounded corners for selected cell
		  
		  if !isSelected {
			 Divider()
		  }
	   }
    }
}
