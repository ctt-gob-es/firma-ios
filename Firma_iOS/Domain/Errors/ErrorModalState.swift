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
    case dniTimeoutError
    case dniCanceledSession
    case dniBlockedPin
    case dniIncorrectPin
    case dniIncorrectCan
    case dniExpired
    
    case fileSelectedNoPDF
    
    case globalError
    case trackingError
    
    case jailbreakError
    case updateError
    
    case fileSignNotLoad
    case certificateNotImported
    
    case dataNotImported
    
    case userCancelled
    case userCancelledSave
    
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
		  case .dniReadingErrorLong, .dniTimeoutError, .dniCanceledSession:
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
            case .userCancelledSave:
                return NSLocalizedString("user_cancelled_save_error_title", bundle: Bundle.main, comment: "")
            case .fileSelectedNoPDF:
                return NSLocalizedString("file_not_pdf_title", bundle: Bundle.main, comment: "")
            case .fileSignNotLoad:
                return NSLocalizedString("file_load_error_title", bundle: Bundle.main, comment: "")
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
            case .dniCanceledSession:
                return NSLocalizedString("dni_canceled_session_description", bundle: Bundle.main, comment: "")
		  case .dniBroken:
			 return NSLocalizedString("dni_broken_description", bundle: Bundle.main, comment: "")
		  case .dniReadingErrorLong:
			 return NSLocalizedString("dni_reading_error_long_description", bundle: Bundle.main, comment: "")
            case .dniTimeoutError:
                return NSLocalizedString("dni_reading_error_timeout_description", bundle: Bundle.main, comment: "")
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
            case .userCancelledSave:
                return NSLocalizedString("user_cancelled_save_error_description", bundle: Bundle.main, comment: "")
            case .fileSelectedNoPDF:
                return NSLocalizedString("file_not_pdf_description", bundle: Bundle.main, comment: "")
            case .fileSignNotLoad:
                return NSLocalizedString("file_sign_load_error_description", bundle: Bundle.main, comment: "")
	   }
    }
    
    var imageName: String? {
	   switch self {
		  case .certificateNeeded, .certificateNotImported, .dataNotImported:
			 return "cross"
            case .certificateGenericError, .certificateGenericErrorLong, .dniReadingError, .dniCanceledSession, .dniReadingErrorLong, .dniTimeoutError, .dniBroken, .dniBlockedPin, .dniIncorrectPin, .dniIncorrectCan, .dniExpired, .jailbreakError, .userCancelled, .userCancelledSave:
			 return "warning"
            case .certificateExpired, .certificateRevoked, .certificateNearExpiry, .globalError, .trackingError, .fileSelectedNoPDF, .fileSignNotLoad:
			 return "info_red"
		  case .updateError:
			 return "reload"
	   }
    }
    
    var hasCloseButton: Bool {
	   switch self {
		  case .certificateGenericError, .certificateGenericErrorLong, .certificateExpired, .certificateRevoked, .certificateNearExpiry:
			 return true
        case .certificateNeeded, .dniReadingError, .dniBroken, .dniReadingErrorLong, .dniTimeoutError, .dniBlockedPin, .dniIncorrectPin, .dniIncorrectCan, .dniExpired, .globalError, .trackingError, .jailbreakError, .updateError, .certificateNotImported, .dataNotImported, .userCancelled, .userCancelledSave, .dniCanceledSession, .fileSelectedNoPDF, .fileSignNotLoad:
			 return false
	   }
    }
    
    var hasCancelButton: Bool {
	   switch self {
        case .certificateNeeded, .certificateGenericError, .certificateGenericErrorLong, .certificateExpired, .certificateRevoked, .certificateNearExpiry, .dniIncorrectPin, .globalError, .trackingError, .jailbreakError, .updateError, .userCancelled, .userCancelledSave, .dniCanceledSession, .fileSignNotLoad:
			 return false
		  case .dniReadingError, .dniBroken, .dniReadingErrorLong, .dniTimeoutError, .dniBlockedPin,.dniIncorrectCan, .dniExpired, .certificateNotImported, .dataNotImported, .fileSelectedNoPDF:
			 return true
	   }
    }
    
    var bottomButtonTitle: String? {
	   switch self {
		  case .certificateGenericError, .certificateGenericErrorLong, .dniIncorrectPin:
			 return NSLocalizedString("generic_error_button_title", bundle: Bundle.main, comment: "")
		  case .certificateExpired, .certificateRevoked, .certificateNearExpiry, .userCancelled, .userCancelledSave, .certificateNeeded:
			 return NSLocalizedString("accept_button_title", bundle: Bundle.main, comment: "")
            case .dniReadingError, .dniBroken, .dniReadingErrorLong, .dniTimeoutError, .dniBlockedPin,.dniIncorrectCan, .dniExpired, .certificateNotImported, .dataNotImported, .dniCanceledSession, .fileSelectedNoPDF:
			 return NSLocalizedString("retry_button_title", bundle: Bundle.main, comment: "")
            case .globalError, .trackingError, .updateError, .jailbreakError, .fileSignNotLoad:
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
