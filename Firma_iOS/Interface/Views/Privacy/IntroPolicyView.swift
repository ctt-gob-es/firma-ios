//
//  PrivacyView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
import Foundation
import SwiftUI

struct IntroPolicyView: View {
    @State private var isPrivacyPolicyAccepted: Bool = false
    @State private var isTermsAccepted: Bool = false
    @State private var selectedLanguage: LocalizedLanguage = LocalizedLanguage.allLanguages.first!
    
    var body: some View {
	   VStack(alignment: .leading) {
		  LanguageSelectorView(selectedLanguage: $selectedLanguage)
		  VStack(alignment: .leading, spacing: 20) {
			 HTMLWeb(htmlFileName: "intro_policy", languageCode: selectedLanguage.code)
				.padding()
				.border(Color.gray)
				
				VStack(alignment: .leading, spacing: 10) {
				    CheckBoxView(
					   isChecked: $isPrivacyPolicyAccepted,
					   title: NSLocalizedString("privacy_policy_checkbox_description", bundle: Bundle.main, comment: "")
				    )
				    CheckBoxView(
					   isChecked: $isTermsAccepted,
					   title: NSLocalizedString("privacy_tou_checkbox_description", bundle: Bundle.main, comment: "")
				    )
				}
			 
			 Spacer()
			 
			 NavigationLink(destination: ParentView(viewMode: ViewModes.home, urlReceived: nil)) {
				AccessibleText(content: NSLocalizedString("accept_button_title", bundle: Bundle.main, comment: ""))
			 }
			 .buttonStyle(CustomButtonStyle(isEnabled: (isPrivacyPolicyAccepted && isTermsAccepted)))
			 .disabled(!(isPrivacyPolicyAccepted && isTermsAccepted))
		  }
	   }
	   .navigationBarBackButtonHidden(true)
	   .navigationBarTitle(NSLocalizedString("privacy_controller_title", bundle: Bundle.main, comment: ""), displayMode: .inline)
	   .padding()
	   .onDisappear {
		  UserDefaults.standard.setValue(true, forKey: "user_privacy_accepted")
	   }
    }
}

struct LanguageSelectorView: View {
    @Binding var selectedLanguage: LocalizedLanguage

    var body: some View {
	   HStack {
		  AccessibleText(content: NSLocalizedString("language_title", bundle: Bundle.main, comment: ""))
			 .font(.headline)
		  
		  Menu {
			 ForEach(LocalizedLanguage.allLanguages) { language in
				Button(action: {
				    selectLanguage(language)
				}) {
				    HStack {
					   Text(language.name)
					   if language.id == selectedLanguage.id {
						  Spacer()
						  Image(systemName: "checkmark")
					   }
				    }
				}
			 }
		  } label: {
			 HStack {
				Text(selectedLanguage.name)
				    .foregroundColor(.primary)
				Image(systemName: "chevron.down")
				    .font(.system(size: 12, weight: .bold))
			 }
			 .padding(.horizontal)
			 .padding(.vertical, 5)
			 .overlay(
				RoundedRectangle(cornerRadius: 10)
				    .stroke(Color.gray, lineWidth: 1)
			 )
		  }
	   }
	   .onAppear {
		  loadSavedLanguage()
	   }
    }

    private func selectLanguage(_ language: LocalizedLanguage) {
	   selectedLanguage = language
	   UserDefaults.standard.set(language.code, forKey: "appLanguage")
	   Bundle.setLanguage(language.code)
    }

    private func loadSavedLanguage() {
	   let savedLanguageCode = UserDefaults.standard.string(forKey: "appLanguage") ?? Locale.current.language.languageCode?.identifier ?? "es"
	   if let language = LocalizedLanguage.allLanguages.first(where: { $0.code == savedLanguageCode }) {
		  selectedLanguage = language
	   }
    }
}
