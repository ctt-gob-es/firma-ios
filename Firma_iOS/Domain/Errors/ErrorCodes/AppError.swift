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

enum AppError: Error, Hashable {
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
        if (self == .userOperationCanceled || self == .userOperationSaveCanceled) {
            // Para la operacion de cancelación por el usuario es necesario devolver el código antiguo en el ERR
            return "ERR-11:=AI\(self.code) - \(self.description)"
        }
        return "ERR-AI\(self.code):=AI\(self.code) - \(self.description)"
    }
    
    var screenErrorMessage: String {
        return "AI\(self.code) - \(self.screenType.description)"
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
    
    static let nfcReaderErrorUnsupportedFeature = AppError.hardwareError(102002, "Función no soportada por el hardware del dispositivo")
    static let nfcReaderErrorSecurityViolation = AppError.hardwareError(102003, "Restricción de seguridad")
    static let nfcReaderErrorInvalidParameter = AppError.hardwareError(102004, "Parámetro inválido en la conexion NFC", .dniReadingErrorLong)
    static let nfcReaderErrorInvalidParameterLength = AppError.hardwareError(102005, "Longitud de parámetro no válida en la conexión NFC")
    static let nfcReaderErrorParameterOutOfBound = AppError.hardwareError(102006, "Parámetro fuera de los límites aceptables")
    static let nfcReaderErrorRadioDisabled = AppError.hardwareError(102007, "La radio NFC está deshabilitada", .dniReadingErrorLong)
    static let nfcReaderTransceiveErrorTagConnectionLost = AppError.hardwareError(102008, "La conexión con la etiqueta NFC se perdió", .dniReadingErrorLong)
    static let nfcReaderTransceiveErrorRetryExceeded = AppError.hardwareError(102009, "Se alcanzó el límite de intentos para transmitir datos", .dniReadingErrorLong)
    static let nfcReaderTransceiveErrorTagResponseError = AppError.hardwareError(102010, "Respuesta inválida desde la etiqueta NFC")
    static let nfcReaderTransceiveErrorSessionInvalidated = AppError.hardwareError(102011, "Transmisión en sesión invalidada")
    static let nfcReaderTransceiveErrorTagNotConnected = AppError.hardwareError(102012, "La etiqueta NFC no está conectada", .dniReadingErrorLong)
    static let nfcReaderTransceiveErrorPacketTooLong = AppError.hardwareError(102013, "Paquete demasiado largo para la etiqueta NFC")
    static let nfcReaderSessionInvalidationErrorUserCanceled = AppError.hardwareError(102014, "El usuario canceló manualmente la sesión", .dniCanceledSession)
    static let nfcReaderSessionInvalidationErrorSessionTimeout = AppError.hardwareError(102015, "La sesión NFC expiró debido a inactividad", .dniTimeoutError)
    static let nfcReaderSessionInvalidationErrorSessionTerminatedUnexpectedly = AppError.hardwareError(102016, "La sesión NFC se cerró inesperadamente", .dniReadingErrorLong)
    static let nfcReaderSessionInvalidationErrorSystemIsBusy = AppError.hardwareError(102017, "El sistema está ocupado", .dniReadingErrorLong)
    static let nfcReaderSessionInvalidationErrorFirstNDEFTagRead = AppError.hardwareError(102018, "Sesión cerrada tras leer la primera etiqueta (según configuración)", .dniReadingErrorLong)
    static let nfcTagCommandConfigurationErrorInvalidParameters = AppError.hardwareError(102019, "Configuración inválida en los comandos enviados a la etiqueta")
    static let nfcNdefReaderSessionErrorTagNotWritable = AppError.hardwareError(102020, "La etiqueta NFC no es escribible")
    static let nfcNdefReaderSessionErrorTagUpdateFailure = AppError.hardwareError(102021, "Fallo al intentar actualizar la etiqueta")
    static let nfcNdefReaderSessionErrorTagSizeTooSmall = AppError.hardwareError(102022, "Espacio insuficiente en la etiqueta NFC")
    static let nfcNdefReaderSessionErrorZeroLengthMessage = AppError.hardwareError(102023, "El mensaje NDEF tiene longitud cero", .dniReadingErrorLong)
    static let nfcUnknowError = AppError.hardwareError(102024, "Error desconocido al conectar con la tarjeta NFC")
    
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
    static let generatePK1Certificate = AppError.internalSoftware(200103, "Error realizando la firma del fichero con certificado")
    static let generatePK1DNIe = AppError.internalSoftware(200104, "Error realizando la firma del fichero con DNIe")
    static let selectedFileIsNotPDF = AppError.internalSoftware(200106, "El usuario selecciono un documento no PDF sobre el que realizar una firma PAdES", .fileSelectedNoPDF)
    static let receivedFileIsNotPDF = AppError.internalSoftware(200107, "No es posible hacer firma PAdES sobre datos no PDF", .globalError)
    
    // 2002XX: Operación de selección de certificados
    static let certificateSelectionCipherCertificateError = AppError.internalSoftware(200200, "Error al cifrar el certificado para enviarlo al servidor intermedio")
    
    // 2003XX: Operación de guardado de datos
    static let dataSavingBase64Error = AppError.internalSoftware(200300, "Los datos recibidos para el guardadod de datos no estan en Base64")
    static let dataSavingFileSaveDisk = AppError.internalSoftware(200301, "No se ha podido guardar el fichero en disco")
    
    // 2004XX: Operación de lotes JSON
    static let jsonBatchCipherSignError = AppError.internalSoftware(200400, "Error al cifrar la información de las firmas del lote para enviarla al servidor intermedio")
    static let jsonBatchCipherCertificateError = AppError.internalSoftware(200401, "Error al cifrar el certificado para enviarlo al sevidor intermedio")
    static let generatePK1BatchCertificate = AppError.internalSoftware(200404, "Error realizando la firma batch con certificado")
    static let generatePK1BatchDNIe = AppError.internalSoftware(200405, "Error realizando la firma batch con DNIe")
    static let jsonBatchDataBase64Possing = AppError.internalSoftware(200406, "Error al convertir a base64 los datos para enviarlos a la posfirma (con alguna firma erronéa)")
    static let jsonBatchSignsBase64Possing = AppError.internalSoftware(200407, "Error al convertir a base64 las los datos de la firma para enviarlos a la posfirma")
    static let jsonBatchDataErrorSignsBase64Possing = AppError.internalSoftware(200408, "Error al convertir a base64 los datos para enviarlos a la posfirma (todos las firmas erronéas)")
    static let jsonBatchSerializeResponsePossign = AppError.internalSoftware(200409, "Error al serializar la respuesta JSON de la posfirma para poder enviarla al servidor intermedio")
    
    //2005XX: Operación de lotes XML (no disponible en móviles)
    //2006XX: Operación de carga de ficheros (no disponible en móviles)

    //2007XX: Configuración de la aplicación

    //2008XX: Importación de certificados

    //2009XX: Gestión de certificados

    //2010XX: Carga de ficheros (en esta categoría se agregarán todos los errores de carga de ficheros, aunque sea como parte de la operación de firma web o local).
    static let fileLoadingLocalFile = AppError.internalSoftware(201000, "Error en la carga de fichero local para firmar")
    static let signingLoadLocalFile = AppError.internalSoftware(201001, "Error al cargar el fichero local para realizar la firma desde la ubicación seleccionada", .fileSignNotLoad)
    
    //2011XX: Carga/listado de certificados (en esta categoría se agregarán todos los errores de carga de certificado, independientemente de que se cargue para firmar un documento o para seleccionar el certificado.)
    static let certificateImportingError = AppError.internalSoftware(201100, "Error en la carga de certificado para importar", .certificateNotImported)
    
    //2012XX: Operación de firma local (errores que sólo pueden producirse en la firma local y no en la web)

}


