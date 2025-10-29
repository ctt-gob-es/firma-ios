//
//  InstallCertificate.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 12/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct InstallCertificateView: View {
    @EnvironmentObject var appStatus: AppStatus
    
    var body: some View {
	   NavigationStack {
		  TutorialStepOneView()
			 .navigationTitle(
				NSLocalizedString("install_certificate_title", bundle: .main, comment: "")
			 )
			 .navigationBarTitleDisplayMode(.inline)
			 .environmentObject(appStatus)
	   }
    }
}
