//
//  ErrorDomain.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 16/10/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

struct ErrorDomain {
    static let ai = "AI"
    static let hardware = "es.autofirma.AI.hardware"
    static let software = "es.autofirma.AI.software"
    static let thirdParty = "es.autofirma.AI.thirdparty"
    static let communication = "es.autofirma.AI.communication"
    static let functional = "es.autofirma.AI.functional"
    static let request = "es.autofirma.AI.request"
    static let dnie = "es.autofirma.AI.dnie"
    static let general = "es.autofirma.AI"
    static let server = "es.autofirma.AI.server"
}

protocol ErrorCode: RawRepresentable where RawValue == String {}

class ErrorCodeFactory {
    static func createErrorCode(from code: String) -> (any ErrorCode)? {
	   if let hardwareError = HardwareErrorCodes(rawValue: code) {
		  return hardwareError
	   } else if let softwareError = InternalSoftwareErrorCodes(rawValue: code) {
		  return softwareError
	   } else if let thirdPartyError = ThirdPartySoftwareErrorCodes(rawValue: code) {
		  return thirdPartyError
	   } else if let communicationError = CommunicationErrorCodes(rawValue: code) {
		  return communicationError
	   } else if let functionalError = FunctionalErrorCodes(rawValue: code) {
		  return functionalError
	   } else if let requestError = RequestErrorCodes(rawValue: code) {
		  return requestError
	   } else if let requestError = DNIeErrorCodes(rawValue: code) {
		  return requestError
	   } else if let requestError = ServerErrorCodes(rawValue: code) {
		  return requestError
	   }
	   return nil
    }
}
