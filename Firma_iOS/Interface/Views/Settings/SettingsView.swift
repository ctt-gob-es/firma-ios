import SwiftUI

struct SettingsSection: Identifiable {
    let id = UUID()
    let header: String
    let rows: [SettingsRowItem]
}

struct SettingsRowItem: Identifiable {
    let id = UUID()
    let icon: String
    let text: String
    let detailText: String?
    let destination: AnyView
}

import SwiftUI

struct SettingsView: View {
    @State private var currentLanguage: String = UserDefaults.standard.string(forKey: "appLanguage") ?? Locale.current.language.languageCode?.identifier ?? "es"
    
    init() {
	   UITableViewHeaderFooterView.appearance().tintColor = UIColor.white
    }
    
    var body: some View {
	   VStack(spacing: 0) {
		  List {
			 ForEach(createSettingsSections()) { section in
				Section(header: SettingsHeaderView(title: section.header)) {
				    ForEach(section.rows) { row in
					   ZStack {
						  SettingsRow(
							 icon: row.icon,
							 text: row.text,
							 detailText: row.detailText
						  )
						  NavigationLink(destination: row.destination) {
							 EmptyView()
						  }
						  .opacity(0)
					   }
					   .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
						  return -100
					   }
				    }
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
	   .background(Color.white.edgesIgnoringSafeArea(.all))
	   .navigationBarTitle(NSLocalizedString("settings_title", bundle: Bundle.main, comment: ""), displayMode: .inline)
    }
    
    private func createSettingsSections() -> [SettingsSection] {
	   return [
		  SettingsSection(
			 header: NSLocalizedString("settings_my_config_title", bundle: Bundle.main, comment: ""),
			 rows: [
				SettingsRowItem(icon: "flag", text: NSLocalizedString("settings_language_row", bundle: Bundle.main, comment: ""), detailText: currentLanguage.uppercased(), destination: AnyView(LanguageView())),
				SettingsRowItem(icon: "gearshape", text: NSLocalizedString("settings_permission_row", bundle: Bundle.main, comment: ""), detailText: nil, destination: AnyView(PermissionsView()))
			 ]
		  ),
		  SettingsSection(
			 header: NSLocalizedString("settings_help_title", bundle: Bundle.main, comment: ""),
			 rows: [
				SettingsRowItem(icon: "questionmark.circle", text: NSLocalizedString("settings_faq_row", bundle: Bundle.main, comment: ""), detailText: nil, destination: AnyView(FAQView())),
				SettingsRowItem(icon: "tray", text: NSLocalizedString("settings_install_certificate_row", bundle: Bundle.main, comment: ""), detailText: nil, destination: AnyView(InstallCertificateView()))
			 ]
		  ),
		  SettingsSection(
			 header: NSLocalizedString("settings_general_info_title", bundle: Bundle.main, comment: ""),
			 rows: [
				SettingsRowItem(icon: "clock.arrow.circlepath", text: NSLocalizedString("settings_historical_row", bundle: Bundle.main, comment: ""), detailText: nil, destination: AnyView(HistoricalView())),
				SettingsRowItem(icon: "accessibility", text: NSLocalizedString("settings_accesibility_info_row", bundle: Bundle.main, comment: ""), detailText: nil, destination: AnyView(WebView(urlString: NSLocalizedString("url_accessibility_statement", bundle: Bundle.main, comment: "")))),
				SettingsRowItem(icon: "shield", text: NSLocalizedString("settings_legal_advice_row", bundle: Bundle.main, comment: ""), detailText: nil, destination: AnyView(WebView(urlString: NSLocalizedString("url_forja", bundle: Bundle.main, comment: "")))),
				SettingsRowItem(icon: "lock", text: NSLocalizedString("settings_privacy_policy_row", bundle: Bundle.main, comment: ""), detailText: nil, destination: AnyView(WebView(urlString: NSLocalizedString("url_privacy_policy", bundle: Bundle.main, comment: "")))),
				SettingsRowItem(icon: "iphone", text: NSLocalizedString("settings_version_row", bundle: Bundle.main, comment: ""), detailText: nil, destination: AnyView(VersionView()))
			 ]
		  )
	   ]
    }
}
