//
//  ErrorCodes.swift
//  Autofirma
//
//  Created by Luis Nicieza on 14/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

protocol ErrorCodeProtocol: CustomStringConvertible {
    var info: ErrorInfo { get }
}

extension ErrorCodeProtocol {
    var description: String {
        "\(info.description) (Código: \(info.code))"
    }
}

struct ErrorInfo: Error, Equatable {
    let code: String
    let description: String
    let errorModalType: ErrorModalState
    
    // Inicializador personalizado sin etiquetas
    init(_ code: String, _ description: String, _ errorModalType: ErrorModalState = .globalError) {
        self.code = code
        self.description = description
        self.errorModalType = errorModalType
    }
    
    var serverErrorMessage: String {
        return "\(code): \(description)"
    }
}

enum ErrorCodes{

    enum HardwareErrorCodes : ErrorCodeProtocol {
        case generalHardwareError
        case nfcError
        case nfcCardError
        case sdCardError
        
        var info: ErrorInfo {
            switch self {
            case .generalHardwareError:
                return ErrorInfo("100001", "Error general de hardware.")
            case .nfcError:
                return ErrorInfo("101001", "Error relacionado con el dispositivo NFC.", .dniReadingError)
            case .nfcCardError:
                return ErrorInfo("102001", "Error en la tarjeta NFC.", .dniReadingError)
            case .sdCardError:
                return ErrorInfo("103001", "Error en la tarjeta NFC.", .globalError)
            }
        }
    }
    
    enum InternalSoftwareErrorCodes : ErrorCodeProtocol {
        case generalSoftwareError
        case signingError
        case certificateSelectionError
        case dataSavingError
        case jsonBatchOperationError
        case xmlBatchOperationError
        case fileLoadingError
        case appConfigurationError
        case certificateImportError
        case certificateManagementError
        case fileLoadingLocalFile
        case certificateLoadingError
        case localSignatureError
        case saveHistorySign
        
        var info: ErrorInfo {
            switch self {
            case .generalSoftwareError:
                return ErrorInfo("200001", "Error general de software.")
            case .signingError:
                return ErrorInfo("200101", "Error en la operación de firma.")
            case .certificateSelectionError:
                return ErrorInfo("200201", "Error en la selección de certificados.")
            case .dataSavingError:
                return ErrorInfo("200301", "Error en la operación de guardado de datos.")
            case .jsonBatchOperationError:
                return ErrorInfo("200401", "Error en la operación de lotes JSON.")
            case .xmlBatchOperationError:
                return ErrorInfo("200501", "Error en la operación de lotes XML.")
            case .fileLoadingError:
                return ErrorInfo("200601", "Error en la carga de ficheros.")
            case .appConfigurationError:
                return ErrorInfo("200701", "Error en la configuración de la aplicación.")
            case .certificateImportError:
                return ErrorInfo("200801", "Error en la importación de certificados.")
            case .certificateManagementError:
                return ErrorInfo("200901", "Error en la gestión de certificados.")
            case .fileLoadingLocalFile:
                return ErrorInfo("201001", "Error en la carga de fichero local para firmar.", .dataNotImported)
            case .certificateLoadingError:
                return ErrorInfo("201101", "Error en la carga de certificado para importar", .certificateNotImported)
            case .localSignatureError:
                return ErrorInfo("201201", "Error en la firma local.")
            case .saveHistorySign:
                return ErrorInfo("201201", "Error al guardar en el históricod de firmas")
            }
        }
    }

    enum ThirdPartySoftwareErrorCodes: ErrorCodeProtocol {
        case generalThirdPartyError
        case jMulticardError
        case intermediateServerDownloadError
        case intermediateServerUploadError
        case trifasicoServerError
        case signatureLibraryError
        
        var info: ErrorInfo {
           switch self {
           case .generalThirdPartyError:
               return ErrorInfo("300001", "Error general de software de terceros.")
           case .jMulticardError:
               return ErrorInfo("300101", "Error en JMulticard.")
           case .intermediateServerDownloadError:
               return ErrorInfo("300201", "Error en el servidor intermedio (descarga).")
           case .intermediateServerUploadError:
               return ErrorInfo("300301", "Error en el servidor intermedio (subida).")
           case .trifasicoServerError:
               return ErrorInfo("300401", "Error en el servidor trifásico.")
           case .signatureLibraryError:
               return ErrorInfo("300501", "Error en la biblioteca de firma.")
           }
        }
    }
    
    enum CommunicationErrorCodes: ErrorCodeProtocol {
        case generalCommunicationError
        case signatureDownloadError
        case signatureUploadError
        case threePhaseSignatureError
        case certificateSelectionDownloadError
        case certificateSelectionUploadError
        case dataSavingDownloadError
        case dataSavingUploadError
        case jsonBatchDownloadError
        case jsonBatchUploadError
        case jsonBatchThreePhaseError
        
