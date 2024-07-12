//
//  TextStyles.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

extension Text {
    func titleStyle(foregroundColor: Color, alignment: TextAlignment = .leading) -> some View {
	   self
		  .font(.custom("Merriweather-Black", size: 20))
		  .foregroundColor(foregroundColor)
		  .multilineTextAlignment(alignment)
    }
    
    func subtitleStyle(foregroundColor: Color, alignment: TextAlignment = .leading) -> some View {
	   self
		  .font(.custom("Merriweather-Bold", size: 18))
		  .foregroundColor(foregroundColor)
		  .multilineTextAlignment(alignment)
    }
    
    func regularStyle(foregroundColor: Color, alignment: TextAlignment = .leading) -> some View {
	   self
		  .font(.custom("NunitoSans_10pt-Regular", size: 16))
		  .foregroundColor(foregroundColor)
		  .multilineTextAlignment(alignment)
    }
}

