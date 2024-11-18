//
//  ErrorModalState.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 18/10/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

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
    case dniIncorrectCan
    case dniExpired
    
    case globalError
    case trackingError
    
    case jailbreakError
    case updateError
    
    case certificateNotImported
    
    case dataNotImported
    
    case userCancelled
    
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
		  case .dniIncorrectCan:
			 return NSLocalizedString("dni_incorrect_can_title", bundle: Bundle.main, comment: "")
		  case .dniExpired:
			 return NSLocalizedString("dni_expired_title", bundle: Bundle.main, comment: "")
		  case .globalError:
			 return NSLocalizedString("global_error_title", bundle: Bundle.main, comment: "")
		  case .trackingError:
			 return NSLocalizedString("tracking_error_title", bundle: Bundle.main, comment: "")
		  case .jailbreakError:
			 return NSLocalizedString("jailbreak_error_title", bundle: Bundle.main, comment: "")
		  case .updateError:
			 return NSLocalizedString("update_error_title", bundle: Bundle.main, comment: "")
		  case .certificateNotImported:
			 return NSLocalizedString("importing_certificate_error_title", bundle: Bundle.main, comment: "")
		  case .dataNotImported:
			 return NSLocalizedString("importing_data_error_title", bundle: Bundle.main, comment: "")
		  case .userCancelled:
			 return NSLocalizedString("user_cancelled_error_title", bundle: Bundle.main, comment: "")
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
		  case .dniIncorrectCan:
			 return NSLocalizedString("dni_incorrect_can_description", bundle: Bundle.main, comment: "")
		  case .dniExpired:
			 return NSLocalizedString("dni_expired_description", bundle: Bundle.main, comment: "")
		  case .globalError:
			 return NSLocalizedString("global_error_description", bundle: Bundle.main, comment: "")
		  case .trackingError:
			 return NSLocalizedString("tracking_error_description", bundle: Bundle.main, comment: "")
		  case .jailbreakError:
			 return NSLocalizedString("jailbreak_error_description", bundle: Bundle.main, comment: "")
		  case .updateError:
			 return NSLocalizedString("update_error_description", bundle: Bundle.main, comment: "")
		  case .certificateNotImported:
			 return NSLocalizedString("importing_certificate_error_description", bundle: Bundle.main, comment: "")
		  case .dataNotImported:
			 return NSLocalizedString("importing_data_error_description", bundle: Bundle.main, comment: "")
		  case .userCancelled:
			 return NSLocalizedString("user_cancelled_error_description", bundle: Bundle.main, comment: "")
	   }
    }
    
    var imageName: String? {
	   switch self {
		  case .certificateNeeded, .certificateNotImported, .dataNotImported:
			 return "cross"
		  case .certificateGenericError, .certificateGenericErrorLong, .dniReadingError, .dniReadingErrorLong, .dniBroken, .dniBlockedPin, .dniIncorrectPin, .dniIncorrectCan, .dniExpired, .jailbreakError, .userCancelled:
			 return "warning"
		  case .certificateExpired, .certificateRevoked, .certificateNearExpiry, .globalError, .trackingError:
			 return "info_red"
		  case .updateError:
			 return "reload"
	   }
    }
    
    var hasCloseButton: Bool {
	   switch self {
		  case .certificateGenericError, .certificateGenericErrorLong, .certificateExpired, .certificateRevoked, .certificateNearExpiry:
			 return true
		  case .certificateNeeded, .dniReadingError, .dniBroken, .dniReadingErrorLong, .dniBlockedPin, .dniIncorrectPin,.dniIncorrectCan , .dniExpired, .globalError, .trackingError, .jailbreakError, .updateError, .certificateNotImported, .dataNotImported, .userCancelled:
			 return false
	   }
    }
    
    var hasCancelButton: Bool {
	   switch self {
		  case .certificateNeeded, .certificateGenericError, .certificateGenericErrorLong, .certificateExpired, .certificateRevoked, .certificateNearExpiry, .dniIncorrectPin, .globalError, .trackingError, .jailbreakError, .updateError, .userCancelled:
			 return false
		  case .dniReadingError, .dniBroken, .dniReadingErrorLong, .dniBlockedPin,.dniIncorrectCan, .dniExpired, .certificateNotImported, .dataNotImported:
			 return true
	   }
    }
    
    var bottomButtonTitle: String? {
	   switch self {
		  case .certificateGenericError, .certificateGenericErrorLong, .dniIncorrectPin:
			 return NSLocalizedString("generic_error_button_title", bundle: Bundle.main, comment: "")
		  case .certificateExpired, .certificateRevoked, .certificateNearExpiry, .userCancelled, .certificateNeeded:
			 return NSLocalizedString("accept_button_title", bundle: Bundle.main, comment: "")
		  case .dniReadingError, .dniBroken, .dniReadingErrorLong, .dniBlockedPin,.dniIncorrectCan, .dniExpired, .certificateNotImported, .dataNotImported:
			 return NSLocalizedString("retry_button_title", bundle: Bundle.main, comment: "")
		  case .globalError, .trackingError, .updateError, .jailbreakError:
			 return nil
	   }
    }
    
    var action: () {
	   //TODO: implemenent Action
	   switch self {
		  default:
			 return
	   }
    }
}
