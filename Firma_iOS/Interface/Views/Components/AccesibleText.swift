//
//  AccesibleText.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 15/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct AccessibleText: View {
    let content: String

    var body: some View {
	   Text(NSLocalizedString(content,bundle: Bundle.main, comment: ""))
		  .accessibility(label: Text(NSLocalizedString(content,bundle: Bundle.main, comment: "")))
    }
}
