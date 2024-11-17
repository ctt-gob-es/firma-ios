//
//  SingleSignUseCase.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 24/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class GenericSignUseCase {
    private let presignRest: PresignRest = PresignRest()
    let postSignRest: PostSignRest = PostSignRest()
    
    var signModel: SignModel
    
    var completionCallback: ((Result<Bool, Error>) -> Void)?
    
    init(signModel: SignModel) {
	   self.signModel = signModel
    }
    
    func getCertificateData() -> String? {
	   fatalError("This method must be overrided")
    }
    
    func getPKCS1Sign(dataToSign: Data, algorithm: String) -> Data? {
	   fatalError("This method must be overrided")
    }
    
    
    func singleSign(completion: @escaping (Result<Bool, Error>) -> Void) {
	   self.completionCallback = completion
	   if validateData() {
		  configure()
	   }
    }
    
    private func validateData() -> Bool {
	   let supportedFormats: [String] = [
		  CADES_FORMAT,
		  CADES_TRI_FORMAT,
		  PADES_FORMAT,
		  PADES_TRI_FORMAT,
		  XADES_FORMAT,
		  XADES_TRI_FORMAT,
		  NONE_TRI_FORMAT,
		  NONE_FORMAT,
		  FACTURAE_FORMAT,
		  FACTURAE_TRI_FORMAT
	   ]
	   
	   guard let signFormat = signModel.signFormat, supportedFormats.contains(signFormat) else {
		  self.handleSignError(error: ErrorCodes.ServerErrorCodes.unsupportedSignatureFormat)
		  return false
	   }
	   
	   guard let urlServlet = signModel.urlServlet, !urlServlet.isEmpty else {
		  self.handleSignError(error: ErrorCodes.ServerErrorCodes.unknownOperation)
		  return false
	   }
	   
	   guard let signAlgoInUse = signModel.signAlgoInUse, CADESSignUtils.isValidAlgorithm(signAlgoInUse) else {
		  self.handleSignError(error: ErrorCodes.ServerErrorCodes.unsupportedSignatureAlgorithm)
		  return false
	   }
	   
	   guard let docId = signModel.docId, !docId.isEmpty else {
		  self.handleSignError(error: ErrorCodes.ServerErrorCodes.missingDocumentID)
		  return false
	   }
	   
	   guard let operation = signModel.operation,
		    operation == OPERATION_SIGN ||
		    operation == OPERATION_COSIGN ||
		    operation == OPERATION_COUNTERSIGN else {
            self.handleSignError(error: ErrorCodes.ServerErrorCodes.invalidSubOperation)
		  return false
	   }
	   
	   //TODO: CHECK THE TARGET ERRORS
	   /*if let encodedTarget = signModel.extraParams {
		  if let decodedData = Base64Utils.decode(encodedTarget, urlSafe: true),
			let target = String(data: decodedData, encoding: .utf8) {
			 
			 let validTargets = [PARAMETER_NAME_TARGET_TREE, PARAMETER_NAME_TARGET_LEAFS]
			 if !validTargets.contains(target) {
				let error = ErrorGenerator.generateError(from: ServerErrorCodes.invalidAdditionalParamsFormat)
				self.handleSignError(error: error, completion: self.completionCallback!)
				return false
			 }
		  } else {
			 let error = ErrorGenerator.generateError(from: ServerErrorCodes.invalidAdditionalParamsFormat)
			 self.handleSignError(error: error, completion: self.completionCallback!)
			 return false
		  }
	   }*/
	   
	   return true
    }
    
    func startSign() {
	   if (signModel.signFormat == NONE_FORMAT)
	   {
		  //THIS IS MONOPHASIC SIGN
		  self.singleSignMonophasic()
	   } else {
		  //THIS IS TRIPHASIC SIGN
		  self.presign()
	   }
    }
    
    func configure() {
	   //Generic does not need any additional configuration, but DNISingleSign is overriding it
	   startSign()
    }

    
    func singleSignMonophasic() {
	   guard let datosInUse = signModel.datosInUse,
		    let _ = signModel.signFormat,
		    let signAlgoInUse = signModel.signAlgoInUse else {
            handleSignError(error: ErrorCodes.InternalSoftwareErrorCodes.signingError)
		  return
	   }
	   
	   guard let decodedDatosInUse = Base64Utils.decode(datosInUse, urlSafe: true) else {
            handleSignError(error: ErrorCodes.InternalSoftwareErrorCodes.signingError)
		  return
	   }
	   
	   guard let pkcs1 = getPKCS1Sign(dataToSign: decodedDatosInUse, algorithm: signAlgoInUse),
		    let encodedPKCS1 = Base64Utils.encode(pkcs1, urlSafe: true)
	   else {
            handleSignError(error: ErrorCodes.InternalSoftwareErrorCodes.signingError)
		  return
	   }
	   
	   storeData(dataSign: encodedPKCS1)
    }
    
    func presign() {
	   guard let operation = signModel.operation,
		    let datosInUse = signModel.datosInUse,
		    let signFormat = signModel.signFormat,
		    let signAlgoInUse = signModel.signAlgoInUse,
		    let certificateData = getCertificateData() else {
            handleSignError(error: ErrorCodes.InternalSoftwareErrorCodes.signingError)
		  return
	   }
	   
	   if CADESSignUtils.isValidAlgorithm(signAlgoInUse) {
		  preSign(
			 operation: operation,
			 datosInUse: datosInUse,
			 signFormat: signFormat,
			 signAlgoInUse: signAlgoInUse,
			 certificateData: certificateData,
			 extraParams: signModel.extraParams,
			 triphasicServerURL: signModel.triphasicServerURL,
			 rtServlet: signModel.rtServlet,
			 completion: { result in
				self.handlePresingResult(result: result)
			 })
	   } else {
            handleSignError(error: ErrorCodes.InternalSoftwareErrorCodes.appConfigurationError)
	   }
    }
    
    private func handlePresingResult(result: Result<String, Error>) {
	   guard let signFormat = signModel.signFormat,
		    let signAlgoInUse = signModel.signAlgoInUse else {
            handleSignError(error: ErrorCodes.FunctionalErrorCodes.signatureOperationError)
		  return
	   }
	   
	   switch result {
		  case .success(let serverResponse):
			 if serverResponse.contains(ERR_PASSWORD_PROTECTED) || serverResponse.contains(ERR_BAD_PASSWORD) {
				handleRetryWithPassword()
			 } else {
				if let range = serverResponse.range(of: ":") {
                        let errorCodeServer = String(serverResponse[..<range.lowerBound])
                        handleSignError(error: ErrorCodes.getServerError(codigo: errorCodeServer))
				}
			 }
			 
			 guard let pkcs1 = generatePKCS1(
				    dataReceivedb64: serverResponse,
				    signAlgoInUse: signAlgoInUse,
				    signFormat: signFormat
				  )  else {
				if self is SingleSignUseCase {
                        handleSignError(error: ErrorCodes.InternalSoftwareErrorCodes.signingError)
				}
				return
			 }
			 postsign(encodedData: pkcs1)
			 
		  case .failure(_):
			 handleSignError(error: ErrorCodes.CommunicationErrorCodes.threePhaseSignatureError)
	   }
    }
    
    private func postsign(encodedData: Data) {
	   guard let operation = signModel.operation,
		    let datosInUse = signModel.datosInUse,
		    let signFormat = signModel.signFormat,
		    let signAlgoInUse = signModel.signAlgoInUse,
		    let certificateData = getCertificateData() else {
            handleSignError(error: ErrorCodes.CommunicationErrorCodes.signatureUploadError)
		  return
	   }
	   postSign(
		  operation: operation,
		  dict: ["": ""],
		  datosInUse: datosInUse,
		  signFormat: signFormat,
		  signAlgoInUse: signAlgoInUse,
		  base64UrlSafeCertificateData: certificateData,
		  extraParams: signModel.extraParams,
		  encodedData: encodedData,
		  triphasicServerURL: signModel.triphasicServerURL,
		  rtServlet: signModel.rtServlet,
		  completion: { result in
			 self.handlePostSignResult(
				result: result
			 )
		  })
    }
    
    func handlePostSignResult(result: Result<Data, Error>) {
	   switch result {
		  case .success(let postSignResult):
			 if let responseString = String(data: postSignResult, encoding: .utf8) {
				if responseString.contains("OK") {
				    if let range = responseString.range(of: "=") {
					   let parte2 = String(responseString[range.upperBound...])
					   storeData(dataSign: parte2)
				    } else {
                            handleSignError(error: ErrorCodes.FunctionalErrorCodes.signatureOperationError)
				    }
				} else {
                        if let range = responseString.range(of: ":") {
                            let errorCodeServer = String(responseString[..<range.lowerBound])
                            handleSignError(error: ErrorCodes.getServerError(codigo: errorCodeServer))
				    } else {
                            handleSignError(error: ErrorCodes.FunctionalErrorCodes.signatureOperationError)
				    }
				}
			 } else {
                    handleSignError(error: ErrorCodes.FunctionalErrorCodes.signatureOperationError)
			 }
			 
		  case .failure(_):
                handleSignError(error: ErrorCodes.CommunicationErrorCodes.threePhaseSignatureError)
	   }
    }
    
    func preSign(
	   operation: String,
	   datosInUse: String,
	   signFormat: String,
	   signAlgoInUse: String,
	   certificateData: String,
	   extraParams: String?,
	   triphasicServerURL: String?,
	   rtServlet: String?,
	   completion: @escaping (Result<String, Error>) -> Void
    ) {
	   presignRest.performPresignRequest(
		  operation: operation,
		  datosInUse: datosInUse,
		  signFormat: signFormat,
		  signAlgoInUse: signAlgoInUse,
		  certificateData: certificateData,
		  extraParams: extraParams,
		  triphasicServerURL: triphasicServerURL,
		  rtServlet: rtServlet
	   ) { result in
		  switch result {
			 case .success(let response):
				completion(.success(response))
			 case .failure(let error):
				completion(.failure(error))
		  }
	   }
    }
    
    func generatePKCS1(
	   dataReceivedb64: String,
	   signAlgoInUse: String,
	   signFormat: String?
    ) -> Data? {
	   guard let dataReceived = Base64Utils.decode(dataReceivedb64, urlSafe: true) else {
		  print("Failed to decode base64 data")
		  return nil
	   }
	   
	   guard String(data: dataReceived, encoding: .utf8) != nil else {
		  print(dataReceivedb64)
		  return nil
	   }
	   
	   let parser = AOCounterSignXMLParser()
	   guard let firmas = parser.parseXML(dataReceived) else {
		  print("Failed to parse XML")
		  return nil
	   }
	   
	   for firma in firmas {
		  guard let pre = (firma as AnyObject).params[PRE] as? String else {
			 print("Missing PRE in params")
			 continue
		  }
		  
		  let pk1Decoded = (firma as AnyObject).params[PK1_DECODED] as? Bool ?? false
		  
		  var preClean = pre.replacingOccurrences(of: "\n", with: "")
		  preClean = preClean.replacingOccurrences(of: " ", with: "")
		  
		  guard let data = Base64Utils.decode(preClean, urlSafe: true), data.count > 0 else {
			 print("Failed to decode base64 data or data is empty")
			 continue
		  }
		  
		  guard let dataSigned = getPKCS1Sign(dataToSign: data, algorithm: signAlgoInUse)
		  else {
			 print("Failed to sign data")
			 return nil
		  }
		  
		  // Si nos llega del servidor intermedio el pk1Decoded a true entonces tenemos que decodificar el PKCS#1 antes de pasarlo a Base64 y enviarlo al servidor
		  if pk1Decoded {
			 let stringSigned = Firma().processDataAndReturnEncodedString(dataSigned)
			 (firma as AnyObject).params["PK1"] = stringSigned
		  } else {
			 let stringSigned = dataSigned.base64EncodedString()
			 (firma as AnyObject).params["PK1"] = stringSigned
		  }
	   }
	   
	   let preItems = AOCounterSignPreItems()
	   
	   guard let newXML = preItems.generateXML(firmas) else {
		  print("Failed to generate XML")
		  return nil
	   }
	   let newXMLClean = newXML.trimmingCharacters(in: .whitespacesAndNewlines)
	   guard let encodedData = newXMLClean.data(using: .utf8) else {
		  print("Failed to convert XML string to data")
		  return nil
	   }
	   
	   return encodedData
    }
    
    func postSign(
	   operation: String,
	   dict: [String: String],
	   datosInUse: String,
	   signFormat: String,
	   signAlgoInUse: String,
	   base64UrlSafeCertificateData: String,
	   extraParams: String?,
	   encodedData: Data,
	   triphasicServerURL: String?,
	   rtServlet: String?,
	   completion: @escaping (Result<Data, Error>) -> Void
    ) {
	   postSignRest.postSign(
		  operation: operation,
		  dict: dict,
		  datosInUse: datosInUse,
		  signFormat: signFormat,
		  signAlgoInUse: signAlgoInUse,
		  base64UrlSafeCertificateData: base64UrlSafeCertificateData,
		  extraParams: extraParams,
		  encodedData: encodedData,
		  triphasicServerURL: triphasicServerURL,
		  rtServlet: rtServlet,
		  completion: completion
	   )
    }
    
    
    /*func loadCertificateAndRetrieveValues(
	   certName: String,
	   password: String,
	   fromDocument: Bool,
	   completion: @escaping (String?, SecKey?) -> Void
    ) {
	   DispatchQueue.global(qos: .background).async {
		  self.certificateUtils?.selectedCertificateName = certName
		  let status = self.certificateUtils?.loadCertKeyChain(withName: certName, password: password, fromDocument: fromDocument)
		  
		  guard status == errSecSuccess else {
			 print("Failed to load certificate with status: \(status ?? -1)")
			 DispatchQueue.main.async {
				completion(nil, nil)
			 }
			 return
		  }
		  
		  let base64UrlSafeCertificateData = self.certificateUtils?.base64UrlSafeCertificateData
		  let privateKey = self.certificateUtils?.privateKey
		  
		  DispatchQueue.main.async {
			 completion(base64UrlSafeCertificateData, privateKey)
		  }
	   }
    }*/
    
    func handleSignError(error: ErrorCodeProtocol) {
	   print(error)
        if let completionCallback = completionCallback {
            completionCallback(.failure(error.info))
        }
    }
    
    func handleRetryWithPassword() {
        if let completionCallback = completionCallback {
            completionCallback(.success(true))
        }
    }
    
    private func storeData(dataSign: String) {
	   guard let urlServlet = signModel.urlServlet,
		    let cipherKey = signModel.cipherKey,
		    let docId = signModel.docId,
		    let certificateData = getCertificateData() else {
		  return
	   }
	   
	   let storeDataUseCase = StoreDataUseCase(
		  urlServlet: urlServlet,
		  cipherKey: cipherKey,
		  docId: docId,
		  base64UrlSafeCertificateData: certificateData
	   )
	   
	   storeDataUseCase.storeData(dataSign: dataSign, completion: { result in
		  switch result {
            case .success(let storeDataServerResponse):
                if let response = String(data: storeDataServerResponse, encoding: .utf8) {
                    if response == OK {
                        if let completionCallback = self.completionCallback {
                            completionCallback(.success(false))
                        }
                    } else {
                        self.handleSignError(error: ErrorCodes.CommunicationErrorCodes.dataSavingUploadError)
                    }
                }
            case .failure(_):
                self.handleSignError(error: ErrorCodes.CommunicationErrorCodes.dataSavingUploadError)
		  }
	   })
    }
}