/// ThirdParty Software Error 3XXXXX problemas software de terceros: Errores devueltos por bibliotecas o sistemas externos de los que desconocemos los detalles del error, ya que depende de ellos.
extension AppError {
    // 3000XX: Error general
    
    // 3001XX: JMulticard
    static let invalidCard = AppError.requestError(300100, "La tarjeta identificada en el lector es desconocida o no está soportada", .dniReadingError)
    static let burnedCard = AppError.requestError(300101, "La tarjeta está corrompida, posiblemente se autodestruyó", .dniBroken)
    static let connectionError = AppError.requestError(300102, "No se ha podido conectar con la tarjeta", .dniReadingErrorLong)
    static let notInitialized = AppError.requestError(300103, "La conexión con la tarjeta no está inicializada", .dniReadingErrorLong)
    static let operationError = AppError.requestError(300104, "Ocurrió un error inesperado durante la operación", .dniReadingErrorLong)
    static let badPin = AppError.requestError(300105, "PIN incorrecto", .dniIncorrectPin)
    static let lockedCard = AppError.requestError(300106, "Tarjeta bloqueada", .dniBlockedPin)
    static let pinError = AppError.requestError(300107, "Error durante la validación del PIN", .dniIncorrectPin)
    static let badCan = AppError.requestError(300108, "Error durante la validación del CAN", .dniIncorrectCan)
    static let severeError = AppError.requestError(300109, "Error genérico durante la comunicación con el DNIe", .dniReadingErrorLong)
    static let noCertAvailable = AppError.requestError(300110, "No se dispone de certificado de firma digital", .dniExpired)
    
