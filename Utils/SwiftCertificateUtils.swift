//
//  SwiftCertificateUtils.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 26/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import Security

class SwiftCertificateUtils {
   static func updateSelectedCertificate(certificateUtils: CertificateUtils?, _ selectedCertificateSubject: String)  -> Bool{
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
    
    static func getIdentityFromKeychain(certName: String) -> SecIdentity? {
	   let query: [String: Any] = [
		  kSecClass as String: kSecClassIdentity,
		  kSecAttrLabel as String: certName,
		  kSecReturnRef as String: kCFBooleanTrue!,
		  kSecMatchLimit as String: kSecMatchLimitOne
	   ]

	   var item: CFTypeRef?
	   let status = SecItemCopyMatching(query as CFDictionary, &item)
	   
	   guard status == errSecSuccess else {
		  return nil
	   }

	   let identity = item as! SecIdentity
	   return identity
    }
}
