//
//  CommunicationErrorCodes.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 16/10/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

enum CommunicationErrorCodes: String, ErrorCode {
    case generalCommunicationError = "400001"
    case signatureDownloadError = "401101"
    case signatureUploadError = "401201"
    case threePhaseSignatureError = "401301"
    case certificateSelectionDownloadError = "402101"
    case certificateSelectionUploadError = "402201"
    case dataSavingDownloadError = "403101"
    case dataSavingUploadError = "403201"
    case jsonBatchDownloadError = "404101"
    case jsonBatchUploadError = "404201"
    case jsonBatchThreePhaseError = "404301"
    
    static func getMessage(for code: CommunicationErrorCodes) -> String {
	   switch code {
	   case .generalCommunicationError:
		  return "Error general de comunicación."
	   case .signatureDownloadError:
		  return "Error en la descarga de la firma."
	   case .signatureUploadError:
		  return "Error en la subida de la firma."
	   case .threePhaseSignatureError:
		  return "Error en la firma trifásica."
	   case .certificateSelectionDownloadError:
		  return "Error en la descarga de certificados."
	   case .certificateSelectionUploadError:
		  return "Error en la subida de certificados."
	   case .dataSavingDownloadError:
		  return "Error en la descarga de datos guardados."
	   case .dataSavingUploadError:
		  return "Error en la subida de datos guardados."
	   case .jsonBatchDownloadError:
		  return "Error en la descarga del lote JSON."
	   case .jsonBatchUploadError:
		  return "Error en la subida del lote JSON."
	   case .jsonBatchThreePhaseError:
		  return "Error en la operación trifásica del lote JSON."
	   }
    }
}