    // 3002XX: Servidor intermedio (descarga)
    static let intermediateServerDownloadErrorHttpResponse = AppError.thirdPartySoftwareError(300200, "Error HTTP al descargar la información del servidor intermedio")
    static let intermediateServerDownloadErrorResponseFormat = AppError.thirdPartySoftwareError(300201, "La respuesta del servidor intermedio al descargar la información no es una respuesta válida")
    static let intermediateServerDownloadErrorResponseFormatXML = AppError.thirdPartySoftwareError(300202, "La respuesta del servidor intermedio al descargar la información no es un XML válido")
    static let intermediateServerDownloadDataCipher = AppError.thirdPartySoftwareError(300203, "No se ha podido descifrar la respuesta del servidor intermedio")
    static let intermediateServerDownloadErrorResponse = AppError.thirdPartySoftwareError(300204, "El servidor intermedio ha devuelto una respuesta de error al intentar descargar la información de la operación")
    
    // 3003XX: Servidor intermedio (subida)
    static let intermediateServerUploadErrorHttpResponse = AppError.thirdPartySoftwareError(300300, "Error HTTP al subir la información del servidor intermedio")
    static let intermediateServerUploadErrorResponseFormat = AppError.thirdPartySoftwareError(300301, "La respuesta del servidor intermedio al subir la información no es una respuesta válida")
    
