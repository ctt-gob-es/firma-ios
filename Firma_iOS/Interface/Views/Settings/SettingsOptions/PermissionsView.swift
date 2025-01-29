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
    @State private var isSignatureVisible: Bool = false
    @State private var obfuscateUserIdentifiers: Bool = true
    @State private var showToast = false
    
    var body: some View {
		  VStack {
			 List {
				Section {
				    VStack(alignment: .leading) {
					   Toggle(isOn: $isNfcEnabled) {
						  AccessibleText(content: NSLocalizedString("permissions_nfc_description", bundle: Bundle.main, comment: ""))
							 .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
					   }
					   .toggleStyle(CustomToggleStyle())
					   
					   Divider()
					   
					   Toggle(isOn: $isSignatureVisible) {
						  AccessibleText(content: NSLocalizedString("permissions_signature_visible", bundle: Bundle.main, comment: ""))
							 .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
					   }
					   .toggleStyle(CustomToggleStyle())
					   
					   Divider()
					   
					   Toggle(isOn: $obfuscateUserIdentifiers) {
						  AccessibleText(content: NSLocalizedString("permissions_obfuscate_identifiers", bundle: Bundle.main, comment: ""))
							 .regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
					   }
					   .toggleStyle(CustomToggleStyle())
					   
					   Divider()
				    }
				}
				.frame(maxWidth: .infinity)
			 }
			 .scrollContentBackground(.hidden)
			 .frame(maxWidth: .infinity)
			 
			 Spacer()
			 
			 Button(action: {
				UserDefaults.standard.set(isNfcEnabled, forKey: "isNfcEnabled")
				UserDefaults.standard.set(isSignatureVisible, forKey: "isSignatureVisible")
				UserDefaults.standard.set(obfuscateUserIdentifiers, forKey: "obfuscateUserIdentifiers")
				
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
		  .frame(maxWidth: .infinity)
		  .background(Color.white.edgesIgnoringSafeArea(.all))
		  .navigationBarTitle(NSLocalizedString("permissions_title", bundle: Bundle.main, comment: ""), displayMode: .inline)
		  .onAppear {
			 isNfcEnabled = UserDefaults.standard.object(forKey: "isNfcEnabled") as? Bool ?? true
			 isSignatureVisible = UserDefaults.standard.object(forKey: "isSignatureVisible") as? Bool ?? true
			 obfuscateUserIdentifiers = UserDefaults.standard.object(forKey: "obfuscateUserIdentifiers") as? Bool ?? false
		  }
		  
		  if showToast {
			 ToastView(message: NSLocalizedString("nfc_permission_set", bundle: Bundle.main, comment: ""))
				.transition(.opacity)
				.animation(.easeInOut)
				.padding(.bottom, 50)
		  }
	   }
}

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
	   HStack(spacing: 0) {
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

struct PermissionsView_Previews: PreviewProvider {
    static var previews: some View {
	   PermissionsView()
    }
}
