//
//  HistoricalCell.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 10/1/25.
//  Copyright © 2025 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

struct HistoricalCell: View {
    @State var history: History
    
    var body: some View {
	   let textToShow = HistoricalUtils.getTextToShowFromHistory(history: history)
	   
	   
        VStack(alignment: .leading, spacing: 0) {
            
            if let date = history.date {
                HStack {
                    AccessibleText(content: date.historicalFormat)
                        .regularStyleSmall(foregroundColor: ColorConstants.Text.secondary)
                }
            }
            
            HStack {
                AccessibleText(content: textToShow)
                    .mediumBoldStyle(foregroundColor: ColorConstants.Text.primary)
            }
        }
    }
}
