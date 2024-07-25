//
//  ErrorHandlerUtils.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 25/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class ErrorHandlerUtils {
    static func getErrorModalDescriptionFromError(error: Error) -> String{
	   //TODO: Set the description of the modal acordingly
	   
	   if error.localizedDescription.contains("") {
		  return ""
	   } else if error.localizedDescription.contains(""){
		  return ""
	   } else {
		  //IF we return an empty string the text will be set via default of the modal type
		  return ""
	   }
    }
}