    // 3004XX: Servidor trifásico
    static let threePhaseServerPresignErrorHTTPResponse = AppError.thirdPartySoftwareError(300400, "Error HTTP al realizar la operación de prefirma")
    static let threePhaseServerPresignErrorResponseFormat = AppError.thirdPartySoftwareError(300401, "La respuesta del servidor trifasico al hacer la prefirma no es válida")
    static let threePhaseServerPresignErrorResponseFormatNoData = AppError.thirdPartySoftwareError(300402, "La respuesta del servidor trifasico al hacer la prefirma no es válida (No llega ni las firmas correctas, ni erroneas)")
    static let threePhaseServerPresignErrorResponseFormatDictionary = AppError.thirdPartySoftwareError(300403, "La respuesta del servidor trifasico al hacer la prefirma no es un JSON")
    static let threePhaseServerPostsignErrorHTTPResponse = AppError.thirdPartySoftwareError(300404, "Error HTTP al realizar la operación de posfirma")
    static let threePhaseServerPostsignErrorResponseFormat = AppError.thirdPartySoftwareError(300405, "La respuesta del servidor trifasico al hacer la posfirma no es válida")
    static let threePhaseServerPostsignErrorResponseFormatDictionary = AppError.thirdPartySoftwareError(300406, "La respuesta del servidor trifasico al hacer la prefirma no es un JSON")
    static let threePhaseServerPostsignErrorResponseOkFormat = AppError.thirdPartySoftwareError(300407, "El servidor trifasico devolvio una resuesta con texto OK pero no llega el formato correcto para obtener la información a enviar al servidor intermedio")
    static let threePhaseServerPostsignErrorResponseData = AppError.thirdPartySoftwareError(300408, "El servidor trifasico devolvio una resuesta correcta que no sabemos procesar. No llega ni OK ni ERR-")
    
    static let threePhaseServerPresignErr1 = AppError.thirdPartySoftwareError(300409, "ERR-1 en la prefirma. No se ha indicado la operacion a realizar")
    static let threePhaseServerPresignErr2 = AppError.thirdPartySoftwareError(300410, "ERR-2 en la prefirma: No se ha indicado el identificador del documento")
    static let threePhaseServerPresignErr3 = AppError.thirdPartySoftwareError(300411, "ERR-3 en la prefirma: No se ha indicado el algoritmo de firma")
    static let threePhaseServerPresignErr4 = AppError.thirdPartySoftwareError(300412, "ERR-4 en la prefirma: No se ha indicado el formato de firma")
    static let threePhaseServerPresignErr5 = AppError.thirdPartySoftwareError(300413, "ERR-5 en la prefirma: No se ha indicado el certificado de usuario")
    static let threePhaseServerPresignErr6 = AppError.thirdPartySoftwareError(300414, "ERR-6 en la prefirma: El formato de los parametros adicionales suministrados es erroneo")
    static let threePhaseServerPresignErr7 = AppError.thirdPartySoftwareError(300415, "ERR-7 en la prefirma: El certificado de usuario no esta en formato X.509")
    static let threePhaseServerPresignErr8 = AppError.thirdPartySoftwareError(300416, "ERR-8 en la prefirma: Formato de firma no soportado")
    static let threePhaseServerPresignErr9 = AppError.thirdPartySoftwareError(300417, "ERR-9 en la prefirma: Error realizando la prefirma")
    static let threePhaseServerPresignErr10 = AppError.thirdPartySoftwareError(300418, "ERR-10 en la prefirma: Error al almacenar el documento")
    static let threePhaseServerPresignErr11 = AppError.thirdPartySoftwareError(300419, "ERR-11 en la prefirma: Operacion desconocida")
    static let threePhaseServerPresignErr12 = AppError.thirdPartySoftwareError(300420, "ERR-12 en la prefirma: Error realizando la postfirma")
    static let threePhaseServerPresignErr13 = AppError.thirdPartySoftwareError(300421, "ERR-13 en la prefirma: No se indicado una sub-operacion valida a realizar (firma, cofirma,...)")
    static let threePhaseServerPresignErr14 = AppError.thirdPartySoftwareError(300422, "ERR-14 en la prefirma: Error al recuperar el documento")
    static let threePhaseServerPresignErr15 = AppError.thirdPartySoftwareError(300423, "ERR-15 en la prefirma: El formato de los datos de sesion suministrados es erroneo")
    static let threePhaseServerPresignErr16 = AppError.thirdPartySoftwareError(300424, "ERR-16 en la prefirma: Error al generar el codigo de verificacion de las firmas")
    static let threePhaseServerPresignErr17 = AppError.thirdPartySoftwareError(300425, "ERR-17 en la prefirma: Error al comprobar el codigo de verificacion de las firmas")
    static let threePhaseServerPresignErr18 = AppError.thirdPartySoftwareError(300426, "ERR-18 en la prefirma: Error de integridad en la firma")
    static let threePhaseServerPresignErr19 = AppError.thirdPartySoftwareError(300427, "ERR-19 en la prefirma: El formato de los datos de operacion suministrados es erroneo")
    static let threePhaseServerPresignErr20 = AppError.thirdPartySoftwareError(300428, "ERR-20 en la prefirma: Algoritmo de firma no soportado")
    static let threePhaseServerPresignErr21 = AppError.thirdPartySoftwareError(300429, "ERR-21 en la prefirma: Se requiere intervencion del usuario")
    
