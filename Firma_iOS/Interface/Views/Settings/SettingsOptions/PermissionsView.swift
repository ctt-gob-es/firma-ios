//
//  PermissionsView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 12/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct PermissionsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isNfcEnabled: Bool = true
    @State private var showToast = false
    
    var body: some View {
	   ZStack {
		  VStack {
			 Form {
				Section {
				    VStack {
					   Toggle(isOn: $isNfcEnabled) {
						  AccessibleText(content: NSLocalizedString("permissions_nfc_description", bundle: Bundle.main, comment: ""))
							 .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
					   }
					   .toggleStyle(CustomToggleStyle())
					   
					   Divider()
				    }
				}
			 }
			 .background(Color.white)
			 .scrollContentBackground(.hidden)
			 
			 Spacer()
			 
			 Button(action: {
				UserDefaults.standard.set(isNfcEnabled, forKey: "isNfcEnabled")
				showToast = true
				
				DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
				    showToast = false
				    self.presentationMode.wrappedValue.dismiss()
				}
			 }) {
				AccessibleText(content: NSLocalizedString("permissions_button_title", bundle: Bundle.main, comment: ""))
			 }
			 .buttonStyle(CustomButtonStyle(isEnabled: true))
			 .padding(.bottom, 20)
		  }
		  .background(Color.white.edgesIgnoringSafeArea(.all))
		  .navigationBarTitle(NSLocalizedString("permissions_title", bundle: Bundle.main, comment: ""), displayMode: .inline)
		  .onAppear {
			 if let savedValue = UserDefaults.standard.object(forKey: "isNfcEnabled") as? Bool {
				isNfcEnabled = savedValue
			 } else {
				isNfcEnabled = true
			 }
		  }
		  
		  if showToast {
			 ToastView(message: NSLocalizedString("nfc_permission_set", bundle: Bundle.main, comment: ""))
				.transition(.opacity)
				.animation(.easeInOut)
				.padding(.bottom, 50)
		  }
	   }
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

struct PermissionsView_Previews: PreviewProvider {
    static var previews: some View {
	   PermissionsView()
    }
}
