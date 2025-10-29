//
//  View+Extension.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 12/9/25.
//  Copyright © 2025 Solid GEAR. All rights reserved.
//

import SwiftUI

extension View {
    func appLocale(_ code: String) -> some View {
	   self
		  .environment(\.locale, Locale(identifier: code))
		  .id(code)
    }
}
