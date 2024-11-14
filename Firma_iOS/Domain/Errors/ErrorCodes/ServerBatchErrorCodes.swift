//
//  ServerBatchErrorCodes.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 14/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

enum ServerBatchErrorCodes: String, Error {
    case invalidParamsPreSign = "800001"         // Parámetros enviados al servicio de prefirma no eran válidos
    case invalidParamsPostSign = "800002"        // Parámetros enviados al servicio de postfirma no eran válidos
    case communicationError = "800003"           // Error de comunicación con el servicio
    case preSignatureError = "800004"            // Datos de prefirma inválidos
    case postSignatureError = "800005"           // Datos de postfirma inválidos
    case invalidPresignUrl = "800006"            // URL de servicio de prefirma no válida
    case invalidPostsignUrl = "800007"           // URL de servicio de postfirma no válida
    case invalidDataOnSave = "800008"            // Datos recibidos al guardar en el servlet son inválidos
    case invalidSaveServletUrl = "800009"        // Ruta del servlet para guardar datos no es válida
    case invalidRetrieveServletUrl = "800010"    // Ruta del servlet para obtener datos no es válida
    case unknownServerError = "800011"           // Error desconocido en el servidor
    case invalidCertificate = "800012"           // Datos de certificado inválidos
    case missingSignatureAlgorithm = "800013"    // Falta el algoritmo de firma
    case unsupportedSignatureAlgorithm = "800014" // Algoritmo de firma no soportado

    static func getMessage(for code: ServerBatchErrorCodes) -> String {
	   switch code {
	   case .invalidParamsPreSign:
		  return "Los parámetros enviados al servicio de prefirma no eran válidos."
	   case .invalidParamsPostSign:
		  return "Los parámetros enviados al servicio de postfirma no eran válidos."
	   case .communicationError:
		  return "Error de comunicación con el servicio."
	   case .preSignatureError:
		  return "Los datos de prefirma recibidos son inválidos."
	   case .postSignatureError:
		  return "Los datos de postfirma recibidos son inválidos."
	   case .invalidPresignUrl:
		  return "La URL del servicio de prefirma de lotes no es válida."
	   case .invalidPostsignUrl:
		  return "La URL del servicio de postfirma de lotes no es válida."
	   case .invalidDataOnSave:
		  return "Los datos recibidos al guardar en el servlet son inválidos."
	   case .invalidSaveServletUrl:
		  return "La ruta del servlet para guardar datos no es válida."
	   case .invalidRetrieveServletUrl:
		  return "La ruta del servlet para obtener datos no es válida."
	   case .unknownServerError:
		  return "Error desconocido en el servidor."
	   case .invalidCertificate:
		  return "Los datos del certificado proporcionado son inválidos."
	   case .missingSignatureAlgorithm:
		  return "Falta el algoritmo de firma."
	   case .unsupportedSignatureAlgorithm:
		  return "Algoritmo de firma no soportado."
	   }
    }
}
