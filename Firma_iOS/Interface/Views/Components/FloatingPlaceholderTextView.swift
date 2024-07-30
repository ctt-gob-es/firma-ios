//
//  FloatingPlaceholderTextView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 17/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct FloatingPlaceholderTextField: View {
    @State var placeholder: String
    @State var errorplaceholder: String
    @Binding var text: String
    @Binding var showError: Bool
    @State var imageName: String
    @State var isSecureTextEntry: Bool
    @State var validation: (_ :String) -> Bool
    @State private var isFocused: Bool = false
    @State var isSecureTextShown: Bool = false
    
    var body: some View {
	   VStack(alignment: .leading) {
		  VStack(alignment: .leading, spacing: 0) {
			 AccessibleText(content: placeholder)
				.regularStyle(foregroundColor: ColorConstants.Text.secondary)
				.padding(.horizontal)
				.offset(y: isFocused || !text.isEmpty ? 0 : 20)
				.scaleEffect(isFocused || !text.isEmpty ? 0.75 : 1.0, anchor: .zero)
				.padding(.top, 4)
			 
			 if isSecureTextEntry && !isSecureTextShown {
				SecureField("", text: $text, onCommit: {
				    isFocused = false
				})
				.onTapGesture {
				    isFocused = true
				}
				.font(.custom("NunitoSans10pt-Regular", size: 16))
				.foregroundColor(.primary)
				.padding([.horizontal])
				.textInputAutocapitalization(.none)
				.autocapitalization(.none)
			 } else {
				TextField("", text: $text, onEditingChanged: { editing in
				    isFocused = editing
				})
				.font(.custom("NunitoSans10pt-Regular", size: 16))
				.foregroundColor(.primary)
				.padding([.horizontal])
				.textInputAutocapitalization(.none)
				.autocapitalization(.none)
			 }
			 
			 ZStack {
				if showError {
				    HStack {
					   Image(systemName: imageName)
						  .foregroundColor(ColorConstants.Status.error)
					   AccessibleText(content: errorplaceholder)
						  .semiboldStyleSmall(foregroundColor: ColorConstants.Status.error)
					   Spacer()
				    }
				    .padding(.horizontal)
				    .padding(.bottom, 4)
				}
				
				if isSecureTextEntry && text.count > 0{
				    HStack {
					   Spacer()
					   Button(action: {
						  isSecureTextShown.toggle()
					   }) {
						  Image("eye")
					   }
					   .padding(.horizontal, 30)
				    }
				    .padding(.horizontal)
				    .offset(y: -22)
				}
			 }
		  }
		  .background(
			 RoundedRectangle(cornerRadius: 8)
				.stroke(showError ? ColorConstants.Status.error : (isFocused ? ColorConstants.Text.secondary : ColorConstants.Text.secondary), lineWidth: 1)
		  )
	   }
    }
}
