//
//  SwiftCertificateUtils.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 26/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class SwiftCertificateUtils {
    func updateSelectedCertificate(certificateUtils: CertificateUtils?, _ selectedCertificateSubject: String)  -> Bool{
	   if ((certificateUtils?.searchIdentity(byName: selectedCertificateSubject)) != nil) {
		  let userDefaults = UserDefaults.standard
		  userDefaults.set([kAOUserDefaultsKeyAlias: selectedCertificateSubject], forKey: kAOUserDefaultsKeyCurrentCertificate)
		  userDefaults.synchronize()
		  certificateUtils?.selectedCertificateName = selectedCertificateSubject
		  return true
	   } else {
		  return false
	   }
    }
}
