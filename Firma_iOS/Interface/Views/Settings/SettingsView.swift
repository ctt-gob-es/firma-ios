import SwiftUI

struct SettingsView: View {
    @State private var currentLanguage: String = UserDefaults.standard.string(forKey: "appLanguage") ?? Locale.current.language.languageCode?.identifier ?? "es"
    
    init() {
	   UITableViewHeaderFooterView.appearance().tintColor = UIColor.white
    }
    
    var body: some View {
	   GeometryReader { geometry in
		  let isLandscape = geometry.size.width > geometry.size.height
		  let footerMaxHeight = isLandscape ? geometry.size.height * 0.30 : geometry.size.height * 0.15
		  
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
						  .alignmentGuide(.listRowSeparatorLeading) { _ in -100 }
					   }
				    }
				}
			 }
			 .buttonStyle(.plain)
			 .tint(ColorConstants.Text.accent)
			 .listStyle(GroupedListStyle())
			 .background(Color.white)
			 .scrollContentBackground(.hidden)
			 .onAppear {
				let savedLanguageCode = UserDefaults.standard.string(forKey: "appLanguage")
				    ?? Locale.current.language.languageCode?.identifier
				    ?? "es"
				self.currentLanguage = savedLanguageCode
			 }
			 
			 // Footer con altura dinámica
			 SettingsFooterView()
				.frame(maxWidth: .infinity, maxHeight: footerMaxHeight)
				.background(Color.white)
		  }
		  .background(Color.white.edgesIgnoringSafeArea(.all))
		  .navigationBarTitle(
			 NSLocalizedString("settings_title", bundle: Bundle.main, comment: ""),
			 displayMode: .inline
		  )
	   }
    }
    
    func loadSavedLanguage() -> LocalizedLanguage{
	   let savedLanguageCode = UserDefaults.standard.string(forKey: "appLanguage") ?? Locale.current.language.languageCode?.identifier ?? "es"
	   if let language = LocalizedLanguage.allLanguages.first(where: { $0.code == savedLanguageCode }) {
		 return language
	   } else {
		  return LocalizedLanguage.allLanguages.first!
	   }
    }
    
    private func createSettingsSections() -> [SettingsSection] {
	   return [
		  SettingsSection(
			 header: NSLocalizedString("settings_my_config_title", bundle: Bundle.main, comment: ""),
			 rows: [
				SettingsRowItem(icon: "flag", text: NSLocalizedString("settings_language_row", bundle: Bundle.main, comment: ""), detailText: currentLanguage, destination: AnyView(LanguageView())),
				SettingsRowItem(icon: "gearshape", text: NSLocalizedString("settings_permission_row", bundle: Bundle.main, comment: ""), destination: AnyView(PermissionsView()))
			 ]
		  ),
		  SettingsSection(
			 header: NSLocalizedString("settings_help_title", bundle: Bundle.main, comment: ""),
			 rows: [
				SettingsRowItem(icon: "questionmark.circle", text: NSLocalizedString("settings_faq_row", bundle: Bundle.main, comment: ""), destination: AnyView(FAQView())),
				SettingsRowItem(icon: "tray", text: NSLocalizedString("settings_install_certificate_row", bundle: Bundle.main, comment: ""), destination: AnyView(InstallCertificateView()))
			 ]
		  ),
		  SettingsSection(
			 header: NSLocalizedString("settings_general_info_title", bundle: Bundle.main, comment: ""),
			 rows: [
				SettingsRowItem(icon: "clock", text: NSLocalizedString("settings_historical_row", bundle: Bundle.main, comment: ""), destination: AnyView(HistoricalView())),
                    SettingsRowItem(icon: "accessibility", text: NSLocalizedString("settings_accesibility_info_row", bundle: Bundle.main, comment: ""), destination: AnyView(WebView(settingKey: .accesibility))),
				SettingsRowItem(icon: "shield", text: NSLocalizedString("settings_legal_advice_row", bundle: Bundle.main, comment: ""), destination: AnyView(LegalAdviceView(selectedLanguage: self.loadSavedLanguage()))),
                    SettingsRowItem(icon: "lock", text: NSLocalizedString("settings_privacy_policy_row", bundle: Bundle.main, comment: ""), destination: AnyView(PrivacyPolicyView(selectedLanguage: self.loadSavedLanguage()))),
                    SettingsRowItem(icon: "iphone", text:String(format: NSLocalizedString("settings_version_row", bundle: Bundle.main, comment: ""), Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""), destination: AnyView(VersionView()))
			 ]
		  )
	   ]
    }
}
