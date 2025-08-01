//
//  TextStyles.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 11/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

extension AccessibleText {
    func titleBigStyleBlack(foregroundColor: Color, alignment: TextAlignment = .leading) -> some View {
	   self
		  .font(.custom("Merriweather-Bold", size: 24))
		  .foregroundColor(foregroundColor)
		  .multilineTextAlignment(alignment)
    }
    func titleStyleBlack(foregroundColor: Color, alignment: TextAlignment = .leading) -> some View {
	   self
		  .font(.custom("Merriweather-Black", size: 20))
		  .foregroundColor(foregroundColor)
		  .multilineTextAlignment(alignment)
    }
    
    func titleStyleBold(foregroundColor: Color, alignment: TextAlignment = .leading) -> some View {
	   self
		  .font(.custom("Merriweather-Bold", size: 16))
		  .foregroundColor(foregroundColor)
		  .multilineTextAlignment(alignment)
    }
    
    func subtitleStyle(foregroundColor: Color, alignment: TextAlignment = .leading) -> some View {
	   self
		  .font(.custom("Merriweather-Bold", size: 18))
		  .foregroundColor(foregroundColor)
		  .multilineTextAlignment(alignment)
    }
    
    func mediumBoldStyle(foregroundColor: Color, alignment: TextAlignment = .leading) -> some View {
	   self
		  .font(.custom("NunitoSans10pt-Bold", size: 18))
		  .foregroundColor(foregroundColor)
		  .multilineTextAlignment(alignment)
    }
    
    func regularBoldStyle(foregroundColor: Color, alignment: TextAlignment = .leading) -> some View {
	   self
		  .font(.custom("NunitoSans10pt-Bold", size: 16))
		  .foregroundColor(foregroundColor)
		  .multilineTextAlignment(alignment)
    }
    
    func regularStyle(foregroundColor: Color, alignment: TextAlignment = .leading) -> some View {
	   self
		  .font(.custom("NunitoSans10pt-Regular", size: 16))
		  .foregroundColor(foregroundColor)
		  .multilineTextAlignment(alignment)
    }
    
    func semiboldStyleSmall(foregroundColor: Color, alignment: TextAlignment = .leading) -> some View {
	   self
		  .font(.custom("NunitoSans10pt-SemiBold", size: 14))
		  .foregroundColor(foregroundColor)
		  .multilineTextAlignment(alignment)
    }
    
    func boldStyleSmall(foregroundColor: Color, alignment: TextAlignment = .leading) -> some View {
	   self
		  .font(.custom("NunitoSans10pt-Bold", size: 12))
		  .foregroundColor(foregroundColor)
		  .multilineTextAlignment(alignment)
    }
    
    func regularStyleSmall(foregroundColor: Color, alignment: TextAlignment = .leading) -> some View {
       self
          .font(.custom("NunitoSans10pt-Regular", size: 12))
          .foregroundColor(foregroundColor)
          .multilineTextAlignment(alignment)
    }
}

extension Text {
    func regularStyle(foregroundColor: Color, alignment: TextAlignment = .leading) -> Text {
	   self
		  .font(.custom("NunitoSans10pt-Regular", size: 16))
		  .foregroundColor(foregroundColor)
		  //.multilineTextAlignment(alignment)
    }

    func regularBoldStyle(foregroundColor: Color, alignment: TextAlignment = .leading) -> Text {
	   self
		  .font(.custom("NunitoSans10pt-Bold", size: 16))
		  .foregroundColor(foregroundColor)
		  //.multilineTextAlignment(alignment)
    }
}
