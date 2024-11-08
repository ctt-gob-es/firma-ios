//
//  ErrorGenerator.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 16/10/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class ErrorGenerator {
    static func generateError<T: ErrorCode>(from code: T) -> NSError {
	   var errorMessage = "Unknown Error"
	   var errorDomain = ErrorDomain.general

	   if let hardwareError = code as? HardwareErrorCodes {
		  errorMessage = HardwareErrorCodes.getMessage(for: hardwareError)
		  errorDomain = ErrorDomain.hardware
	   } else if let softwareError = code as? InternalSoftwareErrorCodes {
		  errorMessage = InternalSoftwareErrorCodes.getMessage(for: softwareError)
		  errorDomain = ErrorDomain.software
	   } else if let thirdPartyError = code as? ThirdPartySoftwareErrorCodes {
		  errorMessage = ThirdPartySoftwareErrorCodes.getMessage(for: thirdPartyError)
		  errorDomain = ErrorDomain.thirdParty
	   } else if let communicationError = code as? CommunicationErrorCodes {
		  errorMessage = CommunicationErrorCodes.getMessage(for: communicationError)
		  errorDomain = ErrorDomain.communication
	   } else if let functionalError = code as? FunctionalErrorCodes {
		  errorMessage = FunctionalErrorCodes.getMessage(for: functionalError)
		  errorDomain = ErrorDomain.functional
	   } else if let requestError = code as? RequestErrorCodes {
		  errorMessage = RequestErrorCodes.getMessage(for: requestError)
		  errorDomain = ErrorDomain.request
	   }  else if let requestError = code as? DNIeErrorCodes {
		  errorMessage = DNIeErrorCodes.getMessage(for: requestError)
		  errorDomain = ErrorDomain.dnie
	   }  else if let requestError = code as? ServerErrorCodes {
		  errorMessage = ServerErrorCodes.getMessage(for: requestError)
		  errorDomain = ErrorDomain.server
	   }

	   let userInfo = [NSLocalizedDescriptionKey: errorMessage]
	   return NSError(domain: errorDomain, code: Int(code.rawValue) ?? 0, userInfo: userInfo)
    }
    
    static func generateServerError(from errorString: String) -> NSError {
	   guard let errorCode = ServerErrorCodes(rawValue: errorString) else {
		  let errorMessage = "Unknown Server Error"
		  let userInfo = [NSLocalizedDescriptionKey: errorMessage]
		  return NSError(domain: ErrorDomain.server, code: 0, userInfo: userInfo)
	   }
	   let errorMessage = ServerErrorCodes.getMessage(for: errorCode)
	   let userInfo = [NSLocalizedDescriptionKey: errorMessage]
	   
	   return NSError(domain: ErrorDomain.server, code: Int(errorCode.rawValue) ?? 0, userInfo: userInfo)
    }
}
