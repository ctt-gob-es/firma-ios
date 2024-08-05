//
//  SwiftCertificateUtils.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 26/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import Security


enum CertificateExpirationOptions {
    case almostExpired
    case expired
    case valid
    
    var title: String {
	   switch self {
		  case .almostExpired:
			 return NSLocalizedString("certificate_close_to_expire", bundle: Bundle.main, comment: "")
		  case .expired:
			 return NSLocalizedString("certificate_expired", bundle: Bundle.main, comment: "")
		  case .valid:
			 return ""
	   }
    }
}


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
    
    static func getCertificateOption(certificate: AOCertificateInfo) -> CertificateExpirationOptions {
	   let today = Date()
	   let calendar = Calendar.current
	   let xDaysFromNow = calendar.date(byAdding: .day, value: DAYS_TO_EXPIRE, to: today)!
	   
	   if certificate.expirationDate < today {
		  return .expired
	   } else if certificate.expirationDate < xDaysFromNow {
		  return .almostExpired
	   } else {
		  return .valid
	   }
    }
    
    static func loadCertificate(
	   certName: String,
	   password: String,
	   fromDocument: Bool
    ) -> OSStatus? {
	   var status: OSStatus?
	   
	   let certificateUtils = CertificateUtils.sharedWrapper()
	   
	   if let certificateUtils = certificateUtils {
		  status = certificateUtils.loadCertKeyChain(withName: certName, password: password, fromDocument: fromDocument)
	   }
	   
	   return status
    }
}
