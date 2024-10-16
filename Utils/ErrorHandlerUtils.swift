//
//  ErrorHandlerUtils.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 25/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class ErrorHandlerUtils {
    //TODO: Error Handling
    static func getServerError(error: Error) -> String {
	   return error.localizedDescription
    }
    
    static func getErrorModalDescriptionFromError(error: Error) -> String {
	   return error.localizedDescription
    }
    
    static func chooseStateFromError(error: Error) -> ErrorModalState {
	   switch error {
		  default:
			 print(error)
			 return .globalError
	   }
    }
}
