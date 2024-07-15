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
    let name: String
    let code: String
}

struct LanguageView: View {
    @State private var selectedLanguage: String = NSLocalizedString("language_es", bundle: Bundle.main, comment: "")
    let languages = LocalizedLanguage.allLanguages

    var body: some View {
	   List {
		  ForEach(languages) { language in
			 LanguageCell(language: language.name, isSelected: language.name == selectedLanguage)
				.onTapGesture {
				    selectedLanguage = language.name
				    UserDefaults.standard.set(language.code, forKey: "appLanguage")
				    Bundle.setLanguage(language.code)
				}
				.listRowSeparator(.hidden)
		  }
		  .listRowBackground(Color.white)
	   }
	   .navigationTitle(NSLocalizedString("language_title", bundle: Bundle.main, comment: ""))
	   .listStyle(PlainListStyle())
	   .background(Color.white.edgesIgnoringSafeArea(.all))
	   .onAppear {
		  let savedLanguageCode = UserDefaults.standard.string(forKey: "appLanguage") ?? Locale.current.language.languageCode?.identifier ?? "es"
		  if let language = languages.first(where: { $0.code == savedLanguageCode }) {
			 selectedLanguage = language.name
		  }
	   }
    }
}

struct LanguageCell: View {
    let language: String
    let isSelected: Bool

    var body: some View {
	   VStack(spacing: 0) {
		  HStack(spacing: 4) {
			 Text(language)
				.regularBoldStyle(foregroundColor: .black)
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