        var info: ErrorInfo {
            switch self {
            case .generalCommunicationError:
                return ErrorInfo("400001", "Error general de comunicación.")
            case .signatureDownloadError:
                return ErrorInfo("401101", "Error en la descarga de la firma.")
            case .signatureUploadError:
                return ErrorInfo("401201", "Error en la subida de la firma.")
            case .threePhaseSignatureError:
                return ErrorInfo("401301", "Error en la firma trifásica.")
            case .certificateSelectionDownloadError:
                return ErrorInfo("402101", "Error en la descarga de certificados.")
            case .certificateSelectionUploadError:
                return ErrorInfo("402201", "Error en la subida de certificados.")
            case .dataSavingDownloadError:
                return ErrorInfo("403101", "Error en la descarga de datos guardados.")
            case .dataSavingUploadError:
                return ErrorInfo("403201", "Error en la subida de datos guardados.")
            case .jsonBatchDownloadError:
                return ErrorInfo("404101", "Error en la descarga del lote JSON.")
            case .jsonBatchUploadError:
                return ErrorInfo("404201", "Error en la subida del lote JSON.")
            case .jsonBatchThreePhaseError:
                return ErrorInfo("404301", "Error en la operación trifásica del lote JSON.")
            }
        }
    }
    
    enum FunctionalErrorCodes: ErrorCodeProtocol {
        case generalFunctionalError
        case userOperationCanceled
        case signatureOperationError
        case certificateSelectionOperationError
        case dataSavingOperationError
        case jsonBatchOperationError
        case certificateNeeded
        
        var info: ErrorInfo {
            switch self {
            case .generalFunctionalError:
                return ErrorInfo("500000", "Error funcional general.")
            case .userOperationCanceled:
                return ErrorInfo("500001", "Operación cancelada por el usuario.", .userCancelled)
            case .signatureOperationError:
                return ErrorInfo("501001", "Error en la operación de firma.")
            case .certificateSelectionOperationError:
                return ErrorInfo("502001", "Error en la operación de selección de certificados.")
            case .dataSavingOperationError:
                return ErrorInfo("503001", "Error en la operación de guardado de datos.")
            case .jsonBatchOperationError:
                return ErrorInfo("504001", "Error en la operación de lotes JSON.")
            case .certificateNeeded:
                return ErrorInfo("505001", "Error en la operación, no hay certificados")
            }
        }
    }
    
    enum RequestErrorCodes: ErrorCodeProtocol {
        case generalRequestError
        case signatureRequestError
        case certificateSelectionRequestError
        case dataSavingRequestError
        case jsonBatchRequestError
        case xmlBatchRequestError
        case fileLoadingRequestError
        
        var info: ErrorInfo {
            switch self {
            case .generalRequestError:
                return ErrorInfo("600001", "Error general de petición.")
            case .signatureRequestError:
                return ErrorInfo("600101", "Error en la petición de firma.")
            case .certificateSelectionRequestError:
                return ErrorInfo("600201", "Error en la petición de selección de certificados.")
            case .dataSavingRequestError:
                return ErrorInfo("600301", "Error en la petición de guardado de datos.")
            case .jsonBatchRequestError:
                return ErrorInfo("600401", "Error en la petición de lotes JSON.")
            case .xmlBatchRequestError:
                return ErrorInfo("600501", "Error en la petición de lotes XML.")
            case .fileLoadingRequestError:
                return ErrorInfo("600601", "Error en la petición de carga de ficheros.")
            }
        }

    }
    
    enum ServerErrorCodes: String, ErrorCodeProtocol {
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
        
