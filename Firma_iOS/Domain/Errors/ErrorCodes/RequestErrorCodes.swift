//
//  RequestErrorCodes.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 16/10/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

enum RequestErrorCodes: String, ErrorCode {
    case generalRequestError = "600001"
    case signatureRequestError = "600101"
    case certificateSelectionRequestError = "600201"
    case dataSavingRequestError = "600301"
    case jsonBatchRequestError = "600401"
    case xmlBatchRequestError = "600501"
    case fileLoadingRequestError = "600601"
    
    static func getMessage(for code: RequestErrorCodes) -> String {
	   switch code {
	   case .generalRequestError:
		  return "Error general de petición."
	   case .signatureRequestError:
		  return "Error en la petición de firma."
	   case .certificateSelectionRequestError:
		  return "Error en la petición de selección de certificados."
	   case .dataSavingRequestError:
		  return "Error en la petición de guardado de datos."
	   case .jsonBatchRequestError:
		  return "Error en la petición de lotes JSON."
	   case .xmlBatchRequestError:
		  return "Error en la petición de lotes XML."
	   case .fileLoadingRequestError:
		  return "Error en la petición de carga de ficheros."
	   }
    }
}
