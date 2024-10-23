//
//  InternalSoftwareErrorCodes.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 16/10/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

enum InternalSoftwareErrorCodes: String, ErrorCode {
    case generalSoftwareError = "200001"
    case signingError = "200101"
    case certificateSelectionError = "200201"
    case dataSavingError = "200301"
    case jsonBatchOperationError = "200401"
    case xmlBatchOperationError = "200501"
    case fileLoadingError = "200601"
    case appConfigurationError = "200701"
    case certificateImportError = "200801"
    case certificateManagementError = "200901"
    case fileLoadingErrorWeb = "201001"
    case certificateLoadingError = "201101"
    case localSignatureError = "201201"
    
    static func getMessage(for code: InternalSoftwareErrorCodes) -> String {
	   switch code {
	   case .generalSoftwareError:
		  return "Error general de software."
	   case .signingError:
		  return "Error en la operación de firma."
	   case .certificateSelectionError:
		  return "Error en la selección de certificados."
	   case .dataSavingError:
		  return "Error en la operación de guardado de datos."
	   case .jsonBatchOperationError:
		  return "Error en la operación de lotes JSON."
	   case .xmlBatchOperationError:
		  return "Error en la operación de lotes XML."
	   case .fileLoadingError:
		  return "Error en la carga de ficheros."
	   case .appConfigurationError:
		  return "Error en la configuración de la aplicación."
	   case .certificateImportError:
		  return "Error en la importación de certificados."
	   case .certificateManagementError:
		  return "Error en la gestión de certificados."
	   case .fileLoadingErrorWeb:
		  return "Error en la carga de ficheros web."
	   case .certificateLoadingError:
		  return "Error en la carga de certificados."
	   case .localSignatureError:
		  return "Error en la firma local."
	   }
    }
}
