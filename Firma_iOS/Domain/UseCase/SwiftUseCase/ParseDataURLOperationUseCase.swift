//
//  ReceiveDataUseCase.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 18/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
import Foundation

public class ParseDataURLOperationUseCase: NSObject {
    private var urlParameters : ParseURLParameters = ParseURLParameters()
    private var opParameters: NSMutableDictionary = [:]
    private var url = ""
    private var numberRetries = 0;
    
    func execute(url: String,
	   completion: @escaping (Result<NSMutableDictionary, ErrorInfo>) -> Void
    ) {
        self.url = url
        // Parseamos la url de la peticion
	   guard let urlParameters = CADESSignUtils.parseUrl(url) as? [String: Any] else {
            self.sendError(errorInfo: ErrorCodes.RequestErrorCodes.invalidformatRequest.info, completion: completion)
		  return
	   }
        
        self.opParameters = NSMutableDictionary(dictionary: urlParameters)
        
        // Validamos los datos generales de la peticion
        if let errorInfo = validateDataOperation() {
            self.sendError(errorInfo: errorInfo, completion: completion)
            return
        }
        
        // Si nos llega datos a nil y nos llega fileId es necesario descargar informacion del servidor intermedio
        if (self.opParameters[PARAMETER_NAME_DAT] == nil && self.opParameters[PARAMETER_NAME_FILE_ID] != nil) {
            downloadData(completion: completion)
        } else {
            DispatchQueue.main.async {
                completion(.success(self.opParameters))
            }
        }
    }
        
    private func validateDataOperation() -> ErrorInfo? {
        // Verificamos que llega codigo de operacion
        guard let operation = self.opParameters[PARAMETER_NAME_OPERATION] as? String else {
            return ErrorCodes.RequestErrorCodes.operationRequestNotFound.info;
        }
         
        // Verificamos que sea un código válido
        let validOperations = [OPERATION_SIGN, OPERATION_SELECT_CERTIFICATE, OPERATION_COSIGN, OPERATION_COUNTERSIGN, OPERATION_SAVE, OPERATION_BATCH]
        if !validOperations.contains(operation) {
            return ErrorCodes.RequestErrorCodes.operationRequestNotFound.info;
        }
        
        // Si es una operacion de firma batch es necesario que lleguen los datos o el file id. En firma batch no se selecciona fichero
        if (operation == OPERATION_BATCH && self.opParameters[PARAMETER_NAME_DAT] == nil && self.opParameters[PARAMETER_NAME_FILE_ID] == nil) {
            return ErrorCodes.RequestErrorCodes.operationDataNotFound.info;
        }
        
        return nil;
    }
    
    private func downloadData(completion: @escaping (Result<(NSMutableDictionary), ErrorInfo>) -> Void) {
        // Verificamos que nos llegue el id del fichero
        guard let fileId = self.opParameters[PARAMETER_NAME_FILE_ID] as? String else {
            self.sendError(errorInfo: ErrorCodes.RequestErrorCodes.operationDataNotFound.info, completion: completion)
            return;
        }
        
        // Verificamos que nos llegue el servlet de descarga
        guard let rtServlet = self.opParameters[PARAMETER_NAME_RTSERVLET] as? String else {
            self.sendError(errorInfo: ErrorCodes.RequestErrorCodes.operationNotRtServlet.info, completion: completion)
            return
        }
        
        // Verificamos que nos llegue la clave de cifrado
        guard let cipherKey = self.opParameters[PARAMETER_NAME_CIPHER_KEY] as? String else {
            self.sendError(errorInfo: ErrorCodes.RequestErrorCodes.fileIdButNotCipherKey.info, completion: completion)
            return
        }
        
        IntermediateServerRest().downloadDataXML(rtServlet: rtServlet, fileId: fileId) { result in
            switch result {
                case .success(let data):
                    self.handleDownloadData(data: data, cipherKey: cipherKey, completion: completion)
                case .failure(let error):
                    self.sendError(errorInfo: error, completion: completion)
            }
        }
    }
    
    private func handleDownloadData(
	   data: Data,
        cipherKey: String,
	   completion: @escaping (Result<NSMutableDictionary, ErrorInfo>) -> Void
    ) {
	   self.urlParameters.receivedDataCert = data
	     
        guard let cipherKeyCertData = cipherKey.data(using: .utf8) else {
            self.sendError(errorInfo: ErrorCodes.ThirdPartySoftwareErrorCodes.intermediateServerDownloadDataCipher.info, completion: completion)
            return
        }
        
        guard let decoded = DesCypher.decypherData(String(data: data, encoding: .utf8) ?? "", sk: cipherKeyCertData) else {
            self.sendError(errorInfo: ErrorCodes.ThirdPartySoftwareErrorCodes.intermediateServerDownloadDataCipher.info, completion: completion)
            return
        }
        
        if String(data: data, encoding: .utf8)?.hasPrefix("ERR-06") == true && numberRetries < 3 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                self.execute(url: self.url, completion: completion)
                self.numberRetries += 1
            }
        } else {
            loadDownloadData(decoded, completion: completion)
        }

    }
    
    private func loadDownloadData(
	   _ decodedData: Data,
	   completion: @escaping (Result<NSMutableDictionary, ErrorInfo>) -> Void
    ) {
        var datosInUse = String(data: decodedData, encoding: .utf8)
        datosInUse = datosInUse?.removingPercentEncoding
        
        guard let entidad = AOXMLReader().loadXML(by: datosInUse ?? "") else {
            self.sendError(errorInfo: ErrorCodes.ThirdPartySoftwareErrorCodes.intermediateServerDownloadErrorResponseFormatXML.info, completion: completion)
            return
        }
        
        opParameters[PARAMETER_NAME_DAT] = (entidad as AnyObject).datField ?? ""
        opParameters[PARAMETER_NAME_FORMAT] = (entidad as AnyObject).formatField ?? ""
        opParameters[PARAMETER_NAME_ALGORITHM2] = (entidad as AnyObject).algorithmField ?? ""
        opParameters[PARAMETER_NAME_PROPERTIES] = (entidad as AnyObject).propertiesField ?? ""
        opParameters[PARAMETER_NAME_ID] = (entidad as AnyObject).idField ?? ""
        opParameters[PARAMETER_NAME_STSERVLET] = (entidad as AnyObject).stServletField ?? ""
        opParameters[PARAMETER_NAME_BATCH_PRESIGNER_URL] = (entidad as AnyObject).batchpresignerurl ?? ""
        opParameters[PARAMETER_NAME_BATCH_POSTSIGNER_URL] = (entidad as AnyObject).batchpostsignerurl ?? ""
        opParameters[PARAMETER_NAME_BATCH_JSON] = (entidad as AnyObject).batchjson ?? ""
        
        DispatchQueue.main.async {
            completion(.success(self.opParameters))
        }
    }
    
    private func sendError(errorInfo: ErrorInfo, completion: @escaping (Result<NSMutableDictionary, ErrorInfo>) -> Void) {
        if let stServlet = opParameters[PARAMETER_NAME_STSERVLET] as? String, let docId = opParameters[PARAMETER_NAME_ID] as? String {
            IntermediateServerRest().storeDataError(error: errorInfo, stServlet: stServlet, docId: docId, completion: { _ in
                // Tanto si pudimos guardar en el servidor intermedio como no, devolvemos el error original
                completion(.failure(errorInfo))
            })
        } else {
            // Si no tenemos datos del servidor intermedio para guardar error, no guardamos los datos
            completion(.failure(errorInfo))
        }
    }
}
