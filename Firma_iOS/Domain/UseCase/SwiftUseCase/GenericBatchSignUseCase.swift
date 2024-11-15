//
//  GenericBatchSignUseCase.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 24/10/24.
//  © 2024 Solid GEAR. All rights reserved.
//

import Foundation

protocol BatchSignUseCaseDelegate: AnyObject {
    func didSuccessBatch(response: String)
    func didErrorBatch(error: Error)
}

class GenericBatchSignUseCase: NSObject, BatchRestDelegate, ServletRestDelegate {

    // MARK: - Properties
    
    var parametersBatch: InputParametersBatch?
    var completionHandler: ((String, Error?) -> Void)?
    var responseMessage: String = ""
    
    weak var delegate: BatchSignUseCaseDelegate?
    
    var bachRest: BachRest!
    var servletRest: ServletRest!

    // MARK: - Initialization
    
    override init() {
	   super.init()
	   self.bachRest = BachRest.init(delegate: self)
	   self.servletRest = ServletRest.init(delegate: self)
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

    func signBatch(dataOperation: [String: Any], completion: @escaping (String, Error?) -> Void) {
	   self.completionHandler = completion
	   self.parametersBatch = getDataOperation(dataOperation: dataOperation)
	   
	   if parametersBatch?.data == nil,
		 let rtServlet = parametersBatch?.rtservlet,
		 let fileId = parametersBatch?.fileId,
		 let cipherKey = dataOperation[PARAMETER_NAME_CIPHER_KEY] as? String {
		  servletRest.loadData(fromRtservlet: fileId, rtServlet: rtServlet, cipherKey: cipherKey)
	   } else {
		  preloadCertificateData()
	   }
    }
    
    // MARK: - Generic methods to Batch Sign
    
    func presign() {
	   guard let batch = parametersBatch else {
		  delegate?.didErrorBatch(error: ErrorGenerator.generateServerError(from: ServerErrorCodes.preSignatureError.rawValue))
		  return
	   }
	   
	   let validationError = validateDataOperation(parameterBatch: batch)
	   if let error = validationError {
		  servletRest.storeDataError(error.localizedDescription, stServlet: batch.stservlet, cipherKey: batch.cipherKey, docId: batch.identifier)
	   } else {
		  bachRest.bachPresign(batch.batchpresignerUrl, withJsonData: batch.data, withCerts: getCertificateData())
	   }
    }
    
    func postsign(triData: String) {
	   guard let batch = parametersBatch else {
		  delegate?.didErrorBatch(error: ErrorGenerator.generateServerError(from: ServerErrorCodes.postSignatureError.rawValue))
		  return
	   }
	   
	   bachRest.bachPostsign(batch.batchpostsignerUrl, withJsonData: batch.data, withCerts: getCertificateData(), withTriData: triData)
    }
    
    func handleSuccess(response: String) {
	   delegate?.didSuccessBatch(response: response)
    }
    
    
    func didSuccessBachPresign(_ responseDict: [AnyHashable : Any]) {
	   let stServlet = parametersBatch!.stservlet
	   let cipherKey = parametersBatch!.cipherKey
	   let identifier = parametersBatch!.identifier
	   
	   guard let presignsOk = responseDict["td"] as? [String: Any],
		    var dataPostSignBase64 = parametersBatch?.data else {
			 let error = ErrorGenerator.generateServerError(from: ServerErrorCodes.preSignatureError.rawValue)
		  servletRest.storeDataError(error.localizedDescription, stServlet: stServlet, cipherKey: cipherKey, docId: identifier)
		  return
	   }
	   
	   if let signsArray = presignsOk["signs"] as? [[String: Any]] {
		  for sign in signsArray {
			 if let signInfo = sign["signinfo"] as? [[String: Any]],
			    var params = signInfo.first?["params"] as? [String: Any] {
				let pre = params[PRE] as? String ?? ""
				let pk1Decoded = params[PK1_DECODED] as? Bool ?? false
				
				let pk1 = self.sign(pre: pre, algorithm: getAlgorithm(), pk1Decoded: pk1Decoded)
				
				if pk1.isEmpty {
				    let error = ErrorGenerator.generateServerError(from: ServerErrorCodes.unsupportedSignatureFormat.rawValue)
				    servletRest.storeDataError(error.localizedDescription, stServlet: stServlet, cipherKey: cipherKey, docId: identifier)
				    return
				}
				
				params["PK1"] = pk1
				
				if let needPre = params["NEED_PRE"] as? String, needPre == "false" {
				    params.removeValue(forKey: "PRE")
				    params.removeValue(forKey: "NEED_PRE")
				}
			 }
		  }
	   }
	   
	   if let resultsArray = responseDict["results"] as? [[String: Any]] {
		  updateDataWithErrors(resultsArray)
		  dataPostSignBase64 = encodeOperationToBase64()
	   }
	   
	   let base64tridata = encodeResponseToBase64(presignsOk)
	   postsign(triData: base64tridata)
    }
    
    func didErrorBachPresign(_ errorMessage: String) {
	   let error = ErrorGenerator.generateServerError(from: errorMessage)
	   self.servletRest.storeDataError(
		  error.localizedDescription,
		  stServlet: self.parametersBatch?.stservlet ?? "",
		  cipherKey: self.parametersBatch?.cipherKey ?? "",
		  docId: self.parametersBatch?.identifier ?? ""
	   )
    }
    
    func didSuccessBachPostsign(_ responseDict: [AnyHashable : Any]) {
	   do {
		  let jsonData = try JSONSerialization.data(withJSONObject: responseDict, options: .prettyPrinted)
		  
		  if let signs = responseDict["signs"] as? [[String: Any]] {
			 for signDict in signs {
				if let result = signDict["result"] as? String, result != "DONE_AND_SAVED" {
				    break
				}
			 }
		  }

		  self.servletRest.store(
			 jsonData,
			 certificateBase64: getCertificateData(),
			 stServlet: self.parametersBatch?.stservlet ?? "",
			 cipherKey: self.parametersBatch?.cipherKey ?? "",
			 docId: self.parametersBatch?.identifier ?? ""
		  )
		  
	   } catch {
		  let error = ErrorGenerator.generateServerError(from: ServerErrorCodes.preSignatureError.rawValue)
		  self.servletRest.storeDataError(error.localizedDescription, stServlet: self.parametersBatch?.stservlet ?? "", cipherKey: self.parametersBatch?.cipherKey ?? "", docId: self.parametersBatch?.identifier ?? "")
	   }
    }
    
    func didErrorBachPostsign(_ errorMessage: String) {
	   self.servletRest.storeDataError(
		  errorMessage,
		  stServlet: self.parametersBatch?.stservlet ?? "",
		  cipherKey: self.parametersBatch?.cipherKey ?? "",
		  docId: self.parametersBatch?.identifier ?? ""
	   )
    }
    
    private func didSuccessLoadDataFromServer(_ responseDict: [String: Any]) {
	   self.parametersBatch = self.getDataOperation(dataOperation: responseDict)
	   self.preloadCertificateData()
    }
    
    func didErrorLoadData(fromServer errorMessage: String) {
	   self.servletRest.storeDataError(
		  errorMessage,
		  stServlet: self.parametersBatch?.stservlet ?? "",
		  cipherKey: self.parametersBatch?.cipherKey ?? "",
		  docId: self.parametersBatch?.identifier ?? ""
	   )
    }
    
    func didSuccessStoreData(_ response: String) {
        if (self.responseMessage == "batch_signs_generic_error") {
            if let completionHandler = self.completionHandler {
                completionHandler(responseMessage, ErrorGenerator.generateBatchError(from: ServerBatchErrorCodes.unknownServerError.rawValue))
            }
        } else {
            if let completionHandler = self.completionHandler {
                completionHandler(responseMessage, nil)
            }
        }
    }
    
    func didErrorStoreData(_ errorMessage: String) {
        if let completionHandler = self.completionHandler {
            completionHandler(responseMessage, ErrorGenerator.generateBatchError(from: ServerBatchErrorCodes.invalidDataOnSave.rawValue))
        }
    }
    
    // MARK: - Helper Functions

    func validateDataOperation(parameterBatch: InputParametersBatch?) -> NSError? {
	   guard let batch = parameterBatch else {
		  return ErrorGenerator.generateServerError(from: ServerErrorCodes.missingOperation.rawValue)
	   }
	   if batch.operation.isEmpty {
		  return ErrorGenerator.generateServerError(from: ServerErrorCodes.missingOperation.rawValue)
	   }
	   if batch.data.isEmpty {
		  return ErrorGenerator.generateServerError(from: ServerErrorCodes.invalidOperationDataFormat.rawValue)
	   }
	   if batch.stservlet.isEmpty {
		  return ErrorGenerator.generateServerError(from: ServerErrorCodes.documentRetrievalError.rawValue)
	   }
	   if batch.batchpresignerUrl.isEmpty {
		  return ErrorGenerator.generateServerError(from: ServerErrorCodes.preSignatureError.rawValue)
	   }
	   if batch.batchpostsignerUrl.isEmpty {
		  return ErrorGenerator.generateServerError(from: ServerErrorCodes.postSignatureError.rawValue)
	   }

	   let dataDictionary = parseDataBase64toDictionary(batch.data)
	   if dataDictionary == nil {
		  return ErrorGenerator.generateServerError(from: ServerErrorCodes.invalidOperationDataFormat.rawValue)
	   } else if dataDictionary?["algorithm"] == nil {
		  return ErrorGenerator.generateServerError(from: ServerErrorCodes.unsupportedSignatureAlgorithm.rawValue)
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
	   guard let data = parametersBatch?.data,
		    let dict = parseDataBase64toDictionary(data) else {
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
		  let json = try JSONSerialization.jsonObject(with: decodedData, options: []) as? [String: Any]
		  return json
	   } catch {
		  print("Error parsing base64 data: \(error.localizedDescription)")
		  return nil
	   }
    }
    
    private func updateDataWithErrors(_ errors: [[String: Any]]) {
	   guard let dataOperation = parseDataBase64toDictionary(parametersBatch?.data) else { return }
	   guard let singleSigns = dataOperation["singlesigns"] as? [[String: Any]] else { return }
	   
	   for error in errors {
		  let signId = error["id"] as? String
		  let result = error["result"] as? String
		  let description = error["description"] as? String
		  
		  for var singleSign in singleSigns {
			 if singleSign["id"] as? String == signId {
				singleSign["result"] = result
				singleSign["description"] = description
				singleSign.removeValue(forKey: "datareference")
				singleSign.removeValue(forKey: "format")
				singleSign.removeValue(forKey: "suboperation")
				singleSign.removeValue(forKey: "extraparams")
			 }
		  }
	   }
	   
	   parametersBatch?.data = encodeOperationToBase64(dataOperation)
    }
    
    private func encodeOperationToBase64(_ dataOperation: [String: Any]? = nil) -> String {
	   let operationData = dataOperation ?? parseDataBase64toDictionary(parametersBatch?.data)
	   guard let jsonData = try? JSONSerialization.data(withJSONObject: operationData ?? [:], options: .prettyPrinted) else {
		  return ""
	   }
	   return Base64Utils.encode(jsonData, urlSafe: true)
    }
    
    private func encodeResponseToBase64(_ response: [String: Any]) -> String {
	   guard let jsonData = try? JSONSerialization.data(withJSONObject: response, options: .prettyPrinted) else {
		  return ""
	   }
	   return Base64Utils.encode(jsonData, urlSafe: true)
    }
    
    func decodePK1Signature(_ signedData: Data) -> String {
	   let iosByteArray = IOSByteArray(nsData: signedData)
	   let decodedSignature = EsGobAfirmaCoreSignersPkcs1Utils.decodeSignature(with: iosByteArray)
	   return Base64Utils.encode(decodedSignature?.toNSData())
    }
}
