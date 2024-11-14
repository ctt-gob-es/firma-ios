//
//  ServerErrorCodes.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 7/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

enum ServerErrorCodes: String, ErrorCode {
    case missingOperation = "700001"
    case missingDocumentID = "700002"
    case missingSignatureAlgorithm = "700003"
    case missingSignatureFormat = "700004"
    case missingUserCertificate = "700005"
    case invalidAdditionalParamsFormat = "700006"
    case userCertificateNotX509 = "700007"
    case unsupportedSignatureFormat = "700008"
    case preSignatureError = "700009"
    case documentStorageError = "700010"
    case unknownOperation = "700011"
    case postSignatureError = "700012"
    case invalidSubOperation = "700013"
    case documentRetrievalError = "700014"
    case invalidSessionDataFormat = "700015"
    case verificationCodeGenerationError = "700016"
    case verificationCodeCheckError = "700017"
    case signatureIntegrityError = "700018"
    case invalidOperationDataFormat = "700019"
    case unsupportedSignatureAlgorithm = "700020"
    case userInterventionRequired = "700021"
    case communicationError = "700022"
    case invalidPresignUrl = "700023"
    case invalidPostsignUrl = "700024"
    case invalidDataOnSave = "700025"
    case invalidSaveServletUrl = "700026"
    case invalidRetrieveServletUrl = "700027"
    
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
		  case .communicationError:
			 return "Error de comunicación con el servicio."
		  case .invalidPresignUrl:
			 return "La URL del servicio de prefirma de lotes no es válida."
		  case .invalidPostsignUrl:
			 return "La URL del servicio de postfirma de lotes no es válida."
		  case .invalidDataOnSave:
			 return "Los datos recibidos al guardar en el servlet son inválidos."
		  case .invalidSaveServletUrl:
			 return "La ruta del Servlet para guardar datos es inválida."
		  case .invalidRetrieveServletUrl:
			 return "La ruta del Servlet para obtener datos es inválida."
	   }
    }
}
