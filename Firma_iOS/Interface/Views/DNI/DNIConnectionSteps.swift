//
//  ConnectionSteps.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 10/10/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

enum DNIConnectionSteps {
    case canStep
    case pinStep
    case nfcStep
    
    var step: Int {
	   switch self {
		  case .canStep:
			 return 1
		  case .pinStep:
			 return 2
		  case .nfcStep:
			 return 3
	   }
    }
    
    var title: String {
	   switch self {
		  case .canStep:
			 return NSLocalizedString("dni_connection_step_one_title", bundle: Bundle.main, comment: "")
		  case .pinStep:
			 return NSLocalizedString("dni_connection_step_two_title", bundle: Bundle.main, comment: "")
		  case .nfcStep:
			 return NSLocalizedString("dni_connection_step_three_title", bundle: Bundle.main, comment: "")
	   }
    }
    
    var buttonTitle: String {
	   switch self {
		  case .canStep:
			 return NSLocalizedString("dni_connection_step_one_button_title", bundle: Bundle.main, comment: "")
		  case .pinStep:
			 return NSLocalizedString("dni_connection_step_two_button_title", bundle: Bundle.main, comment: "")
		  case .nfcStep:
			 return NSLocalizedString("dni_connection_step_three_button_title", bundle: Bundle.main, comment: "")
	   }
    }
}
