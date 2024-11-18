//
//  GenericBatchSignUseCase.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 24/10/24.
//  © 2024 Solid GEAR. All rights reserved.
//

import Foundation

enum BatchResult {
    case ok
    case signsWithError
    case allSignWihtError
}


class GenericBatchSignUseCase: NSObject {
    

    // MARK: - Properties
    
    var parametersBatch = InputParametersBatch()
    var completionHandler: ((Result<BatchResult, ErrorInfo>) -> Void)?

    var result : BatchResult?
    
    // MARK: - Initialization
    
    override init() {
	   super.init()
    }

    // MARK: - Methods to override
    func getCertificateData() -> String {
	   fatalError("This method should be overridden")
    }
    
    func sign(pre: String, algorithm: String, pk1Decoded: Bool) -> String {
	   fatalError("Must override in subclass")
    }
    
    // MARK: - Before presign we need the certificate data, the method should be overriden to connect with the DNIE
    func preloadCertificateData() {
	   presign()
    }

    func signBatch(dataOperation: [String: Any], completion: @escaping (Result<BatchResult, ErrorInfo>) -> Void) {
        self.result = nil
	   self.completionHandler = completion
	   self.parametersBatch = getDataOperation(dataOperation: dataOperation)
	   
	   if parametersBatch.data == "" {
            
            IntermediateServerRest().downloadDataJSON(rtServlet: parametersBatch.rtservlet, fileId: parametersBatch.fileId, completion: { responseDict, errorInfo in
                
                if let errorInfo = errorInfo {
                    self.sendError(errorInfo: errorInfo)
                } else {
                    if let responseDict = responseDict {
                        self.parametersBatch = self.getDataOperation(dataOperation: responseDict)
                        self.preloadCertificateData()
                    }
                }
            })
	   } else {
		  preloadCertificateData()
	   }
    }
    
    // MARK: - Generic methods to Batch Sign
    
    func presign() {
	   let validationError = validateDataOperation()
	   if let error = validationError {
            sendError(errorInfo: error)
        } else {
            BatchSignRest().bachPresign(urlPresign: parametersBatch.batchpresignerUrl, json: parametersBatch.data, certs: getCertificateData(), completion: { json, error in
                
                if let json = json {
                    self.didSuccessBachPresign(json)
                } else {
                    if let error = error {
                        self.sendError(errorInfo: error)
                    }
                }
            })
        }
    }
    
    func postsign(jsonData: String, triData: String) {
        BatchSignRest().bachPostsign(urlPostsign: parametersBatch.batchpostsignerUrl, json: jsonData, certs: getCertificateData(), tridata: triData, completion: { json, error in
            if let json = json {
                self.didSuccessBachPostsign(json)
            } else {
                if let error = error {
                    self.sendError(errorInfo: error)
                }
            }
        })
    }
    
