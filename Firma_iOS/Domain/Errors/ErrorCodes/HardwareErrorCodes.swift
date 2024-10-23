//
//  HardwareErrorCodes.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 16/10/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

enum HardwareErrorCodes: String, ErrorCode {
    case generalHardwareError = "100001"
    case nfcError = "101001"
    case nfcCardError = "102001"
    case sdCardError = "103001"
    
    static func getMessage(for code: HardwareErrorCodes) -> String {
	   switch code {
	   case .generalHardwareError:
		  return "Error general de hardware."
	   case .nfcError:
		  return "Error relacionado con el dispositivo NFC."
	   case .nfcCardError:
		  return "Error en la tarjeta NFC."
	   case .sdCardError:
		  return "Error en la tarjeta SD criptográfica."
	   }
    }
}
