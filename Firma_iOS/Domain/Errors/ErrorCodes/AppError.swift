//
//  ErrorCodes.swift
//  Autofirma
//
//  Created by Luis Nicieza on 14/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

/*protocol ErrorCodeProtocol: CustomStringConvertible {
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
}*/

enum AppError: Error {
    case hardwareError(_ code: Int, _ description: String, _ screenType: ErrorModalState = .globalError)
    case internalSoftware(_ code: Int, _ description: String, _ screenType: ErrorModalState = .globalError)
    case thirdPartySoftwareError(_ code: Int, _ description: String, _ screenType: ErrorModalState = .globalError)
    case communicationError(_ code: Int, _ description: String, _ screenType: ErrorModalState = .globalError)
    case functionalError(_ code: Int, _ description: String, _ screenType: ErrorModalState = .globalError)
    case requestError(_ code: Int, _ description: String, _ screenType: ErrorModalState = .globalError)
    
    // Propiedades calculadas para acceder a los detalles del error
    var code: Int {
        switch self {
        case .hardwareError(let code, _, _): return code
        case .internalSoftware(let code, _, _): return code
        case .thirdPartySoftwareError(let code, _, _): return code
        case .communicationError(let code, _, _): return code
        case .functionalError(let code, _, _): return code
        case .requestError(let code, _, _): return code
        }
    }
    
    var description: String {
        switch self {
        case .hardwareError(_, let description, _): return description
        case .internalSoftware(_, let description, _): return description
        case .thirdPartySoftwareError(_, let description, _): return description
        case .communicationError(_, let description, _): return description
        case .functionalError(_, let description, _): return description
        case .requestError(_, let description, _): return description
        }
    }
    
    var screenType: ErrorModalState {
        switch self {
        case .hardwareError(_, _, let screenType): return screenType
        case .internalSoftware(_, _, let screenType): return screenType
        case .thirdPartySoftwareError(_, _, let screenType): return screenType
        case .communicationError(_, _, let screenType): return screenType
        case .functionalError(_, _, let screenType): return screenType
        case .requestError(_, _, let screenType): return screenType
        }
    }
    
    var serverErrorMessage: String {
        return "ERR-\(self.code):=\(self.description)"
    }
    
    var screenErrorMessage: String {
        return "\(self.code) - \(self.screenType.description)"
    }
}

extension AppError: Equatable {
    static func == (lhs: AppError, rhs: AppError) -> Bool {
        return lhs.code == rhs.code
    }
}


/// Hardware Errors 1XXXXX problemas hardware: Problemas relacionados con el funcionamiento o ausencia de dispositivos hardware.
extension AppError {
    // 100XXX: Error general

    // 101XXX: Error NFC

    // 102XXX: Error tarjetas NFC
    static let nfcCardResetError = AppError.hardwareError(102000, "Error al resetear la tarjeta NFC")
    static let nfcCardSendCommandError = AppError.hardwareError(102001, "Error al ejecutar comando en la tarjeta NFC")
    
    // 103XXX: Error tarjetas SD criptográficas
}




/// Internal Software Error 2XXXXX problemas software internos: Errores en el funcionamiento interno de la aplicación.
extension AppError {
    // 2000XXL: Errores general
    static let generalSoftwareError = AppError.internalSoftware(200000, "Error general de software")
    static let saveHistorySign = AppError.internalSoftware(200001, "La firma se ha realizado correctamente pero no se ha podido guardar en el histórico de firmas", .globalError)
    
    // 2001XX: Operación de firma
    static let signingCipherSignError = AppError.internalSoftware(200100, "Error al cifrar la firma para enviarla al servidor intermedio")
    static let signingCipherCertificateError = AppError.internalSoftware(200101, "Error al cifrar el certificado para enviarlo al servidor intermedio")
    static let signingLoadLocalFile = AppError.internalSoftware(200102, "Error al cargar el fichero local para realizar la firma")
    static let generatePK1Certificate = AppError.internalSoftware(200102, "Error realizando la firma del fichero con certificado")
    static let generatePK1DNIe = AppError.internalSoftware(200102, "Error realizando la firma del fichero con DNIe")

    
    // 2002XX: Operación de selección de certificados
    static let certificateSelectionCipherCertificateError = AppError.internalSoftware(200200, "Error al cifrar el certificado para enviarlo al servidor intermedio")
    
    // 2003XX: Operación de guardado de datos
    static let dataSavingBase64Error = AppError.internalSoftware(200300, "Los datos recibidos para el guardadod de datos no estan en Base64")
    static let dataSavingFileSaveDisk = AppError.internalSoftware(200301, "No se ha podido guardar el fichero en disco")
    