    func didSuccessBachPresign(_ responseDict: [AnyHashable : Any]) {

        var dataPostSignBase64 = parametersBatch.data
        
        if var presignsOk = responseDict["td"] as? [String: Any] {
            // Procesamos las firmas correctas que llegan en la prefirma
            if var signsArray = presignsOk["signs"] as? [[String: Any]] {
                for (index, var sign) in signsArray.enumerated() {
                    if var signInfo = sign["signinfo"] as? [[String: Any]],
                       var params = signInfo.first?["params"] as? [String: Any] {
                        let pre = params[PRE] as? String ?? ""
                        let pk1Decoded = params[PK1_DECODED] as? Bool ?? false
                        
                        let pk1 = self.sign(pre: pre, algorithm: getAlgorithm(), pk1Decoded: pk1Decoded)
                        
                        if pk1.isEmpty {
                            sendError(errorInfo: ErrorCodes.ServerErrorCodes.unsupportedSignatureFormat.info)
                            return
                        }
                        
                        params["PK1"] = pk1
                        
                        if (params["NEED_PRE"] == nil || (params["NEED_PRE"] as? String) == "false") {
                            params.removeValue(forKey: "PRE")
                            params.removeValue(forKey: "NEED_PRE")
                        }
                        
                        signInfo[0]["params"] = params
                        sign["signinfo"] = signInfo
                        signsArray[index] = sign
                    }
                }
                presignsOk["signs"] = signsArray
            }
            
            // Modificamos de los datos de la operacion las prefirmas erroneas para indicarles el error
            if let presignsError = responseDict["results"] as? [[String: Any]] {
                if var dataOperation = parseDataBase64toDictionary(dataPostSignBase64) {
                    for signError in presignsError {
                        let signId = signError["id"] as? String
                        let result = signError["result"] as? String
                        let description = signError["description"] as? String
                        
                        if var singleSigns = dataOperation["singlesigns"] as? [[String: Any]] {
                            
                            for (index, var singleSign) in singleSigns.enumerated() {
                            
                                if let singleSignId = singleSign["id"] as? String, singleSignId == signId {
                                    
                                    singleSign.removeValue(forKey: "datareference")
                                    singleSign.removeValue(forKey: "format")
                                    singleSign.removeValue(forKey: "suboperation")
                                    singleSign.removeValue(forKey: "extraparams")
                                    
                                    singleSign["result"] = result
                                    singleSign["description"] = description
                                }
                                
                                singleSigns[index] = singleSign
                            }
                            dataOperation["singlesigns"] = singleSigns
                        }
                    }
                    
                    if let dataOperationBase64 = encodeResponseToBase64(dataOperation) {
                        dataPostSignBase64 = dataOperationBase64
                    } else {
                        return sendError(errorInfo: ErrorCodes.ServerErrorCodes.invalidOperationDataFormat.info)
                    }
                } else {
                    // Error el data del parameters no es un Base64 valido
                    return sendError(errorInfo: ErrorCodes.ServerErrorCodes.invalidOperationDataFormat.info)
                }
            }
            
            if let base64tridata = encodeResponseToBase64(presignsOk) {
                postsign(jsonData: dataPostSignBase64, triData: base64tridata)
            } else {
                return sendError(errorInfo: ErrorCodes.ServerErrorCodes.invalidOperationDataFormat.info)
            }
        } else {
            // No llego el td en la respuesta. Puede que todo hayan sido prefirmas erroneas
            if let _ = responseDict["results"] as? [[String: Any]] {
                // Son todo prefirmas erroneas
                self.result = .allSignWihtError

                var jsonErrorSigns: [String: Any] = [:]
                jsonErrorSigns["signs"] = responseDict["results"]
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonErrorSigns, options: .prettyPrinted) else {
                    sendError(errorInfo: ErrorCodes.ServerErrorCodes.invalidOperationDataFormat.info)
                    return
                }
                
                storeData(data: jsonData)
            } else {
                sendError(errorInfo: ErrorCodes.ServerErrorCodes.invalidOperationDataFormat.info)
                return
            }
        }
    }
    
    func didErrorBachPresign(_ errorMessage: String) {
        let error = ErrorCodes.getThirdPartyOrCommunicationError(codigo: errorMessage)
        sendError(errorInfo: error.info)
    }
    
    private func sendError(errorInfo: ErrorInfo) {
        IntermediateServerRest().storeDataError(error: errorInfo, stServlet: self.parametersBatch.stservlet, docId: self.parametersBatch.identifier, completion: { _ in
            
            // Tanto si pudimos guardar en el servidor intermedio como no, devolvemos el error original
            if let completionHandler = self.completionHandler {
                completionHandler(.failure(errorInfo))
            }
        })
    }
    
    private func storeData(data: Data) {
        
        guard let cipherSign = DesCypher.cypherData(data, sk: self.parametersBatch.cipherKey.data(using: .utf8)!) else {
            sendError(errorInfo: ErrorCodes.InternalSoftwareErrorCodes.jsonBatchCipherSignError.info)
            return
        }
        
        guard let cipherCertificate = CipherUtils.cipherCertificateSend(certificateData: getCertificateData(), cipherKey: self.parametersBatch.cipherKey) else {
            sendError(errorInfo: ErrorCodes.InternalSoftwareErrorCodes.jsonBatchCipherCertificateError.info)
            return
        }
        
        let cipherData = "\(cipherSign)|\(cipherCertificate)"
        
        IntermediateServerRest().uploadData(dataUpload: cipherData, stServlet: self.parametersBatch.stservlet, docId: self.parametersBatch.identifier, completion: { result in
            
            if let completionHandler = self.completionHandler {
                switch result {
                case .success():
                    completionHandler(.success(self.result ?? .ok))
                case .failure(let errorInfo):
                    self.sendError(errorInfo: errorInfo);
                }
            }
        })
    }
    
    func didSuccessBachPostsign(_ responseDict: [AnyHashable : Any]) {
	   do {
		  let jsonData = try JSONSerialization.data(withJSONObject: responseDict, options: .prettyPrinted)
		  
            self.result = .ok
		  if let signs = responseDict["signs"] as? [[String: Any]] {
                let allSign = signs.count
                var signWithError = 0
			 for signDict in signs {
				if let result = signDict["result"] as? String, result != "DONE_AND_SAVED" {
                        signWithError += 1
				}
			 }
                if signWithError > 0 {
                    self.result = signWithError == allSign ? .allSignWihtError : .signsWithError
                }
		  }

            storeData(data: jsonData)
	   } catch {
            sendError(errorInfo: ErrorCodes.ServerErrorCodes.preSignatureError.info)
	   }
    }
    
    func didErrorBachPostsign(_ errorMessage: String) {
        let error = ErrorCodes.getThirdPartyOrCommunicationError(codigo: errorMessage)
        sendError(errorInfo: error.info)
    }
    
    // MARK: - Helper Functions

    func validateDataOperation() -> ErrorInfo? {
	   if parametersBatch.operation.isEmpty {
            return ErrorCodes.ServerErrorCodes.missingOperation.info
	   }
	   if parametersBatch.data.isEmpty {
            return ErrorCodes.ServerErrorCodes.invalidOperationDataFormat.info
	   }
	   if parametersBatch.stservlet.isEmpty {
            return ErrorCodes.ServerErrorCodes.documentRetrievalError.info
	   }
	   if parametersBatch.batchpresignerUrl.isEmpty {
            return ErrorCodes.ServerErrorCodes.preSignatureError.info
	   }
	   if parametersBatch.batchpostsignerUrl.isEmpty {
            return ErrorCodes.ServerErrorCodes.postSignatureError.info
	   }

	   let dataDictionary = parseDataBase64toDictionary(parametersBatch.data)
	   if dataDictionary == nil {
            return ErrorCodes.ServerErrorCodes.invalidOperationDataFormat.info
	   } else if dataDictionary?["algorithm"] == nil {
            return ErrorCodes.ServerErrorCodes.unsupportedSignatureAlgorithm.info
	   }

	   return nil
    }

    func getDataOperation(dataOperation: [String: Any]) -> InputParametersBatch {
	   let parameters = InputParametersBatch()
	   
	   parameters.operation = dataOperation[PARAMETER_NAME_OPERATION] as? String ?? ""
	   parameters.identifier = dataOperation[PARAMETER_NAME_ID] as? String ?? ""
	   parameters.cipherKey = dataOperation[PARAMETER_NAME_CIPHER_KEY] as? String ?? ""
	   parameters.stservlet = dataOperation[PARAMETER_NAME_STSERVLET] as? String ?? ""
	   parameters.batchpresignerUrl = dataOperation[PARAMETER_NAME_BATCH_PRESIGNER_URL] as? String ?? ""
	   parameters.batchpostsignerUrl = dataOperation[PARAMETER_NAME_BATCH_POSTSIGNER_URL] as? String ?? ""
	   parameters.data = dataOperation[PARAMETER_NAME_DAT] as? String ?? ""
	   
	   return parameters
    }
    
    func getAlgorithm() -> String {
	   guard let dict = parseDataBase64toDictionary(parametersBatch.data) else {
		  return ""
	   }
	   return dict[PARAMETER_NAME_ALGORITHM2] as? String ?? ""
    }
    
    func parseDataBase64toDictionary(_ base64String: String?) -> [String: Any]? {
	   guard let base64String = base64String,
		    let decodedData = Base64Utils.decode(base64String, urlSafe: true) else {
		  return nil
	   }
	   
	   do {
		  return try JSONSerialization.jsonObject(with: decodedData, options: []) as? [String: Any]
	   } catch {
		  print("Error parsing base64 data: \(error.localizedDescription)")
		  return nil
	   }
    }
    
    private func encodeResponseToBase64(_ response: [String: Any]) -> String? {
	   guard let jsonData = try? JSONSerialization.data(withJSONObject: response, options: .prettyPrinted) else {
		  return nil
	   }
	   return Base64Utils.encode(jsonData, urlSafe: true)
    }
    
    func decodePK1Signature(_ signedData: Data) -> String {
	   let iosByteArray = IOSByteArray(nsData: signedData)
	   let decodedSignature = EsGobAfirmaCoreSignersPkcs1Utils.decodeSignature(with: iosByteArray)
	   return Base64Utils.encode(decodedSignature?.toNSData())
    }
}
