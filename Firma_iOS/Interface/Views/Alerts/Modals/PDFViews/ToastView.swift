//
//  ToastView.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 12/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI

struct ToastView: View {
    var message: String
    
    var body: some View {
	   Text(message)
		  .padding()
		  .background(Color.black.opacity(0.8))
		  .foregroundColor(.white)
		  .cornerRadius(10)
		  .shadow(radius: 10)
		  .transition(.opacity)
		  .animation(.easeInOut)
    }
}
