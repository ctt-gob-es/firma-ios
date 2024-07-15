//
//  SettingsView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
import SwiftUI

struct SettingsView: View {
    @State private var currentLanguage: String = UserDefaults.standard.string(forKey: "appLanguage") ?? Locale.current.language.languageCode?.identifier ?? "es"
    
    init() {
	   UITableViewHeaderFooterView.appearance().tintColor = UIColor.white
    }
    
    var body: some View {
	   VStack(spacing: 0) {
		  List {
			 Section(header: CustomHeaderView(title: NSLocalizedString("settings_my_config_title",bundle: Bundle.main ,comment: ""))) {
				ZStack {
				    SettingsRow(icon: "flag", text: NSLocalizedString("settings_language_row",bundle: Bundle.main ,comment: ""), detailText: currentLanguage.uppercased())
				    NavigationLink(destination: LanguageView()) {
					   EmptyView()
				    }
				    .opacity(0)
				}
				
				ZStack {
				    SettingsRow(icon: "gearshape", text: NSLocalizedString("settings_permission_row",bundle: Bundle.main ,comment: ""))
				    NavigationLink(destination: PermissionsView()) {
					   EmptyView()
				    }
				    .opacity(0)
				}
			 }
			 
			 Section(header: CustomHeaderView(title: NSLocalizedString("settings_help_title",bundle: Bundle.main ,comment: ""))) {
				ZStack {
				    SettingsRow(icon: "questionmark.circle", text: NSLocalizedString("settings_faq_row",bundle: Bundle.main ,comment: ""))
				    NavigationLink(destination: FAQView()) {
					   EmptyView()
				    }
				    .opacity(0)
				}
				
				ZStack {
				    SettingsRow(icon: "tray", text: NSLocalizedString("settings_install_certificate_row",bundle: Bundle.main ,comment: ""))
				    NavigationLink(destination: InstallCertificateView()) {
					   EmptyView()
				    }
				    .opacity(0)
				}
			 }
			 
			 Section(header: CustomHeaderView(title: NSLocalizedString("settings_general_info_title",bundle: Bundle.main ,comment: ""))) {
				ZStack {
				    SettingsRow(icon: "accessibility", text: NSLocalizedString("settings_accesibility_info_row",bundle: Bundle.main ,comment: ""))
				    NavigationLink(destination: WebView(urlString: NSLocalizedString("url_accessibility_statement",bundle: Bundle.main ,comment: ""))) {
					   EmptyView()
				    }
				    .opacity(0)
				}
				
				ZStack {
				    SettingsRow(icon: "shield", text: NSLocalizedString("settings_legal_advice_row",bundle: Bundle.main ,comment: ""))
				    NavigationLink(destination: WebView(urlString: NSLocalizedString("url_forja",bundle: Bundle.main ,comment: ""))) {
					   EmptyView()
				    }
				    .opacity(0)
				}
				
				ZStack {
				    SettingsRow(icon: "lock", text: NSLocalizedString("settings_privacy_policy_row",bundle: Bundle.main ,comment: ""))
				    NavigationLink(destination: WebView(urlString: NSLocalizedString("url_privacy_policy",bundle: Bundle.main ,comment: ""))) {
					   EmptyView()
				    }
				    .opacity(0)
				}
				
				ZStack {
				    SettingsRow(icon: "iphone", text: NSLocalizedString("settings_version_row",bundle: Bundle.main ,comment: ""))
				    NavigationLink(destination: VersionView()) {
					   EmptyView()
				    }
				    .opacity(0)
				}
			 }
		  }
		  .buttonStyle(.plain)
		  .tint(ColorConstants.Text.accent)
		  .listStyle(GroupedListStyle())
		  .background {
			 Color.white
		  }
		  .scrollContentBackground(.hidden)
		  .onAppear {
			 let savedLanguageCode = UserDefaults.standard.string(forKey: "appLanguage") ?? Locale.current.language.languageCode?.identifier ?? "es"
			 self.currentLanguage = savedLanguageCode
		  }
		  
		  SettingsFooterView()
			 .frame(maxWidth: .infinity)
			 .background(Color.white)
	   }
	   .background(Color.white.edgesIgnoringSafeArea(.all)) // Fondo blanco completo
	   .navigationBarTitle(NSLocalizedString("settings_title",bundle: Bundle.main ,comment: ""), displayMode: .inline)
    }
}

struct CustomHeaderView: View {
    let title: String
    
    var body: some View {
	   Text(title)
		  .font(.headline)
		  .foregroundColor(.black)
    }
}

struct SettingsRow: View {
    let icon: String
    let text: String
    var detailText: String? = nil
    
    var body: some View {
	   HStack {
		  Image(systemName: icon)
			 .foregroundColor(ColorConstants.Text.accent)
		  Text(text)
			 .regularBoldStyle(foregroundColor: .black)
		  
		  Spacer()
		  if let detailText = detailText {
			 Text(detailText)
				.font(.system(size: 14))
				.foregroundColor(Color(hex: "#224D70"))
				.padding(.horizontal, 10)
				.background(
				    RoundedRectangle(cornerRadius: 12)
					   .stroke(Color(hex: "#224D70"), lineWidth: 1)
				)
		  }
		  Image(systemName: "chevron.right")
			 .foregroundColor(ColorConstants.Text.accent)
	   }
	   .padding(.vertical, 8)
    }
}
