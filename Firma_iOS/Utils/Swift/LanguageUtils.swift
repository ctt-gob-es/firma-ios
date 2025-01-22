//
//  LanguageUtils.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 12/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

private var bundleKey: UInt8 = 0

final class BundleEx: Bundle {
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
	   guard let bundle = objc_getAssociatedObject(self, &bundleKey) as? Bundle else {
		  return super.localizedString(forKey: key, value: value, table: tableName)
	   }
	   return bundle.localizedString(forKey: key, value: value, table: tableName)
    }
}

extension Bundle {
    static func setLanguage(_ language: String) {
	   defer {
		  object_setClass(Bundle.main, BundleEx.self)
	   }

	   objc_setAssociatedObject(Bundle.main, &bundleKey, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

	   guard let path = Bundle.main.path(forResource: language, ofType: "lproj"),
		    let bundle = Bundle(path: path) else {
		  return
	   }

	   objc_setAssociatedObject(Bundle.main, &bundleKey, bundle, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

extension String {
    func localized(using language: String) -> String {
	   guard let path = Bundle.main.path(forResource: language, ofType: "lproj"),
		    let bundle = Bundle(path: path) else {
		  return NSLocalizedString(self, comment: "")
	   }
	   return NSLocalizedString(self, bundle: bundle, comment: "")
    }
}

extension LocalizedLanguage {
    static let allLanguages: [LocalizedLanguage] = [
	   LocalizedLanguage(name: NSLocalizedString("language_es", bundle: Bundle.main, comment: ""), code: "es"),
	   LocalizedLanguage(name: NSLocalizedString("language_en", bundle: Bundle.main, comment: ""), code: "en"),
	   LocalizedLanguage(name: NSLocalizedString("language_ca", bundle: Bundle.main, comment: ""), code: "ca"),
	   LocalizedLanguage(name: NSLocalizedString("language_ga", bundle: Bundle.main, comment: ""), code: "gl"),
	   LocalizedLanguage(name: NSLocalizedString("language_eu", bundle: Bundle.main, comment: ""), code: "eu"),
	   LocalizedLanguage(name: NSLocalizedString("language_va", bundle: Bundle.main, comment: ""), code: "va")
    ]
}