    // 2004XX: Operación de lotes JSON
    static let jsonBatchCipherSignError = AppError.internalSoftware(200400, "Error al cifrar la información de las firmas del lote para enviarla al servidor intermedio")
    static let jsonBatchCipherCertificateError = AppError.internalSoftware(200401, "Error al cifrar el certificado para enviarlo al sevidor intermedio")
    static let jsonBatchOperationCypherCertificate = AppError.internalSoftware(200402, "Error al cifrar el certificado")
    static let jsonBatchOperationCypherData = AppError.internalSoftware(200403, "Error al cifrar el certificado")
    static let generatePK1BatchCertificate = AppError.internalSoftware(200404, "Error realizando la firma batch con certificado")
    static let generatePK1BatchDNIe = AppError.internalSoftware(200405, "Error realizando la firma batch con DNIe")
    static let jsonBatchDataBase64Possing = AppError.internalSoftware(200406, "Error al convertir a base64 los datos para enviarlos a la posfirma (con alguna firma erronéa)")
    static let jsonBatchSignsBase64Possing = AppError.internalSoftware(200407, "Error al convertir a base64 las los datos de la firma para enviarlos a la posfirma")
    static let jsonBatchDataErrorSignsBase64Possing = AppError.internalSoftware(200408, "Error al convertir a base64 los datos para enviarlos a la posfirma (todos las firmas erronéas)")
    static let jsonBatchSerializeResponsePossign = AppError.internalSoftware(200408, "Error al serializar la respuesta JSON de la posfirma para poder enviarla al servidor intermedio")
    
    //2005XX: Operación de lotes XML (no disponible en móviles)
    //2006XX: Operación de carga de ficheros (no disponible en móviles)

    //2007XX: Configuración de la aplicación

    //2008XX: Importación de certificados

    //2009XX: Gestión de certificados

    //2010XX: Carga de ficheros (en esta categoría se agregarán todos los errores de carga de ficheros, aunque sea como parte de la operación de firma web o local).
    static let fileLoadingLocalFile = AppError.internalSoftware(201000, "Error en la carga de fichero local para firmar")
    
    //2011XX: Carga/listado de certificados (en esta categoría se agregarán todos los errores de carga de certificado, independientemente de que se cargue para firmar un documento o para seleccionar el certificado.)
    static let certificateLoadingError = AppError.internalSoftware(201101, "Error en la carga de certificado para importar", .certificateNotImported)
    
    //2012XX: Operación de firma local (errores que sólo pueden producirse en la firma local y no en la web)

}


/// ThirdParty Software Error 3XXXXX problemas software de terceros: Errores devueltos por bibliotecas o sistemas externos de los que desconocemos los detalles del error, ya que depende de ellos.
extension AppError {
    // 3000XX: Error general
    
    // 3001XX: JMulticard
    static let invalidCard = AppError.requestError(300101, "La tarjeta identificada en el lector es desconocida o no está soportada", .dniReadingError)
    static let burnedCard = AppError.requestError(300102, "La tarjeta está corrompida, posiblemente se autodestruyó", .dniBroken)
    static let connectionError = AppError.requestError(300103, "No se ha podido conectar con la tarjeta", .globalError)
    static let notInitialized = AppError.requestError(300104, "La conexión con la tarjeta no está inicializada", .dniReadingErrorLong)
    static let operationError = AppError.requestError(300105, "Ocurrió un error inesperado durante la operación", .dniReadingErrorLong)
    static let badPin = AppError.requestError(300106, "PIN incorrecto", .dniIncorrectPin)
    static let lockedCard = AppError.requestError(300107, "Tarjeta bloqueada", .dniBlockedPin)
    static let pinError = AppError.requestError(300108, "Error durante la validación del PIN", .dniIncorrectPin)
    static let badCan = AppError.requestError(300109, "Error durante la validación del CAN", .dniIncorrectCan)
    static let severeError = AppError.requestError(300110, "Error genérico durante la comunicación con el DNIe", .dniReadingErrorLong)
    static let noCertAvailable = AppError.requestError(300111, "No se dispone de certificado de firma digital", .dniExpired)
    
