//
//  SingleSignUseCase.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 24/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class GenericSignUseCase {
    private let threePhaseServerRest = ThreePhaseServerRest()
    
    var signModel: SignModel
    
    var completionCallback: ((Result<Bool, ErrorInfo>) -> Void)?
    
    init(signModel: SignModel) {
	   self.signModel = signModel
    }
    
    func getCertificateData() -> String? {
	   fatalError("This method must be overrided")
    }
    
    func getPKCS1Sign(dataToSign: Data, algorithm: String) -> Data? {
	   fatalError("This method must be overrided")
    }
    
    
    func singleSign(completion: @escaping (Result<Bool, ErrorInfo>) -> Void) {
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
            sendError(error: ErrorCodes.ServerErrorCodes.unsupportedSignatureFormat)
		  return false
	   }
	   
	   guard let urlServlet = signModel.urlServlet, !urlServlet.isEmpty else {
            sendError(error: ErrorCodes.ServerErrorCodes.unknownOperation)
		  return false
	   }
	   
	   guard let signAlgoInUse = signModel.signAlgoInUse, CADESSignUtils.isValidAlgorithm(signAlgoInUse) else {
		  sendError(error: ErrorCodes.ServerErrorCodes.unsupportedSignatureAlgorithm)
		  return false
	   }
	   
	   guard let docId = signModel.docId, !docId.isEmpty else {
		  sendError(error: ErrorCodes.ServerErrorCodes.missingDocumentID)
		  return false
	   }
	   
	   guard let operation = signModel.operation,
		    operation == OPERATION_SIGN ||
		    operation == OPERATION_COSIGN ||
		    operation == OPERATION_COUNTERSIGN else {
            sendError(error: ErrorCodes.ServerErrorCodes.invalidSubOperation)
		  return false
	   }
	   
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
            sendError(error: ErrorCodes.InternalSoftwareErrorCodes.signingError)
		  return
	   }
	   
	   guard let decodedDatosInUse = Base64Utils.decode(datosInUse, urlSafe: true) else {
            sendError(error: ErrorCodes.InternalSoftwareErrorCodes.signingError)
		  return
	   }
	   
	   guard let pkcs1 = getPKCS1Sign(dataToSign: decodedDatosInUse, algorithm: signAlgoInUse),
		    let encodedPKCS1 = Base64Utils.encode(pkcs1, urlSafe: true)
	   else {
            sendError(error: ErrorCodes.InternalSoftwareErrorCodes.signingError)
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
            sendError(error: ErrorCodes.InternalSoftwareErrorCodes.signingError)
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
			 rtServlet: signModel.rtServlet)
	   } else {
            sendError(error: ErrorCodes.InternalSoftwareErrorCodes.appConfigurationError)
	   }
    }
    
    private func handlePresingResult(result: String) {
	   guard let signFormat = signModel.signFormat,
		    let signAlgoInUse = signModel.signAlgoInUse else {
            sendError(error: ErrorCodes.FunctionalErrorCodes.signatureOperationError)
		  return
	   }
	   
        if let range = result.range(of: ":") {
            // Hubo error. Comprobamos si es por error de contraseña de PDF
            if result.contains(ERR_PASSWORD_PROTECTED) || result.contains(ERR_BAD_PASSWORD) {
                if let completionCallback = completionCallback {
                    completionCallback(.success(true))
                }
            } else {
                let errorCodeServer = String(result[..<range.lowerBound])
                sendError(error: ErrorCodes.getServerError(codigo: errorCodeServer))
            }
            // En cualquier caso paramos ejecucion
            return
        }
        
        guard let pkcs1 = generatePKCS1(
                dataReceivedb64: result,
                signAlgoInUse: signAlgoInUse,
                signFormat: signFormat
              )  else {
            if self is SingleSignUseCase {
                sendError(error: ErrorCodes.InternalSoftwareErrorCodes.signingError)
                return
            }
            return
        }
        
        postsign(encodedData: pkcs1)
    }
    
    private func postsign(encodedData: Data) {
	   guard let operation = signModel.operation,
		    let datosInUse = signModel.datosInUse,
		    let signFormat = signModel.signFormat,
		    let signAlgoInUse = signModel.signAlgoInUse,
		    let certificateData = getCertificateData() else {
            sendError(error: ErrorCodes.CommunicationErrorCodes.signatureUploadError)
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
		  rtServlet: signModel.rtServlet)
    }
    
    func handlePostSignResult(responseString: String) {
        if responseString.contains("OK") {
            if let range = responseString.range(of: "=") {
                let parte2 = String(responseString[range.upperBound...])
                storeData(dataSign: parte2)
            } else {
                sendError(error: ErrorCodes.FunctionalErrorCodes.signatureOperationError)
                return
            }
        } else {
            if let range = responseString.range(of: ":") {
                let errorCodeServer = String(responseString[..<range.lowerBound])
                sendError(error: ErrorCodes.getServerError(codigo: errorCodeServer))
                return
            } else {
                sendError(error: ErrorCodes.FunctionalErrorCodes.signatureOperationError)
                return
            }
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
	   rtServlet: String?
    ) {
        threePhaseServerRest.performPresignRequest(
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
                    self.handlePresingResult(result: response)
			 case .failure(let error):
                    self.sendError(error: error)
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
	   rtServlet: String?
    ) {
        threePhaseServerRest.postSign(
		  operation: operation,
		  dict: dict,
		  datosInUse: datosInUse,
		  signFormat: signFormat,
		  signAlgoInUse: signAlgoInUse,
		  base64UrlSafeCertificateData: base64UrlSafeCertificateData,
		  extraParams: extraParams,
		  encodedData: encodedData,
		  triphasicServerURL: triphasicServerURL,
            rtServlet: rtServlet) { result in
                switch result {
                case .success(let postSignResult):
                    self.handlePostSignResult(responseString: postSignResult)
                case .failure(_):
                    self.sendError(error: ErrorCodes.CommunicationErrorCodes.threePhaseSignatureError)
                }
            }
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
    
    private func sendError(error: ErrorCodeProtocol) {
        sendError(error: error.info)
    }
    
    private func sendError(error: ErrorInfo) {
        guard let urlServlet = signModel.urlServlet,
             let docId = signModel.docId else {
           return
        }
        
        IntermediateServerRest().storeDataError(error: error, stServlet: urlServlet, docId: docId, completion: { _ in
            // Tanto si pudimos guardar en el servidor intermedio como no, devolvemos el error original
            if let completionCallback = self.completionCallback {
                completionCallback(.failure(error))
            }
        })
    }
    
    private func storeData(dataSign: String) {
	   guard let urlServlet = signModel.urlServlet,
		    let cipherKey = signModel.cipherKey,
		    let docId = signModel.docId,
		    let certificateData = getCertificateData() else {
		  return
	   }
	   
        guard let cipherSign = CipherUtils.cipherDataSend(dataString: dataSign, cipherKey: cipherKey) else {
            sendError(error: ErrorCodes.InternalSoftwareErrorCodes.signingCipherSignError)
            return
        }
        
        guard let cipherCertificate = CipherUtils.cipherCertificateSend(certificateData: certificateData, cipherKey: cipherKey) else {
            sendError(error: ErrorCodes.InternalSoftwareErrorCodes.signingCipherCertificateError)
            return
        }
        
        let cipherData = "\(cipherCertificate)|\(cipherSign)"
        
        IntermediateServerRest().uploadData(dataUpload: cipherData, stServlet: urlServlet, docId: docId) { result in
		  switch result {
            case .success():
                if let completionCallback = self.completionCallback {
                    completionCallback(.success(false))
                }
            case .failure(let errorInfo):
                self.sendError(error: errorInfo);
		  }
	   }
    }
}
