//
//  ErrorHandlerUtils.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 25/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class ErrorHandlerUtils {
    static func getServerError(error: NSError) -> String {
	   guard let errorToSend = ErrorCodeFactory.createErrorCode(from: String(error.code)) else {
		  return "Unknown Error"
	   }
	   let errorMessage = ErrorGenerator.generateError(from: errorToSend).localizedDescription
	   return "ERR-\(error.code): \(errorMessage)"
    }
    
    static func chooseStateFromError(error: Error) -> ErrorModalState {
	   let nsError = error as NSError
	   let stringCode = String(nsError.code)
	   let errorCodeString = nsError.userInfo["ErrorCode"] as? String ?? stringCode
	   
	   if let hardwareError = HardwareErrorCodes(rawValue: errorCodeString) {
		  switch hardwareError {
			 case .generalHardwareError:
				return .globalError
			 case .nfcError, .nfcCardError:
				return .dniReadingError
			 case .sdCardError:
				return .dataNotImported
		  }
	   } else if let softwareError = InternalSoftwareErrorCodes(rawValue: errorCodeString) {
		  switch softwareError {
			 case .generalSoftwareError:
				return .globalError
			 case .signingError:
				return .certificateGenericError
			 case .certificateSelectionError:
				return .certificateGenericError
			 case .dataSavingError:
				return .dataNotImported
			 case .certificateManagementError:
				return .certificateNotImported
			 case .certificateLoadingError:
				return .certificateGenericErrorLong
			 case .localSignatureError:
				return .globalError
			 default:
				return .globalError
		  }
	   } else if let thirdPartyError = ThirdPartySoftwareErrorCodes(rawValue: errorCodeString) {
		  switch thirdPartyError {
			 case .generalThirdPartyError:
				return .globalError
			 case .jMulticardError:
				return .certificateGenericError
			 case .intermediateServerDownloadError, .intermediateServerUploadError:
				return .globalError
			 default:
				return .globalError
		  }
	   } else if let communicationError = CommunicationErrorCodes(rawValue: errorCodeString) {
		  switch communicationError {
			 case .generalCommunicationError:
				return .trackingError
			 case .signatureDownloadError, .signatureUploadError:
				return .globalError
			 case .certificateSelectionDownloadError, .certificateSelectionUploadError:
				return .certificateGenericError
			 default:
				return .globalError
		  }
	   } else if let functionalError = FunctionalErrorCodes(rawValue: errorCodeString) {
		  switch functionalError {
			 case .generalFunctionalError:
				return .globalError
			 case .userOperationCanceled:
				return .userCancelled
			 case .signatureOperationError:
				return .certificateGenericError
			 case .certificateSelectionOperationError:
				return .certificateGenericError
			 case .certificateNeeded:
				return .certificateNeeded
			 default:
				return .globalError
		  }
	   } else if let requestError = RequestErrorCodes(rawValue: errorCodeString) {
		  switch requestError {
			 case .generalRequestError:
				return .globalError
			 case .signatureRequestError:
				return .certificateGenericError
			 case .certificateSelectionRequestError:
				return .certificateGenericError
			 default:
				return .globalError
		  }
	   }
	   return .globalError
    }
}