    // 3002XX: Servidor intermedio (descarga)
    static let intermediateServerDownloadErrorHttpResponse = AppError.thirdPartySoftwareError(300200, "Error HTTP al descargar la información del servidor intermedio")
    static let intermediateServerDownloadErrorResponseFormat = AppError.thirdPartySoftwareError(300201, "La respuesta del servidor intermedio al descargar la información no es una respuesta válida")
    static let intermediateServerDownloadErrorResponseFormatXML = AppError.thirdPartySoftwareError(300202, "La respuesta del servidor intermedio al descargar la información no es un XML válido")
    static let intermediateServerDownloadDataCipher = AppError.thirdPartySoftwareError(300203, "No se ha podido descifrar la respuesta del servidor intermedio")
    
    // 3003XX: Servidor intermedio (subida)
    static let intermediateServerUploadErrorHttpResponse = AppError.thirdPartySoftwareError(300300, "Error HTTP al subir la información del servidor intermedio")
    static let intermediateServerUploadErrorResponseFormat = AppError.thirdPartySoftwareError(300301, "La respuesta del servidor intermedio al subir la información no es una respuesta válida")
    
    // 3004XX: Servidor trifásico
    static let threePhaseServerPresignErrorHTTPResponse = AppError.thirdPartySoftwareError(300400, "Error HTTP al realizar la operación de prefirma")
    static let threePhaseServerPresignErrorResponseFormat = AppError.thirdPartySoftwareError(300401, "La respuesta del servidor trifasico al hacer la prefirma no es válida")
    static let threePhaseServerPresignErrorResponseFormatNoData = AppError.thirdPartySoftwareError(300401, "La respuesta del servidor trifasico al hacer la prefirma no es válida (No llega ni las firmas correctas, ni erroneas)")
    static let threePhaseServerPresignErrorResponseFormatDictionary = AppError.thirdPartySoftwareError(300402, "La respuesta del servidor trifasico al hacer la prefirma no es un JSON")
    static let threePhaseServerPostsignErrorHTTPResponse = AppError.thirdPartySoftwareError(300403, "Error HTTP al realizar la operación de posfirma")
    static let threePhaseServerPostsignErrorResponseFormat = AppError.thirdPartySoftwareError(300404, "La respuesta del servidor trifasico al hacer la posfirma no es válida")
    static let threePhaseServerPostsignErrorResponseFormatDictionary = AppError.thirdPartySoftwareError(300405, "La respuesta del servidor trifasico al hacer la prefirma no es un JSON")
    static let threePhaseServerPostsignErrorResponseOkFormat = AppError.thirdPartySoftwareError(300406, "El servidor trifasico devolvio una resuesta con texto OK pero no llega el formato correcto para obtener la información a enviar al servidor intermedio")
    static let threePhaseServerPostsignErrorResponseData = AppError.thirdPartySoftwareError(300407, "El servidor trifasico devolvio una resuesta correcta que no sabemos procesar. No llega ni OK ni ERR-")
    // 3005XX: Biblioteca firma (código convertido en iOS)
    
}
    
/// Communication Error 4XXXXX problemas comunicaciones: Errores de comunicación con sistemas externos.
extension AppError {
    
    // 400XXX: Error general
    
    // 4011XX: Servidor intermedio (descarga)
    static let intermediateServerDownloadCommunicationError = AppError.communicationError(401100, "Error en la descarga de la firma")
    
    // 4012XX: Servidor intermedio (subida)
    static let intermediateServerUploadCommunicationError = AppError.communicationError(401200, "Error en la descarga de la firma")
    
    // 4013XX: Servidor trifásico Prefirma
    static let threePhaseServerPreSignCommunicationError = AppError.communicationError(401300, "Error de conexion con el servidor trifasico al hacer la prefirma")
    
    // 4014XX: Servidor trifásico Posfirma
    static let threePhaseServerPosSignCommunicationError = AppError.communicationError(401400, "Error de conexion con el servidor trifasico al hacer la posfirma")
    
    // 4015XX: Servidor trifásico Prefirma Lote
    static let threePhaseServerPreSignBatchCommunicationError = AppError.communicationError(401500, "Error de conexion con el servidor trifasico al hacer la prefirma Batch")
    
    // 4016XX: Servidor trifásico Posfirma Lote
    static let threePhaseServerPosSignBatchCommunicationError = AppError.communicationError(401600, "Error de conexion con el servidor trifasico al hacer la posfirma Batch")
}


/// Functional Error 5XXXXX problemas funcionales: Errores relacionados con la operativa de la funcionalidad. Por ejemplo, que se haya pedido firmar en PAdES un fichero no PDF
extension AppError {
    // 500XXX: Error general
    static let userOperationCanceled = AppError.functionalError(500001, "Operación cancelada por el usuario.", .userCancelled)
    
