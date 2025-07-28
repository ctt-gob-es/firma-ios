//
//  ReceiveDataUseCase.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 18/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
import Foundation

public class ParseDataURLOperationUseCase: NSObject {
    private var opParameters: NSMutableDictionary = [:]
    private var url = ""
    private var numberRetries = 0;
    
    func execute(url: String,
	   completion: @escaping (Result<NSMutableDictionary, AppError>) -> Void
    ) {
        self.url = url
        // Parseamos la url de la peticion
	   guard let urlParameters = CADESSignUtils.parseUrl(url) as? [String: Any] else {
            self.sendError(error: AppError.invalidformatRequest, completion: completion)
		  return
	   }
        
        self.opParameters = NSMutableDictionary(dictionary: urlParameters)
        
        // Validamos los datos generales de la peticion
        if let appError = validateDataOperation() {
            self.sendError(error: appError, completion: completion)
            return
        }
        
        // Si nos llega datos a nil y nos llega fileId es necesario descargar informacion del servidor intermedio
        if (self.opParameters[PARAMETER_NAME_DAT] == nil && self.opParameters[PARAMETER_NAME_FILE_ID] != nil) {
            if let appError = downloadData(completion: completion) {
                self.sendError(error: appError, completion: completion)
                return
            }
        } else {
            DispatchQueue.main.async {
                completion(.success(self.opParameters))
            }
        }
    }
        
    private func validateDataOperation() -> AppError? {
        // Verificamos que llega codigo de operacion
        guard let operation = self.opParameters[PARAMETER_NAME_OPERATION] as? String else {
            return AppError.operationRequestNotFound;
        }
         
        // Verificamos que sea un código válido
        let validOperations = [OPERATION_SIGN, OPERATION_SELECT_CERTIFICATE, OPERATION_COSIGN, OPERATION_COUNTERSIGN, OPERATION_SAVE, OPERATION_BATCH]
        if !validOperations.contains(operation) {
            return AppError.operationRequestNotValid;
        }
        
        // Si es una operacion de firma batch es necesario que lleguen los datos o el file id. En firma batch no se selecciona fichero
        if (operation == OPERATION_BATCH && self.opParameters[PARAMETER_NAME_DAT] == nil && self.opParameters[PARAMETER_NAME_FILE_ID] == nil) {
            return AppError.batchsignDataNotFound;
        }
        
        return nil;
    }
    
    private func downloadData(completion: @escaping (Result<(NSMutableDictionary), AppError>) -> Void) -> AppError? {
        
        guard let operation = self.opParameters[PARAMETER_NAME_OPERATION] as? String else {
            return AppError.operationRequestNotFound;
        }
        
        // Verificamos que nos llegue el id del fichero
        guard let fileId = self.opParameters[PARAMETER_NAME_FILE_ID] as? String else {
            if (operation == OPERATION_SIGN) {
                return AppError.signThreePhaseDataNotFound
                
            } else if (operation == OPERATION_SAVE) {
                return AppError.saveDataNotFound
                
            } else if (operation == OPERATION_BATCH) {
                return AppError.batchsignDataNotFound
            }
            return AppError.generalSoftwareError
        }
        
        // Verificamos que nos llegue el servlet de descarga
        guard let rtServlet = self.opParameters[PARAMETER_NAME_RTSERVLET] as? String else {
            if (operation == OPERATION_SIGN) {
                return AppError.signThreePhaseNotRtServletNotFound
                
            } else if (operation == OPERATION_SAVE) {
                return AppError.saveNotRtServletNotFound
                
            } else if (operation == OPERATION_BATCH) {
                return AppError.batchsignNotRtServletNotFound
            }
            
            return AppError.generalSoftwareError
        }
        
        
        IntermediateServerRest().downloadDataXML(rtServlet: rtServlet, fileId: fileId) { result in
            switch result {
                case .success(let data):
                    self.handleDownloadData(data: data, completion: completion)
                case .failure(let error):
                    self.sendError(error: error, completion: completion)
            }
        }
        return nil
    }
    
    private func handleDownloadData(
	   data: Data,
	   completion: @escaping (Result<NSMutableDictionary, AppError>) -> Void
    ) {
	   if String(data: data, encoding: .utf8)?.hasPrefix("ERR") == true{
            // Si llega ERR-06 se reintenta la peticion hasta un maximo de 3 veces
            if String(data: data, encoding: .utf8)?.hasPrefix("ERR-06") == true && numberRetries < 3 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    self.execute(url: self.url, completion: completion)
                    self.numberRetries += 1
                }
            } else {
                // Devolvemos error
                sendError(error: AppError.intermediateServerDownloadErrorResponse, completion: completion)
            }
        } else {
            var dataResponse = data
            
            // Si llega la clave de cifrado es necesario descifrar los datos. En caso contrario no hace falta
            if let cipherKey = self.opParameters[PARAMETER_NAME_CIPHER_KEY] as? String {
                guard let cipherKeyCertData = cipherKey.data(using: .utf8) else {
                    self.sendError(error: AppError.intermediateServerDownloadDataCipher, completion: completion)
                    return
                }
                
                guard let decoded = DesCypher.decypherData(String(data: data, encoding: .utf8) ?? "", sk: cipherKeyCertData) else {
                    self.sendError(error: AppError.intermediateServerDownloadDataCipher, completion: completion)
                    return
                }
             
                dataResponse = decoded
            } else {
                
                if let base64String = String(data: dataResponse, encoding: .utf8), let decoded = Data(base64Encoded: base64String) {
                    dataResponse = decoded
                }
            }
            
            loadDownloadData(dataResponse, completion: completion)
        }
    }
    
    private func loadDownloadData(
	   _ decodedData: Data,
	   completion: @escaping (Result<NSMutableDictionary, AppError>) -> Void
    ) {
        
        var datosInUse = String(data: decodedData, encoding: .utf8)
        datosInUse = datosInUse?.removingPercentEncoding
        
        guard let entidad = AOXMLReader().loadXML(by: datosInUse ?? "") else {
            self.sendError(error: AppError.intermediateServerDownloadErrorResponseFormatXML, completion: completion)
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
        opParameters[PARAMETER_NAME_FILENAME] = (entidad as AnyObject).filename ?? ""
        
        if let sticky = (entidad as AnyObject).sticky {
            opParameters[PARAMETER_NAME_STICKY] =  sticky
        }
        if let resetsticky = (entidad as AnyObject).resetsticky {
            opParameters[PARAMETER_NAME_RESET_STICKY] = resetsticky
        }
        
        DispatchQueue.main.async {
            completion(.success(self.opParameters))
        }
    }
    
    public func getOpParameters() -> NSMutableDictionary {
        return opParameters;
    }
    
    private func sendError(error: AppError, completion: @escaping (Result<NSMutableDictionary, AppError>) -> Void) {
        if let stServlet = opParameters[PARAMETER_NAME_STSERVLET] as? String, let docId = opParameters[PARAMETER_NAME_ID] as? String {
            IntermediateServerRest().storeDataError(error: error, stServlet: stServlet, docId: docId, completion: { _ in
                // Tanto si pudimos guardar en el servidor intermedio como no, devolvemos el error original
                completion(.failure(error))
            })
        } else {
            // Si no tenemos datos del servidor intermedio para guardar error, no guardamos los datos
            completion(.failure(error))
        }
    }
}