    static let threePhaseServerPostsignErr1 = AppError.thirdPartySoftwareError(300430, "ERR-1 en la postfirma. No se ha indicado la operacion a realizar")
    static let threePhaseServerPostsignErr2 = AppError.thirdPartySoftwareError(300431, "ERR-2 en la postfirma: No se ha indicado el identificador del documento")
    static let threePhaseServerPostsignErr3 = AppError.thirdPartySoftwareError(300432, "ERR-3 en la postfirma: No se ha indicado el algoritmo de firma")
    static let threePhaseServerPostsignErr4 = AppError.thirdPartySoftwareError(300433, "ERR-4 en la postfirma: No se ha indicado el formato de firma")
    static let threePhaseServerPostsignErr5 = AppError.thirdPartySoftwareError(300434, "ERR-5 en la postfirma: No se ha indicado el certificado de usuario")
    static let threePhaseServerPostsignErr6 = AppError.thirdPartySoftwareError(300435, "ERR-6 en la postfirma: El formato de los parametros adicionales suministrados es erroneo")
    static let threePhaseServerPostsignErr7 = AppError.thirdPartySoftwareError(300436, "ERR-7 en la postfirma: El certificado de usuario no esta en formato X.509")
    static let threePhaseServerPostsignErr8 = AppError.thirdPartySoftwareError(300437, "ERR-8 en la postfirma: Formato de firma no soportado")
    static let threePhaseServerPostsignErr9 = AppError.thirdPartySoftwareError(300438, "ERR-9 en la postfirma: Error realizando la prefirma")
    static let threePhaseServerPostsignErr10 = AppError.thirdPartySoftwareError(300439, "ERR-10 en la postfirma: Error al almacenar el documento")
    static let threePhaseServerPostsignErr11 = AppError.thirdPartySoftwareError(300440, "ERR-11 en la postfirma: Operacion desconocida")
    static let threePhaseServerPostsignErr12 = AppError.thirdPartySoftwareError(300441, "ERR-12 en la postfirma: Error realizando la postfirma")
    static let threePhaseServerPostsignErr13 = AppError.thirdPartySoftwareError(300442, "ERR-13 en la postfirma: No se indicado una sub-operacion valida a realizar (firma, cofirma,...)")
    static let threePhaseServerPostsignErr14 = AppError.thirdPartySoftwareError(300443, "ERR-14 en la postfirma: Error al recuperar el documento")
    static let threePhaseServerPostsignErr15 = AppError.thirdPartySoftwareError(300444, "ERR-15 en la postfirma: El formato de los datos de sesion suministrados es erroneo")
    static let threePhaseServerPostsignErr16 = AppError.thirdPartySoftwareError(300445, "ERR-16 en la postfirma: Error al generar el codigo de verificacion de las firmas")
    static let threePhaseServerPostsignErr17 = AppError.thirdPartySoftwareError(300446, "ERR-17 en la postfirma: Error al comprobar el codigo de verificacion de las firmas")
    static let threePhaseServerPostsignErr18 = AppError.thirdPartySoftwareError(300447, "ERR-18 en la postfirma: Error de integridad en la firma")
    static let threePhaseServerPostsignErr19 = AppError.thirdPartySoftwareError(300448, "ERR-19 en la postfirma: El formato de los datos de operacion suministrados es erroneo")
    static let threePhaseServerPostsignErr20 = AppError.thirdPartySoftwareError(300449, "ERR-20 en la postfirma: Algoritmo de firma no soportado")
    static let threePhaseServerPostsignErr21 = AppError.thirdPartySoftwareError(300450, "ERR-21 en la postfirma: Se requiere intervencion del usuario")
    
    
    // 3005XX: Biblioteca firma (código convertido en iOS)
    static let pdfIsPasswordProtected = AppError.thirdPartySoftwareError(300501, "El PDF está protegido por contraseña")
    static let pdfBadPassword = AppError.thirdPartySoftwareError(300502, "La contraseña del PDF no es correcta")
    static let pdfInvalidFormat = AppError.thirdPartySoftwareError(300503, "El documento no es un PDF soportado")
    static let pdfInvalidPageSelection = AppError.thirdPartySoftwareError(300504, "Se seleccionó una página no válida para la rúbrica del documento")
    static let pdfInvalidRubricPosition = AppError.thirdPartySoftwareError(300505, "Se seleccionó una posición no válida para la rúbrica del documento")
    static let pdfFormModified = AppError.thirdPartySoftwareError(300506, "Hay sospechas de que uno de los campos del formulario ha sido modificado después de una firma anterior")
    static let pdfSuspectedPSA = AppError.thirdPartySoftwareError(300507, "Hay sospechas de que el documento ha sido modificado después de una firma anterior")
    static let pdfUnregisteredSignatures = AppError.thirdPartySoftwareError(300508, "El documento tiene firmas anteriores sin registrar correctamente")
    static let pdfCertifiedDocument = AppError.thirdPartySoftwareError(300509, "El documento está certificado y una nueva firma puede invalidar las anteriores")
    static let unknownSignatureError = AppError.thirdPartySoftwareError(300510, "Error desconocido durante la operación")
    static let inputOutputError = AppError.thirdPartySoftwareError(300511, "Error en una operación de lectura/escritura")
    static let unknownSevereError = AppError.thirdPartySoftwareError(300512, "Error desconocido grave")
    static let localSignDataError = AppError.thirdPartySoftwareError(300513, "No se ha recibido los datos necesarios para hacer la firma. No se pueden obtener los datos del PDF a firmar o los datos del certificado")
    static let localSignPresignError = AppError.thirdPartySoftwareError(300514, "Error al hacer la prefirma. No se han obtenido datos")
    static let localSignAlgorithmError = AppError.thirdPartySoftwareError(300515, "No se ha podido obtener el algoritmo de firma a partir del hash de firma y el certificado")
    static let localSignSignatureError = AppError.thirdPartySoftwareError(300516, "No se ha podido generar la firma con el certificado y los datos de la prefirma")
    static let localSignPresignNotFoundError = AppError.thirdPartySoftwareError(300517, "Error al hacer la posfirma. No se ha realizado una prefirma previamente")
    static let localSignPostsignError = AppError.thirdPartySoftwareError(300518, "Error al hacer la posfirma. No se han obtenido datos")
}
    
