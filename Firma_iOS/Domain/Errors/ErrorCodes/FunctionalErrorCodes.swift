//
//  FunctionalErrorCodes.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 16/10/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

enum FunctionalErrorCodes: String, ErrorCode {
    case generalFunctionalError = "500000"
    case userOperationCanceled = "500001"
    case signatureOperationError = "501001"
    case certificateSelectionOperationError = "502001"
    case dataSavingOperationError = "503001"
    case jsonBatchOperationError = "504001"
    case certificateNeeded = "505001"
    
    static func getMessage(for code: FunctionalErrorCodes) -> String {
	   switch code {
	   case .generalFunctionalError:
		  return "Error funcional general."
	   case .userOperationCanceled:
		  return "Operación cancelada por el usuario."
	   case .signatureOperationError:
		  return "Error en la operación de firma."
	   case .certificateSelectionOperationError:
		  return "Error en la operación de selección de certificados."
	   case .dataSavingOperationError:
		  return "Error en la operación de guardado de datos."
	   case .jsonBatchOperationError:
		  return "Error en la operación de lotes JSON."
	   case .certificateNeeded:
		  return "Error en la operación, no hay certificados"
	   }
    }
}