        var info: ErrorInfo {
            switch self {
            case .missingOperation:
                return ErrorInfo("ERR-1", "No se ha indicado la operación a realizar.")
           case .missingDocumentID:
                return ErrorInfo("ERR-2", "No se ha indicado el identificador del documento.")
           case .missingSignatureAlgorithm:
                return ErrorInfo("ERR-3", "No se ha indicado el algoritmo de firma.")
           case .missingSignatureFormat:
                return ErrorInfo("ERR-4", "No se ha indicado el formato de firma.")
           case .missingUserCertificate:
                return ErrorInfo("ERR-5", "No se ha indicado el certificado de usuario.")
           case .invalidAdditionalParamsFormat:
                return ErrorInfo("ERR-6", "El formato de los parámetros adicionales suministrados es erróneo.")
           case .userCertificateNotX509:
                return ErrorInfo("ERR-7", "El certificado de usuario no está en formato X.509.")
           case .unsupportedSignatureFormat:
                return ErrorInfo("ERR-8", "Formato de firma no soportado.")
           case .preSignatureError:
                return ErrorInfo("ERR-9", "Error realizando la prefirma.")
           case .documentStorageError:
                return ErrorInfo("ERR-10", "Error al almacenar el documento.")
           case .unknownOperation:
                return ErrorInfo("ERR-11", "Operación desconocida.")
           case .postSignatureError:
                return ErrorInfo("ERR-12", "Error realizando la postfirma.")
           case .invalidSubOperation:
                return ErrorInfo("ERR-13", "No se indicó una sub-operación válida a realizar (firma, cofirma, etc.).")
           case .documentRetrievalError:
                return ErrorInfo("ERR-14", "Error al recuperar el documento.")
           case .invalidSessionDataFormat:
                return ErrorInfo("ERR-15", "El formato de los datos de sesión suministrados es erróneo.")
           case .verificationCodeGenerationError:
                return ErrorInfo("ERR-16", "Error al generar el código de verificación de las firmas.")
           case .verificationCodeCheckError:
                return ErrorInfo("ERR-17", "Error al comprobar el código de verificación de las firmas.")
           case .signatureIntegrityError:
                return ErrorInfo("ERR-18", "Error de integridad en la firma.")
           case .invalidOperationDataFormat:
                return ErrorInfo("ERR-19", "El formato de los datos de operación suministrados es erróneo.")
           case .unsupportedSignatureAlgorithm:
                return ErrorInfo("ERR-20", "Algoritmo de firma no soportado.")
           case .userInterventionRequired:
                return ErrorInfo("ERR-21", "Se requiere intervención del usuario.")
            }
        }
    }
    
    enum DNIeErrorCodes: String, ErrorCodeProtocol {
        case invalidCard = "1"          // La tarjeta identificada en el lector es desconocida o no está soportada.
        case burnedCard = "2"           // La tarjeta está corrompida, pudo haber ocurrido por un ataque o problemas de tensión.
        case connectionError = "3"      // No se ha podido conectar con la tarjeta.
        case notInitialized = "4"       // La conexión con la tarjeta no está inicializada.
        case operationError = "5"       // Ocurrió un error inesperado durante la operación.
        case badPin = "6"               // PIN incorrecto.
        case lockedCard = "7"           // Tarjeta bloqueada.
        case pinError = "8"             // Error durante la validación del PIN.
        case badCan = "9"               // Error durante la validación del CAN.
        case severeError = "10"         // Error genérico.
        case noCertAvailable = "11"     // Error, no se dispone de certificado de firma digital
        
        var info: ErrorInfo {
            switch self {
            case .invalidCard:
                return ErrorInfo("1", "La tarjeta identificada en el lector es desconocida o no está soportada.", .dniReadingError)
            case .burnedCard:
                return ErrorInfo("2", "La tarjeta está corrompida, posiblemente se autodestruyó.", .dniBroken)
            case .connectionError:
                return ErrorInfo("3", "No se ha podido conectar con la tarjeta.", .globalError)
            case .notInitialized:
                return ErrorInfo("4", "La conexión con la tarjeta no está inicializada.", .dniReadingErrorLong)
            case .operationError:
                return ErrorInfo("5", "Ocurrió un error inesperado durante la operación.", .dniReadingErrorLong)
            case .badPin:
                return ErrorInfo("6", "PIN incorrecto.", .dniIncorrectPin)
            case .lockedCard:
                return ErrorInfo("7", "Tarjeta bloqueada.", .dniBlockedPin)
            case .pinError:
                return ErrorInfo("8", "Error durante la validación del PIN.", .dniIncorrectPin)
            case .badCan:
                return ErrorInfo("9", "Error durante la validación del CAN.", .dniIncorrectCan)
            case .severeError:
                return ErrorInfo("10", "Error genérico durante la comunicación con el DNIe", .dniReadingErrorLong)
            case .noCertAvailable:
                return ErrorInfo("11", "No se dispone de certificado de firma digital", .dniExpired)
            }
        }
    }
    
    static func getServerError(codigo: String) -> ErrorCodeProtocol {
        // Buscar en HardwareErrorCodes
        if let serverError = ServerErrorCodes(rawValue: codigo) {
            return serverError
        }
        
        // Si no se encuentra el código, retornar nil
        return ErrorCodes.InternalSoftwareErrorCodes.generalSoftwareError
    }
    
    static func getDNIError(codigo: String) -> ErrorCodeProtocol {
        // Buscar en HardwareErrorCodes
        if let dniError = DNIeErrorCodes(rawValue: codigo) {
            return dniError
        }
        
        // Si no se encuentra el código, retornar nil
        return ErrorCodes.InternalSoftwareErrorCodes.generalSoftwareError
    }
}