/// Communication Error 4XXXXX problemas comunicaciones: Errores de comunicación con sistemas externos.
extension AppError {
    
    // 400XXX: Error general
    
    // 4011XX: Servidor intermedio (descarga)
    static let intermediateServerDownloadCommunicationError = AppError.communicationError(401100, "Error en la descarga de la firma")
    
    // 4012XX: Servidor intermedio (subida)
    static let intermediateServerUploadCommunicationError = AppError.communicationError(401200, "Error en la subida de datos")
    
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
    static let userOperationSaveCanceled = AppError.functionalError(500001, "Operación cancelada por el usuario.", .userCancelledSave)
    
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
    static let operationRequestNotFound = AppError.requestError(600001, "No ha llegado código de operación en la petición")
    static let operationRequestNotValid = AppError.requestError(600002, "La operación no esta soportada")
    static let fileIdButNotCipherKey = AppError.requestError(600005, "Es necesario descargar la información del servidor intermedio y no ha llegado la clave de cifrado")

    // 6001XX: Petición de firma
    static let signThreePhaseDataNotFound = AppError.requestError(600100, "No se ha recibido los datos en la petición ni el id del fichero a descargar para la operación de firma")
    static let signThreePhaseNotRtServletNotFound = AppError.requestError(600101, "Es necesario descargar la información del servidor intermedio, ha llegado el id de fichero pero no ha llegado la url del servidor de descarga para la operación de firma")
    static let signThreePhaseStServletNotFound = AppError.requestError(600102, "No se ha recibido la url del servlet para guardar la firma en la operación de firma")
    static let signThreePhaseIdNotFound = AppError.requestError(600103, "No se ha recibido el id del fichero a guardar para la operación de firma")
    static let signFormatNotFound = AppError.requestError(600104, "No se ha recibido el formato de firma para la firma")
    static let signFormatNotValid = AppError.requestError(600105, "El formato de firma no es válido")
    static let signAlgoNotFound = AppError.requestError(600106, "No se ha recibido el algoritmo de firma para la firma")
    static let signAlgoNotValid = AppError.requestError(600107, "El algoritmo de firma no es válido")
    static let datosInUseDecodeNotValid = AppError.requestError(600108, "Los datos de la operación no se han podido decodificar para la firma")
    
