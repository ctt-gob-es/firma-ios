//
//  DNIeErrorCodes.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 15/10/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

enum DNIeErrorCodes: Int {
    case invalidCard = 1          // La tarjeta identificada en el lector es desconocida o no está soportada.
    case burnedCard = 2           // La tarjeta está corrompida, pudo haber ocurrido por un ataque o problemas de tensión.
    case connectionError = 3      // No se ha podido conectar con la tarjeta.
    case notInitialized = 4       // La conexión con la tarjeta no está inicializada.
    case operationError = 5       // Ocurrió un error inesperado durante la operación.
    case badPin = 6               // PIN incorrecto.
    case lockedCard = 7           // Tarjeta bloqueada.
    case pinError = 8             // Error durante la validación del PIN.
    case badCan = 9               // Error durante la validación del CAN.
    case severeError = 10         // Error durante la validación del CAN.
    
    static func getMessage(for code: DNIeErrorCodes) -> String {
	   switch code {
	   case .invalidCard:
		  return "La tarjeta identificada en el lector es desconocida o no está soportada."
	   case .burnedCard:
		  return "La tarjeta está corrompida, posiblemente se autodestruyó."
	   case .connectionError:
		  return "No se ha podido conectar con la tarjeta."
	   case .notInitialized:
		  return "La conexión con la tarjeta no está inicializada."
	   case .operationError:
		  return "Ocurrió un error inesperado durante la operación."
	   case .badPin:
		  return "PIN incorrecto."
	   case .lockedCard:
		  return "Tarjeta bloqueada."
	   case .pinError:
		  return "Error durante la validación del PIN."
	   case .badCan:
		  return "Error durante la validación del CAN."
	   case .severeError:
		  return "Error genérico durante la comunicación con el DNIe"
	   }
    }
}
