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
	   return "\(error.code): \(errorMessage)"
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
				return .globalError
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
	   } else if let dnieError = DNIeErrorCodes(rawValue: errorCodeString) {
		  switch dnieError {
			 case .invalidCard:
				return .dniBroken
			 case .burnedCard:
				return .dniBroken
			 case .connectionError:
				return .dniReadingError
			 case .notInitialized:
				return .dniReadingError
			 case .operationError:
				return .dniReadingError
			 case .badPin:
				return .dniIncorrectPin
			 case .lockedCard:
				return .dniBlockedPin
			 case .pinError:
				return .dniIncorrectPin
			 case .badCan:
				return .dniIncorrectCan
			 case .severeError:
				return .globalError
			 case .noCertAvailable:
				return .globalError
		  }
	   } else if let serverError = ServerErrorCodes(rawValue: errorCodeString) {
		  switch serverError {
			 case .missingOperation:
				return .globalError
			 case .missingDocumentID:
				return .globalError
			 case .missingSignatureAlgorithm:
				return .globalError
			 case .missingSignatureFormat:
				return .globalError
			 case .missingUserCertificate:
				return .globalError
			 case .invalidAdditionalParamsFormat:
				return .globalError
			 case .userCertificateNotX509:
				return .globalError
			 case .unsupportedSignatureFormat:
				return .globalError
			 case .preSignatureError:
				return .globalError
			 case .documentStorageError:
				return .globalError
			 case .unknownOperation:
				return .globalError
			 case .postSignatureError:
				return .globalError
			 case .invalidSubOperation:
				return .globalError
			 case .documentRetrievalError:
				return .globalError
			 case .invalidSessionDataFormat:
				return .globalError
			 case .verificationCodeGenerationError:
				return .globalError
			 case .verificationCodeCheckError:
				return .globalError
			 case .signatureIntegrityError:
				return .globalError
			 case .invalidOperationDataFormat:
				return .globalError
			 case .unsupportedSignatureAlgorithm:
				return .globalError
			 case .userInterventionRequired:
				return .globalError
			 case .communicationError:
				return .globalError
			 case .invalidPresignUrl:
				return .globalError
			 case .invalidPostsignUrl:
				return .globalError
			 case .invalidDataOnSave:
				return .globalError
			 case .invalidSaveServletUrl:
				return .globalError
			 case .invalidRetrieveServletUrl:
				return .globalError
		  }
	   }
	   return .globalError
    }
}