    // 6002XX: Petición de selección de certificados
    static let sendCertificateStServletNotFound = AppError.requestError(600200, "No se ha recibido la url del servlet para guardar el certificado en la operación de enviar certificado")
    static let sendCertificateIdNotFound = AppError.requestError(600201, "No se ha recibido el id del fichero a guardar para la operación de enviar certificado")
    
    // 6003XX: Petición de guardado de datos
    static let saveDataNotFound = AppError.requestError(600300, "No se ha recibido los datos en la petición ni el id del fichero a descargar para la operación de guardado")
    static let saveNotRtServletNotFound = AppError.requestError(600301, "Es necesario descargar la información del servidor intermedio, ha llegado el id de fichero pero no ha llegado la url del servidor de descarga para la operación de guardado")
    
    // 6004XX: Petición de lotes JSON
    static let batchsignDataNotFound = AppError.requestError(600400, "No se ha recibido los datos en la petición ni el id del fichero a descargar para la operación de firma de lotes")
    static let batchsignNotRtServletNotFound = AppError.requestError(600401, "Es necesario descargar la información del servidor intermedio, ha llegado el id de fichero pero no ha llegado la url del servidor de descarga para la operación de firma de lotes")
    static let batchsignStServletNotFound = AppError.requestError(600402, "No se ha recibido la url del servlet para guardar la firma en la operación de firma de lotes")
    static let batchsignIdNotFound = AppError.requestError(600403, "No se ha recibido el id del fichero a guardar para la operación de firma de lotes")
    static let batchsignDataErrorNotFound = AppError.requestError(600404, "No se ha recibido el dat para en la firma batch")
    static let batchsignPresignerUrlNotFound = AppError.requestError(600405, "No se ha recibido el batchpresignerurl en la firma batch")
    static let batchsignPostsignerUrlNotFound = AppError.requestError(600406, "No se ha recibido el batchpostsignerurl en la firma batch")
    static let batchsignDataParameterRequestNotValid = AppError.requestError(600407, "El data de la operación de firma batch no es un JSON válido")
    static let batchalghorithmNotFound = AppError.requestError(600408, "No se ha recibido el algoritmo de firma en la firma batch")
}
