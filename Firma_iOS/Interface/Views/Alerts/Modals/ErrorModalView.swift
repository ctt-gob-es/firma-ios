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
    var errorModalState: ErrorModalState
    
    var body: some View {
	   VStack(spacing: 10) {
		  ZStack {
			 if errorModalState.hasCloseButton {
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
				if let imageName = errorModalState.imageName {
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
			 AccessibleText(content: errorModalState.title)
				.titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
				.accessibilityAddTraits(.isHeader)
				.padding(.bottom)
			 
			 AccessibleText(content: errorModalState.description)
				.regularStyle(foregroundColor: ColorConstants.Text.secondary)
		  }
		  .frame(maxWidth: .infinity, alignment: .leading)
		  .padding(.horizontal)
		  
		  Spacer()
		  
		  VStack(spacing: 10) {
			 if errorModalState == .globalError{
				GlobalErrorButtons()
			 } else if errorModalState == .trackingError {
				TrackingErrorButtons()
			 }  else {
				if errorModalState.hasCancelButton {
				    Button(action: {
					   self.presentationMode.wrappedValue.dismiss()
				    }) {
					   AccessibleText(content: NSLocalizedString("cancel_button_title", bundle: Bundle.main, comment: ""))
						  .regularBoldStyle(foregroundColor: errorModalState == .certificateNeeded ? ColorConstants.Background.buttonEnabled : ColorConstants.Text.primary)
						  .underline()
				    }
				}
				
				Button(action: {
				    // Action for the main button
				}) {
				    if let buttonTitle = errorModalState.bottomButtonTitle {
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
	   .edgesIgnoringSafeArea(.all) // Ensure the modal fills the entire screen
    }
}

struct GlobalErrorButtons: View {
    var body: some View {
	   VStack(spacing: 8) {
		  Button(action: {
			 
		  }) {
			 AccessibleText(content: NSLocalizedString("retry_button_title", bundle: Bundle.main, comment: ""))
		  }
		  .buttonStyle(CustomButtonStyle(isEnabled: true))
		  
		  Button(action: {
			 
		  }) {
			 AccessibleText(content: NSLocalizedString("go_home_button_title", bundle: Bundle.main, comment: ""))
		  }
		  .buttonStyle(BorderedButtonStyle())
		  
	   }
    }
}

struct TrackingErrorButtons: View {
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

enum ErrorModalState {
    case certificateNeeded
    case certificateGenericError
    case certificateGenericErrorLong
    case certificateExpired
    case certificateRevoked
    case certificateNearExpiry
    
    case dniReadingError
    case dniBroken
    case dniReadingErrorLong
    case dniBlockedPin
    case dniIncorrectPin
    case dniExpired
    
    case globalError
    case trackingError
    
    var title: String {
	   switch self {
		  case .certificateNeeded:
			 return NSLocalizedString("certificate_needed_title", bundle: Bundle.main, comment: "")
		  case .certificateGenericError:
			 return NSLocalizedString("certificate_generic_error_title", bundle: Bundle.main, comment: "")
		  case .certificateGenericErrorLong:
			 return NSLocalizedString("certificate_generic_error_long_title", bundle: Bundle.main, comment: "")
		  case .certificateExpired:
			 return NSLocalizedString("certificate_expired_title", bundle: Bundle.main, comment: "")
		  case .certificateRevoked:
			 return NSLocalizedString("certificate_revoked_title", bundle: Bundle.main, comment: "")
		  case .certificateNearExpiry:
			 return NSLocalizedString("certificate_near_expiry_title", bundle: Bundle.main, comment: "")
		  case .dniReadingError:
			 return NSLocalizedString("dni_reading_error_title", bundle: Bundle.main, comment: "")
		  case .dniBroken:
			 return NSLocalizedString("dni_broken_title", bundle: Bundle.main, comment: "")
		  case .dniReadingErrorLong:
			 return NSLocalizedString("dni_reading_error_long_title", bundle: Bundle.main, comment: "")
		  case .dniBlockedPin:
			 return NSLocalizedString("dni_blocked_pin_title", bundle: Bundle.main, comment: "")
		  case .dniIncorrectPin:
			 return NSLocalizedString("dni_incorrect_pin_title", bundle: Bundle.main, comment: "")
		  case .dniExpired:
			 return NSLocalizedString("dni_expired_title", bundle: Bundle.main, comment: "")
		  case .globalError:
			 return NSLocalizedString("global_error_title", bundle: Bundle.main, comment: "")
		  case .trackingError:
			 return NSLocalizedString("tracking_error_title", bundle: Bundle.main, comment: "")
	   }
    }
    
    var description: String {
	   switch self {
		  case .certificateNeeded:
			 return NSLocalizedString("certificate_needed_description", bundle: Bundle.main, comment: "")
		  case .certificateGenericError:
			 return NSLocalizedString("certificate_generic_error_description", bundle: Bundle.main, comment: "")
		  case .certificateGenericErrorLong:
			 return NSLocalizedString("certificate_generic_error_long_description", bundle: Bundle.main, comment: "")
		  case .certificateExpired:
			 return NSLocalizedString("certificate_expired_description", bundle: Bundle.main, comment: "")
		  case .certificateRevoked:
			 return NSLocalizedString("certificate_revoked_description", bundle: Bundle.main, comment: "")
		  case .certificateNearExpiry:
			 return NSLocalizedString("certificate_near_expiry_description", bundle: Bundle.main, comment: "")
		  case .dniReadingError:
			 return NSLocalizedString("dni_reading_error_description", bundle: Bundle.main, comment: "")
		  case .dniBroken:
			 return NSLocalizedString("dni_broken_description", bundle: Bundle.main, comment: "")
		  case .dniReadingErrorLong:
			 return NSLocalizedString("dni_reading_error_long_description", bundle: Bundle.main, comment: "")
		  case .dniBlockedPin:
			 return NSLocalizedString("dni_blocked_pin_description", bundle: Bundle.main, comment: "")
		  case .dniIncorrectPin:
			 return NSLocalizedString("dni_incorrect_pin_description", bundle: Bundle.main, comment: "")
		  case .dniExpired:
			 return NSLocalizedString("dni_expired_description", bundle: Bundle.main, comment: "")
		  case .globalError:
			 return NSLocalizedString("global_error_description", bundle: Bundle.main, comment: "")
		  case .trackingError:
			 return NSLocalizedString("tracking_error_description", bundle: Bundle.main, comment: "")
	   }
    }
    
    var imageName: String? {
	   switch self {
		  case .certificateNeeded:
			 return "cross"
		  case .certificateGenericError, .certificateGenericErrorLong, .dniReadingError, .dniReadingErrorLong, .dniBroken, .dniBlockedPin, .dniIncorrectPin, .dniExpired:
			 return "warning"
		  case .certificateExpired, .certificateRevoked, .certificateNearExpiry, .globalError, .trackingError:
			 return "info_red"
	   }
    }
    
    var hasCloseButton: Bool {
	   switch self {
		  case .certificateGenericError, .certificateGenericErrorLong, .certificateExpired, .certificateRevoked, .certificateNearExpiry:
			 return true
		  case .certificateNeeded, .dniReadingError, .dniBroken, .dniReadingErrorLong, .dniBlockedPin, .dniIncorrectPin, .dniExpired, .globalError, .trackingError:
			 return false
	   }
    }
    
    var hasCancelButton: Bool {
	   switch self {
		  case .certificateGenericError, .certificateGenericErrorLong, .certificateExpired, .certificateRevoked, .certificateNearExpiry, .dniIncorrectPin, .globalError, .trackingError:
			 return false
		  case .certificateNeeded, .dniReadingError, .dniBroken, .dniReadingErrorLong, .dniBlockedPin, .dniExpired:
			 return true
	   }
    }
    
    var bottomButtonTitle: String? {
	   switch self {
		  case .certificateNeeded:
			 return NSLocalizedString("certificate_needed_button_title", bundle: Bundle.main, comment: "")
		  case .certificateGenericError, .certificateGenericErrorLong, .dniIncorrectPin:
			 return NSLocalizedString("generic_error_button_title", bundle: Bundle.main, comment: "")
		  case .certificateExpired, .certificateRevoked, .certificateNearExpiry:
			 return NSLocalizedString("accept_button_title", bundle: Bundle.main, comment: "")
		  case .dniReadingError, .dniBroken, .dniReadingErrorLong, .dniBlockedPin, .dniExpired:
			 return NSLocalizedString("retry_button_title", bundle: Bundle.main, comment: "")
		  case .globalError, .trackingError:
			 return nil
	   }
    }
    
    var action: () {
	   switch self {
		  case .certificateNeeded:
			 //TODO: implemenent Action
			 return
		  case .certificateGenericError:
			 //TODO: implemenent Action
			 return
		  case .certificateGenericErrorLong:
			 //TODO: implemenent Action
			 return
		  case .certificateExpired:
			 //TODO: implemenent Action
			 return
		  case .certificateRevoked:
			 //TODO: implemenent Action
			 return
		  case .certificateNearExpiry:
			 //TODO: implemenent Action
			 return
		  case .dniReadingError:
			 //TODO: implemenent Action
			 return
		  case .dniBroken:
			 //TODO: implemenent Action
			 return
		  case .dniReadingErrorLong:
			 //TODO: implemenent Action
			 return
		  case .dniBlockedPin:
			 //TODO: implemenent Action
			 return
		  case .dniIncorrectPin:
			 //TODO: implemenent Action
			 return
		  case .dniExpired:
			 //TODO: implemenent Action
			 return
		  case .globalError:
			 //TODO: implemenent Action
			 return
		  case .trackingError:
			 //TODO: implemenent Action
			 return
	   }
    }
}
