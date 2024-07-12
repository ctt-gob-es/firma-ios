//
//  SettingsView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
import SwiftUI

struct SettingsView: View {
    init() {
	   UITableViewHeaderFooterView.appearance().tintColor = UIColor.white
    }
    
    var body: some View {
	   VStack(spacing: 0) {
		  List {
			 Section(header: CustomHeaderView(title: "settings_my_config_title")) {
				ZStack {
				    SettingsRow(icon: "flag", text: "settings_language_row", detailText: "ES")
				    NavigationLink(destination: LanguageView()) {
					   EmptyView()
				    }
				    .opacity(0)
				}
				
				ZStack {
				    SettingsRow(icon: "gearshape", text: "settings_permission_row")
				    NavigationLink(destination: PermissionsView()) {
					   EmptyView()
				    }
				    .opacity(0)
				}
			 }
			 
			 Section(header: CustomHeaderView(title: "settings_help_title")) {
				ZStack {
				    SettingsRow(icon: "questionmark.circle", text: "settings_faq_row")
				    NavigationLink(destination: FAQView()) {
					   EmptyView()
				    }
				    .opacity(0)
				}
				
				ZStack {
				    SettingsRow(icon: "tray", text: "settings_install_certificate_row")
				    NavigationLink(destination: InstallCertificateView()) {
					   EmptyView()
				    }
				    .opacity(0)
				}
			 }
			 
			 Section(header: CustomHeaderView(title: "settings_general_info_title")) {
				ZStack {
				    SettingsRow(icon: "accessibility", text: "settings_accesibility_info_row")
				    NavigationLink(destination: WebView(urlString: NSLocalizedString("url_accessibility_statement", comment: ""))) {
					   EmptyView()
				    }
				    .opacity(0)
				}
				
				ZStack {
				    SettingsRow(icon: "shield", text: "settings_legal_advice_row")
				    NavigationLink(destination: WebView(urlString: NSLocalizedString("url_forja", comment: ""))) {
					   EmptyView()
				    }
				    .opacity(0)
				}
				
				ZStack {
				    SettingsRow(icon: "lock", text: "settings_privacy_policy_row")
				    NavigationLink(destination: WebView(urlString: NSLocalizedString("url_privacy_policy", comment: ""))) {
					   EmptyView()
				    }
				    .opacity(0)
				}
				
				ZStack {
				    SettingsRow(icon: "iphone", text: "settings_version_row")
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
		  
		  SettingsFooterView()
			 .frame(maxWidth: .infinity)
			 .background(Color.white)
	   }
	   .background(Color.white.edgesIgnoringSafeArea(.all)) // Fondo blanco completo
	   .navigationBarTitle("Ajustes", displayMode: .inline)
    }
}

struct CustomHeaderView: View {
    let title: LocalizedStringKey
    
    var body: some View {
	   Text(title)
		  .font(.headline)
		  .foregroundColor(.black)
    }
}

struct SettingsRow: View {
    let icon: String
    let text: LocalizedStringKey
    var detailText: String? = nil
    
    var body: some View {
	   HStack {
		  Image(systemName: icon)
			 .foregroundColor(ColorConstants.Text.accent)
		  Text(text)
		  Spacer()
		  if let detailText = detailText {
			 Text(detailText)
				.font(.system(size: 14))
				.foregroundColor(Color(hex: "#224D70"))
				.padding(.horizontal, 10)
				.padding(.vertical, 5)
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

