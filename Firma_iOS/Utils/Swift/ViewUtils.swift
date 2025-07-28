//
//  ViewUtils.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 18/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

struct DismissKeyboardOnTap: ViewModifier {
    func body(content: Content) -> some View {
	   content
		  .background(
			 Color.clear
				.contentShape(Rectangle())
				.onTapGesture {
				    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
				}
		  )
    }
}

extension View {
    func dismissKeyboardOnTap() -> some View {
	   self.modifier(DismissKeyboardOnTap())
    }
}