    // 501XXX: Operación de firma
    static let certificateNeeded = AppError.functionalError(501001, "Error en la operación, no hay certificados", .certificateNeeded)
    
    // 502XXX: Operación de selección de certificados

    // 503XXX: Operación de guardado de datos

    // 504XXX: Operación de lotes JSON
}
    
/// Request Error 6XXXXX problemas peticiones: Errores derivados de que no se proporcionen datos en la petición, sean erróneos o incompatibles entre sí.
extension AppError {
    // 6001XX: Error general
    static let invalidformatRequest = AppError.requestError(600000, "El formato de la petición es erroneo")
    static let operationRequestNotFound = AppError.requestError(600001, "No hay llegado código de operación en la petición")
    static let operationRequestNotValid = AppError.requestError(600002, "La operación no esta soportada")
    static let operationDataNotFound = AppError.requestError(600003, "No han llegado los datos en la petición ni el id del fichero a descargar")
    static let operationNotRtServlet = AppError.requestError(600004, "Es necesario descargar la información del servidor intermedio y no ha llegado la url del servidor de descarga")
    static let fileIdButNotCipherKey = AppError.requestError(600005, "Es necesario descargar la información del servidor intermedio y no ha llegado la clave de cifrado")

    // 6001XX: Petición de firma
    static let signThreePhaseUrlError = AppError.requestError(600100, "No ha llegado la url del servlet trifasico para la firma")
    static let signFormatNotFound = AppError.requestError(600101, "No se ha recibido el formato de firma para la firma")
    static let signFormatNotValid = AppError.requestError(600102, "El formato de firma no es válido")
    static let signUrlServletNotFound = AppError.requestError(600103, "No se ha recibido el stservlet para la firma")
    static let signAlgoNotFound = AppError.requestError(600104, "No se ha recibido el algoritmo de firma para la firma")
    static let signAlgoNotValid = AppError.requestError(600105, "El algoritmo de firma no es válido")
    static let signDocIdNotFound = AppError.requestError(600106, "No ha llegado el docid para el guardado de datos en la firma")
    static let datosInUseDecodeNotValid = AppError.requestError(600107, "Los datos de la operación no se han podido decodificar para la firma")
    
    // 6002XX: Petición de selección de certificados

    // 6003XX: Petición de guardado de datos

    // 6004XX: Petición de lotes JSON
    static let batchDataParameterRequestNotValid = AppError.requestError(600400, "El data de la operación de firma batch no es un JSON válido")
    static let batchStservletErrorNotFound = AppError.requestError(600401, "No se ha recibido el stservlet en la firma batch")
    static let batchpresignerUrlNotFound = AppError.requestError(600402, "No se ha recibido el batchpresignerurl en la firma batch")
    static let batchpostsignerUrlNotFound = AppError.requestError(600403, "No se ha recibido el batchpostsignerurl en la firma batch")
    static let batchalghorithmNotFound = AppError.requestError(600400, "No se ha recibido el algoritmo de firma en la firma batch")
    static let batchDataErrorNotFound = AppError.requestError(600400, "No se ha recibido el dat para en la firma batch")
}
    
    /*enum ServerErrorCodes: String, ErrorCodeProtocol {
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

struct ErroCodes {
    
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
                return ErrorInfo("300101", "La tarjeta identificada en el lector es desconocida o no está soportada.", .dniReadingError)
            case .burnedCard:
                return ErrorInfo("300202", "La tarjeta está corrompida, posiblemente se autodestruyó.", .dniBroken)
            case .connectionError:
                return ErrorInfo("300303", "No se ha podido conectar con la tarjeta.", .globalError)
            case .notInitialized:
                return ErrorInfo("300304", "La conexión con la tarjeta no está inicializada.", .dniReadingErrorLong)
            case .operationError:
                return ErrorInfo("300305", "Ocurrió un error inesperado durante la operación.", .dniReadingErrorLong)
            case .badPin:
                return ErrorInfo("300306", "PIN incorrecto.", .dniIncorrectPin)
            case .lockedCard:
                return ErrorInfo("300307", "Tarjeta bloqueada.", .dniBlockedPin)
            case .pinError:
                return ErrorInfo("300308", "Error durante la validación del PIN.", .dniIncorrectPin)
            case .badCan:
                return ErrorInfo("300309", "Error durante la validación del CAN.", .dniIncorrectCan)
            case .severeError:
                return ErrorInfo("300310", "Error genérico durante la comunicación con el DNIe", .dniReadingErrorLong)
            case .noCertAvailable:
                return ErrorInfo("300311", "No se dispone de certificado de firma digital", .dniExpired)
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
}*/
