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
    let showDescription: Bool
    let errorModalType: ErrorModalState
    
    // Inicializador personalizado sin etiquetas
    init(_ code: String, _ description: String, _ errorModalType: ErrorModalState = .globalError, _ showDescription: Bool = false) {
        self.code = code
        self.description = description
        self.errorModalType = errorModalType
        self.showDescription = showDescription
    }
    
    var serverErrorMessage: String {
        return "ERR-\(code):=\(description)"
    }
    
    var screenErrorTitle: String {
        return errorModalType.title
    }
    
    var screenErrorMessage: String {
        return (["\(code) -"] +
                     (showDescription ? [description] : [errorModalType.description])
                    ).joined(separator: " ")
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
        case saveHistorySign
        case signingError
        case signingCipherSignError
        case signingCipherCertificateError
        case certificateSelectionError
        case certificateSelectionCipherCertificateError
        case dataSavingError
        case dataSavingBase64Error
        case dataSavingFileSaveDisk
        case jsonBatchOperationError
        case jsonBatchCipherSignError
        case jsonBatchCipherCertificateError
        case signingLoadLocalFile
        case jsonBatchOperationCypherCertificate
        case jsonBatchOperationCypherData
        case xmlBatchOperationError
        case fileLoadingError
        case appConfigurationError
        case certificateImportError
        case certificateManagementError
        case fileLoadingLocalFile
        case certificateLoadingError
        case localSignatureError
        
        var info: ErrorInfo {
            switch self {
            case .generalSoftwareError:
                return ErrorInfo("200001", "Error general de software.")
            case .saveHistorySign:
                return ErrorInfo("200002", "La firma se ha realizado correctamente pero no se ha podido guardar la firma en el histórico de firmas", .globalError, true)
            case .signingError:
                return ErrorInfo("200101", "Error en la operación de firma.")
            case .signingCipherSignError:
                return ErrorInfo("200102", "Error al cifrar la firma para enviarla al servidor intermedio")
            case .signingCipherCertificateError:
                return ErrorInfo("200103", "Error al cifrar el certificado para enviarlo al servidor intermedio")
            case .signingLoadLocalFile:
                return ErrorInfo("200104", "Error al cargar el fichero local para realizar la firma")
            case .certificateSelectionError:
                return ErrorInfo("200201", "Error en la selección de certificados.")
            case .certificateSelectionCipherCertificateError:
                return ErrorInfo("200202", "Error al cifrar el certificado para enviarlo al servidor intermedio")
            case .dataSavingError:
                return ErrorInfo("200301", "Error en la operación de guardado de datos.")
            case .dataSavingBase64Error:
                return ErrorInfo("200302", "Los datos recibidos para el guardadod de datos no parecen estar en Base64")
            case .dataSavingFileSaveDisk:
                return ErrorInfo("200303", "No se ha podido guardar el fichero en disco")
            case .jsonBatchOperationError:
                return ErrorInfo("200401", "Error en la operación de lotes JSON.")
            case .jsonBatchCipherSignError:
                return ErrorInfo("200102", "Error al cifrar la información de las firmas del lote para enviarla al servidor intermedio.")
            case .jsonBatchCipherCertificateError:
                return ErrorInfo("200103", "Error al cifrar el certificado para enviarlo al sevidor intermedio.")
            case .jsonBatchOperationCypherCertificate:
                return ErrorInfo("200402", "Error al cifrar el certificado")
            case .jsonBatchOperationCypherData:
                return ErrorInfo("200403", "Error al cifrar los datos a guardar")
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
            
            }
        }
    }
 
    enum ThirdPartySoftwareErrorCodes: String, ErrorCodeProtocol {
        case generalThirdPartyError = "300001"
        case jMulticardError = "300101"
        case intermediateServerDownloadErrorHttpResponse = "300201"
        case intermediateServerDownloadErrorResponseFormat = "300202"
        case intermediateServerDownloadErrorResponseFormatXML = "300203"
        case intermediateServerDownloadDataCipher = "300204"
        case intermediateServerUploadErrorHttpResponse = "300301"
        case intermediateServerUploadErrorResponseFormat = "300302"
        case threePhaseServerPresignErrorHTTPResponse = "300401"
        case threePhaseServerPresignErrorResponseFormat = "300402"
        case threePhaseServerPresignErrorResponseFormatDictionary = "300403"
        case threePhaseServerPostsignErrorHTTPResponse = "300404"
        case threePhaseServerPostsignErrorResponseFormat = "300405"
        case threePhaseServerPostsignErrorResponseFormatDictionary = "300406"
        case signatureLibraryError = "300501"
        
        var info: ErrorInfo {
           switch self {
           case .generalThirdPartyError:
               return ErrorInfo(rawValue, "Error general de software de terceros.")
           case .jMulticardError:
               return ErrorInfo(rawValue, "Error en JMulticard.")
           case .intermediateServerDownloadErrorHttpResponse:
               return ErrorInfo(rawValue, "Error HTTP al descargar la información del servidor intermedio")
           case .intermediateServerDownloadErrorResponseFormat:
               return ErrorInfo(rawValue, "La respuesta del servidor intermedio al descargar la informaciòn no es una respuesta válida")
           case .intermediateServerDownloadErrorResponseFormatXML:
               return ErrorInfo(rawValue, "La respuesta del servidor intermedio al descargar la información no es un XML válido")
           case .intermediateServerDownloadDataCipher:
               return ErrorInfo(rawValue, "No se ha podido descifrar la respuesta del servidor intermedio")
           case .intermediateServerUploadErrorHttpResponse:
               return ErrorInfo(rawValue, "Error HTTP al subir la información del servidor intermedio")
           case .intermediateServerUploadErrorResponseFormat:
               return ErrorInfo(rawValue, "La respuesta del servidor intermedio al subir la informaciòn no es una respuesta válida")
           case .threePhaseServerPresignErrorHTTPResponse:
               return ErrorInfo(rawValue, "Error HTTP al realizar la operación de prefirma")
           case .threePhaseServerPresignErrorResponseFormat:
               return ErrorInfo(rawValue, "La respuesta del servidor trifasico al hacer la prefirma no es válida")
           case .threePhaseServerPresignErrorResponseFormatDictionary:
               return ErrorInfo(rawValue, "La respuesta del servidor trifasico al hacer la prefirma no es un JSON")
           case .threePhaseServerPostsignErrorHTTPResponse:
               return ErrorInfo(rawValue, "Error HTTP al realizar la operación de posfirma")
           case .threePhaseServerPostsignErrorResponseFormat:
               return ErrorInfo(rawValue, "La respuesta del servidor trifasico al hacer la posfirma no es válida")
           case .threePhaseServerPostsignErrorResponseFormatDictionary:
               return ErrorInfo(rawValue, "La respuesta del servidor trifasico al hacer la prefirma no es un JSON")
           case .signatureLibraryError:
               return ErrorInfo(rawValue, "Error en la biblioteca de firma.")
           }
        }
    }
    
    
    // Errores de comunicacion
    enum CommunicationErrorCodes: String, ErrorCodeProtocol {
        case generalCommunicationError = "400001"
        case signatureDownloadError = "401101"
        case signatureUploadError = "401201"
        case threePhaseSignatureError = "401301"
        case certificateSelectionDownloadError = "402101"
        case certificateSelectionUploadError = "402201"
        case dataSavingDownloadError = "403101"
        case dataSavingUploadError = "403201"
        case jsonBatchDownloadErrorConnection = "404101"
        case jsonBatchUploadErrorConnection = "404201"
        case jsonBatchThreePhasePresignErrorConnection = "404301"
        case jsonBatchThreePhasePostsignErrorConnection = "404302"
        
        var info: ErrorInfo {
            switch self {
            case .generalCommunicationError:
                return ErrorInfo(rawValue, "Error general de comunicación.")
            case .signatureDownloadError:
                return ErrorInfo(rawValue, "Error en la descarga de la firma.")
            case .signatureUploadError:
                return ErrorInfo(rawValue, "Error en la subida de la firma.")
            case .threePhaseSignatureError:
                return ErrorInfo(rawValue, "Error en la firma trifásica.")
            case .certificateSelectionDownloadError:
                return ErrorInfo(rawValue, "Error en la descarga de certificados.")
            case .certificateSelectionUploadError:
                return ErrorInfo(rawValue, "Error en la subida de certificados.")
            case .dataSavingDownloadError:
                return ErrorInfo(rawValue, "Error en la descarga de datos guardados.")
            case .dataSavingUploadError:
                return ErrorInfo(rawValue, "Error en la subida de datos guardados.")
            case .jsonBatchDownloadErrorConnection:
                return ErrorInfo(rawValue, "Error de conexión con el servidor intermedio al descargar la información")
            case .jsonBatchUploadErrorConnection:
                return ErrorInfo(rawValue, "Error de conexión con el servidor intermedio al subir la información")
            case .jsonBatchThreePhasePresignErrorConnection:
                return ErrorInfo(rawValue, "Error de conexion con el servidor trifasico al hacer la prefirma")
            case .jsonBatchThreePhasePostsignErrorConnection:
                return ErrorInfo(rawValue, "Error de conexion con el servidor trifasico al hacer la posfirma")
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
                return ErrorInfo("505001", "Error en la operación, no hay certificados", .certificateNeeded)
            }
        }
    }
    
    enum RequestErrorCodes: ErrorCodeProtocol {
        case invalidformatRequest
        case operationRequestNotFound
        case operationRequestNotValid
        case operationDataNotFound
        case operationNotRtServlet
        case fileIdButNotCipherKey
        case signatureRequestError
        case certificateSelectionRequestError
        case dataSavingRequestError
        case jsonBatchRequestError
        case xmlBatchRequestError
        case fileLoadingRequestError
        
        var info: ErrorInfo {
            switch self {
            case .invalidformatRequest:
                return ErrorInfo("600001", "El formato de la petición es erroneo")
            case .operationRequestNotFound:
                return ErrorInfo("600002", "No hay llegado código de operación en la petición")
            case .operationRequestNotValid:
                return ErrorInfo("600003", "La operación no esta soportada")
            case .operationDataNotFound:
                return ErrorInfo("600004", "No han llegado los datos en la petición ni el id del fichero a descargar")
            case .operationNotRtServlet:
                return ErrorInfo("600005", "Es necesario descargar la información del servidor intermedio y no ha llegado la url del servidor de descarga")
            case .fileIdButNotCipherKey:
                return ErrorInfo("600006", "Es necesario descargar la información del servidor intermedio y no ha llegado la clave de cifrado")
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
    
    static func getThirdPartyOrCommunicationError(codigo: String) -> ErrorCodeProtocol {
        if let thirdPartyError = ThirdPartySoftwareErrorCodes(rawValue: codigo) {
            return thirdPartyError
        }
        if let communicationError = CommunicationErrorCodes(rawValue: codigo) {
            return communicationError
        }
        return ErrorCodes.InternalSoftwareErrorCodes.generalSoftwareError
    }
}
