//
//  InstallCertificate.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 12/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct InstallCertificateView: View {
    @EnvironmentObject var appStatus: AppStatus
    @State private var selectedTab = 0
    
    var body: some View {
	   TabView(selection: $selectedTab) {
		  TutorialView(
			 viewModel: TutorialViewModel(
				imageName: "install_certificate_1",
				title: NSLocalizedString("install_certificate_title_one", bundle: Bundle.main, comment: ""),
				description: NSLocalizedString("install_certificate_description_one", bundle: Bundle.main, comment: ""),
				buttonText: NSLocalizedString("install_certificate_button_one_title", bundle: Bundle.main, comment: ""),
				buttonAction: {
				    selectedTab = 1
				},
				currentPage: selectedTab,
				numberOfPages: 2
			 ),
			 currentPage: $selectedTab
		  )
		  .tag(0)
		  
		  TutorialView(
			 viewModel: TutorialViewModel(
				imageName: "install_certificate_2",
				title: NSLocalizedString("install_certificate_title_two", bundle: Bundle.main, comment: ""),
				description: NSLocalizedString("install_certificate_description_two", bundle: Bundle.main, comment: ""),
				buttonText: NSLocalizedString("install_certificate_button_two_title", bundle: Bundle.main, comment: ""),
				buttonAction: {
				    appStatus.showDocumentPicker.toggle()
				},
				currentPage: selectedTab,
				numberOfPages: 2
			 ),
			 currentPage: $selectedTab
		  )
		  .tag(1)
	   }
	   .navigationTitle(NSLocalizedString("install_certificate_title", bundle: Bundle.main, comment: ""))
	   .tabViewStyle(.page(indexDisplayMode: .never))
	   .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
    }
}
