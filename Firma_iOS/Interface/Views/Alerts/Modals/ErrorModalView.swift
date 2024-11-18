//
//  ErrorModalView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 16/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI

struct ErrorModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var viewMode: ViewModes
    @Binding var description: String
    @Binding var shouldReloadParentView: Bool
    
    var errorInfo: ErrorInfo
    
    var body: some View {
	   VStack(spacing: 10) {
		  ZStack {
                if errorInfo.errorModalType.hasCloseButton {
				HStack(alignment: .top) {
				    Spacer()
				    Button(action: {
					   self.presentationMode.wrappedValue.dismiss()
				    }) {
					   ExitButton()
				    }
				}
				.offset(y: -15)
			 }
			 
			 HStack {
                    if let imageName = errorInfo.errorModalType.imageName {
				    Image(imageName)
					   .resizable()
					   .scaledToFit()
					   .frame(width: 64, height: 64)
					   .padding(.horizontal)
				}
				
				Spacer()
			 }
			 .padding(.top)
		  }
		  
		  VStack(alignment: .leading, spacing: 10) {
			 AccessibleText(content: errorInfo.screenErrorTitle)
				.titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
				.accessibilityAddTraits(.isHeader)
				.padding(.bottom)
			 
                AccessibleText(content: description == "" ? errorInfo.screenErrorMessage : description)
				.regularStyle(foregroundColor: ColorConstants.Text.secondary)
		  }
		  .frame(maxWidth: .infinity, alignment: .leading)
		  .padding(.horizontal)
		  
		  Spacer()
		  
		  VStack(spacing: 10) {
			 if errorInfo.errorModalType == .globalError{
				GlobalErrorButtons(
				    viewMode: $viewMode,
				    shouldReload: $shouldReloadParentView
				)
			 } else if errorInfo.errorModalType == .trackingError {
				TrackingErrorButtons(
				    viewMode: $viewMode
				)
			 } else if errorInfo.errorModalType == .jailbreakError {
				JailbreakErrorButtons(
				    viewMode: $viewMode
				)
			 } else if errorInfo.errorModalType == .updateError {
				UpdateErrorButtons(
				    viewMode: $viewMode
				)
			 }  else {
				if errorInfo.errorModalType.hasCancelButton {
				    Button(action: {
					   self.viewMode = .home
					   DispatchQueue.main.async {
						  NotificationCenter.default.post(name: .ErrorModalCancelButtonAction, object: nil, userInfo: nil)
					   }
					   self.presentationMode.wrappedValue.dismiss()
				    }) {
					   AccessibleText(content: NSLocalizedString("cancel_button_title", bundle: Bundle.main, comment: ""))
						  .regularBoldStyle(foregroundColor: errorInfo.errorModalType == .certificateNeeded ? ColorConstants.Background.buttonEnabled : ColorConstants.Text.primary)
						  .underline()
				    }
				}
				
				Button(action: {
				    self.presentationMode.wrappedValue.dismiss()
				}) {
				    if let buttonTitle = errorInfo.errorModalType.bottomButtonTitle {
					   AccessibleText(content: buttonTitle)
				    }
				}
				.buttonStyle(CustomButtonStyle(isEnabled: true))
			 }
		  }
		  .padding(.bottom)
	   }
	   .background(Color.white)
	   .cornerRadius(10)
	   .edgesIgnoringSafeArea(.all)
    }
}

struct GlobalErrorButtons: View {
    @Binding var viewMode: ViewModes
    @Binding var shouldReload: Bool
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
	   VStack(spacing: 8) {
		  Button(action: {
			 DispatchQueue.main.async {
				viewMode = .home
                    shouldReload = false
			 }
			 self.presentationMode.wrappedValue.dismiss()
		  }) {
			 AccessibleText(content: NSLocalizedString("go_home_button_title", bundle: Bundle.main, comment: ""))
		  }
		  .buttonStyle(BorderedButtonStyle())
		  
	   }
    }
}

struct TrackingErrorButtons: View {
    @Binding var viewMode: ViewModes
    var body: some View {
	   VStack(spacing: 8) {
		  Button(action: {
			 
		  }) {
			 AccessibleText(content: NSLocalizedString("enable_button_title", bundle: Bundle.main, comment: ""))
		  }
		  .buttonStyle(CustomButtonStyle(isEnabled: true))
		  
		  Button(action: {
			 
		  }) {
			 AccessibleText(content: NSLocalizedString("disable_button_title", bundle: Bundle.main, comment: ""))
		  }
		  .buttonStyle(BorderedButtonStyle())
		  
	   }
    }
}

struct JailbreakErrorButtons: View {
    @Binding var viewMode: ViewModes
    var body: some View {
	   VStack(spacing: 8) {
		  Button(action: {
			 
		  }) {
			 AccessibleText(content: NSLocalizedString("close_app_button_title", bundle: Bundle.main, comment: ""))
		  }
		  .buttonStyle(CustomButtonStyle(isEnabled: true))
	   }
    }
}

struct UpdateErrorButtons: View {
    @Binding var viewMode: ViewModes
    var body: some View {
	   VStack(spacing: 8) {
		  Button(action: {
			
		  }) {
			 AccessibleText(content: NSLocalizedString("omit_button_title", bundle: Bundle.main, comment: ""))
				.regularBoldStyle(foregroundColor: ColorConstants.Text.primary)
				.underline()
		  }
		  
		  Button(action: {
			 
		  }) {
			 AccessibleText(content: NSLocalizedString("update_button_title", bundle: Bundle.main, comment: ""))
		  }
		  .buttonStyle(CustomButtonStyle(isEnabled: true))
	   }
    }
}

extension Notification.Name {
    static let ErrorModalCancelButtonAction = Notification.Name("CancelButtonAction")
}
