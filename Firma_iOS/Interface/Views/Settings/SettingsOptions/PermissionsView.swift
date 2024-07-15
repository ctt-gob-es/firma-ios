//
//  PermissionsView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 12/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct PermissionsView: View {
    @State private var isNfcEnabled: Bool = false
    
    var body: some View {
	   VStack {
		  Form {
			 Section {
				VStack {
				    Toggle(isOn: $isNfcEnabled) {
					   Text(NSLocalizedString("permissions_nfc_description",bundle: Bundle.main ,comment: ""))
						  .regularBoldStyle(foregroundColor: .black)
				    }
				    .toggleStyle(CustomToggleStyle())
				    
				    Divider()
				}
			 }
		  }
		  .background(Color.white)
		  .background {
			 Color.white
		  }
		  .scrollContentBackground(.hidden)
		  
		  Spacer()
		  
		  Button(action: {
			 // Acción para el botón guardar
		  }) {
			 Text(NSLocalizedString("permissions_button_title",bundle: Bundle.main ,comment: ""))
		  }
		  .buttonStyle(CustomButtonStyle(isEnabled: true))
		  .padding(.bottom, 20)
	   }
	   .background(Color.white.edgesIgnoringSafeArea(.all))
	   .navigationBarTitle(NSLocalizedString("permissions_title",bundle: Bundle.main ,comment: ""), displayMode: .inline)
    }
}

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
	   HStack {
		  configuration.label
		  Spacer()
		  Rectangle()
			 .foregroundColor(configuration.isOn ? Color(UIColor.white) : Color(UIColor.systemGray4))
			 .frame(width: 50, height: 30)
			 .overlay(
				Circle()
				    .foregroundColor(configuration.isOn ? Color(UIColor.black) : Color(UIColor.systemGray))
				    .padding(5)
				    .offset(x: configuration.isOn ? 10 : -10)
				    .animation(.easeInOut(duration: 0.2), value: configuration.isOn)
			 )
			 .overlay(
				RoundedRectangle(cornerRadius: 15)
				    .stroke(configuration.isOn ? Color(UIColor.black) : Color(UIColor.clear), lineWidth: 1)
			 )
			 .cornerRadius(15)
			 .onTapGesture {
				configuration.isOn.toggle()
			 }
	   }
    }
}
