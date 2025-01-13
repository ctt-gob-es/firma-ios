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
	   
	   HStack {
		  VStack(alignment: .leading, spacing: 6) {
			 
			 /*if let externalApp = history.externalApp {
				if externalApp != "" {
				    AccessibleText(content: externalApp)
					   .regularBoldStyle(foregroundColor: ColorConstants.Text.secondary)
					   .underline()
				}
			 }*/
			 
			 HStack {
				AccessibleText(content: history.filename ?? "")
				    .mediumBoldStyle(foregroundColor: ColorConstants.Text.primary)
				
				Spacer()
			 }
			 
			 HStack {
				if let signType = history.signType {
				    Image(systemName: "signature")
				    
				    AccessibleText(content: NSLocalizedString(signType, bundle: Bundle.main, comment: ""))
					   .mediumBoldStyle(foregroundColor: ColorConstants.Text.primary)
				}
			 }
			 
			 if let date = history.date {
				HStack {
				    Image("clock")
					   .renderingMode(.template)
					   .foregroundColor(ColorConstants.Text.accent)
					   .accessibilityHidden(true)
				    
				    AccessibleText(content: date.historicalFormat)
					   .regularStyle(foregroundColor: ColorConstants.Text.secondary)
				    
				    Spacer()
				    
				    if let dataType = history.dataType {
					   AccessibleText(content: NSLocalizedString(dataType, bundle: Bundle.main, comment: ""))
						  .regularStyle(foregroundColor: ColorConstants.Text.secondary)
				    }
				}
			 }

			 HStack {
				AccessibleText(content: textToShow)
				    .mediumBoldStyle(foregroundColor: ColorConstants.Text.primary)
			 }
		  }
	   }
    }
}
