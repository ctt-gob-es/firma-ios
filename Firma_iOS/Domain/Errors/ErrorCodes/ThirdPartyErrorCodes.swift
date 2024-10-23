//
//  ThirdPartyErrorCodes.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 16/10/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

enum ThirdPartySoftwareErrorCodes: String, ErrorCode {
    case generalThirdPartyError = "300001"
    case jMulticardError = "300101"
    case intermediateServerDownloadError = "300201"
    case intermediateServerUploadError = "300301"
    case trifasicoServerError = "300401"
    case signatureLibraryError = "300501"
    
    static func getMessage(for code: ThirdPartySoftwareErrorCodes) -> String {
	   switch code {
	   case .generalThirdPartyError:
		  return "Error general de software de terceros."
	   case .jMulticardError:
		  return "Error en JMulticard."
	   case .intermediateServerDownloadError:
		  return "Error en el servidor intermedio (descarga)."
	   case .intermediateServerUploadError:
		  return "Error en el servidor intermedio (subida)."
	   case .trifasicoServerError:
		  return "Error en el servidor trifásico."
	   case .signatureLibraryError:
		  return "Error en la biblioteca de firma."
	   }
    }
}
