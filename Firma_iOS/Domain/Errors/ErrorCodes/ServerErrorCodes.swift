//
//  ServerErrorCodes.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 7/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

enum ServerErrorCodes: String, ErrorCode {
    case missingOperation = "ERR-1"
    case missingDocumentID = "ERR-2"
    case missingSignatureAlgorithm = "ERR-3"
    case missingSignatureFormat = "ERR-4"
    case missingUserCertificate = "ERR-5"
    case invalidAdditionalParamsFormat = "ERR-6"
    case userCertificateNotX509 = "ERR-7"
    case unsupportedSignatureFormat = "ERR-8"
    case preSignatureError = "ERR-9"
    case documentStorageError = "ERR-10"
    case unknownOperation = "ERR-11"
    case postSignatureError = "ERR-12"
    case invalidSubOperation = "ERR-13"
    case documentRetrievalError = "ERR-14"
    case invalidSessionDataFormat = "ERR-15"
    case verificationCodeGenerationError = "ERR-16"
    case verificationCodeCheckError = "ERR-17"
    case signatureIntegrityError = "ERR-18"
    case invalidOperationDataFormat = "ERR-19"
    case unsupportedSignatureAlgorithm = "ERR-20"
    case userInterventionRequired = "ERR-21"
    
    static func getMessage(for code: ServerErrorCodes) -> String {
	   switch code {
	   case .missingOperation:
		  return "No se ha indicado la operación a realizar."
	   case .missingDocumentID:
		  return "No se ha indicado el identificador del documento."
	   case .missingSignatureAlgorithm:
		  return "No se ha indicado el algoritmo de firma."
	   case .missingSignatureFormat:
		  return "No se ha indicado el formato de firma."
	   case .missingUserCertificate:
		  return "No se ha indicado el certificado de usuario."
	   case .invalidAdditionalParamsFormat:
		  return "El formato de los parámetros adicionales suministrados es erróneo."
	   case .userCertificateNotX509:
		  return "El certificado de usuario no está en formato X.509."
	   case .unsupportedSignatureFormat:
		  return "Formato de firma no soportado."
	   case .preSignatureError:
		  return "Error realizando la prefirma."
	   case .documentStorageError:
		  return "Error al almacenar el documento."
	   case .unknownOperation:
		  return "Operación desconocida."
	   case .postSignatureError:
		  return "Error realizando la postfirma."
	   case .invalidSubOperation:
		  return "No se indicó una sub-operación válida a realizar (firma, cofirma, etc.)."
	   case .documentRetrievalError:
		  return "Error al recuperar el documento."
	   case .invalidSessionDataFormat:
		  return "El formato de los datos de sesión suministrados es erróneo."
	   case .verificationCodeGenerationError:
		  return "Error al generar el código de verificación de las firmas."
	   case .verificationCodeCheckError:
		  return "Error al comprobar el código de verificación de las firmas."
	   case .signatureIntegrityError:
		  return "Error de integridad en la firma."
	   case .invalidOperationDataFormat:
		  return "El formato de los datos de operación suministrados es erróneo."
	   case .unsupportedSignatureAlgorithm:
		  return "Algoritmo de firma no soportado."
	   case .userInterventionRequired:
		  return "Se requiere intervención del usuario."
	   }
    }
}
