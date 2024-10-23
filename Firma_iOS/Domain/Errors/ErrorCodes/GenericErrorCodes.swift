//
//  GenericErrorCodes.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 16/10/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

enum GenericErrorCodes: Int {
    case networkError = 100       // Error related to network connectivity.
    case serverUnavailable = 101  // The server is down or unreachable.
    case unauthorized = 102       // Unauthorized access, such as invalid credentials.
    case invalidData = 103        // The provided data is not valid.
    case timeout = 104            // The request has timed out.
    case unknownError = 105       // An unknown error occurred.
    case parsingError = 106       // Error while parsing the data.
    case resourceNotFound = 107   // The requested resource could not be found.
    
    static func getMessage(for code: GenericErrorCodes) -> String {
	   switch code {
	   case .networkError:
		  return "Error related to network connectivity."
	   case .serverUnavailable:
		  return "The server is down or unreachable."
	   case .unauthorized:
		  return "Unauthorized access, please check your credentials."
	   case .invalidData:
		  return "The provided data is not valid."
	   case .timeout:
		  return "The request has timed out. Please try again."
	   case .unknownError:
		  return "An unknown error occurred. Please contact support."
	   case .parsingError:
		  return "Error while parsing the received data."
	   case .resourceNotFound:
		  return "The requested resource could not be found."
	   }
    }
}
