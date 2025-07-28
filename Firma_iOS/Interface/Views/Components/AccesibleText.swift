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
    
    var multilineTextAlignment: TextAlignment = .leading
    var lineLimit: Int? = nil
    var minimumScaleFactor: CGFloat = 1.0

    var body: some View {
	   Text(NSLocalizedString(content,bundle: Bundle.main, comment: ""))
            .multilineTextAlignment(multilineTextAlignment)
            .lineLimit(lineLimit)
            .minimumScaleFactor(minimumScaleFactor)
		  .accessibility(label: Text(NSLocalizedString(content,bundle: Bundle.main, comment: "")))
    }
}
