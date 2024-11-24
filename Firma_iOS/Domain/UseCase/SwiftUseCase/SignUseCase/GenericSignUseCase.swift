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
    
    var signModel: SignModel
    
    var completionCallback: ((Result<Bool, AppError>) -> Void)?
    
    init(signModel: SignModel) {
	   self.signModel = signModel
    }
    
    func getCertificateData() -> String? {
	   fatalError("This method must be overrided")
    }
    
    func getPKCS1Sign(dataToSign: Data, algorithm: String) -> Data? {
	   fatalError("This method must be overrided")
    }
    
    
    func singleSign(completion: @escaping (Result<Bool, AppError>) -> Void) {
	   self.completionCallback = completion
	   if validateData() {
		  configure()
	   }
    }
    
    private func validateData() -> Bool {
	   
        guard let signFormat = signModel.signFormat else {
            sendError(error: AppError.signFormatNotFound)
		  return false
	   }
        
        if !supportedFormats.contains(signFormat)  {
            sendError(error: AppError.signFormatNotValid)
          return false
        }
	   
	   guard let urlServlet = signModel.urlServlet, !urlServlet.isEmpty else {
            sendError(error: AppError.signThreePhaseStServletNotFound)
		  return false
	   }
	   
        guard let signAlgoInUse = signModel.signAlgoInUse else {
		  sendError(error: AppError.signAlgoNotFound)
		  return false
	   }
        
        if (!CADESSignUtils.isValidAlgorithm(signAlgoInUse)) {
            sendError(error: AppError.signAlgoNotValid)
        }
	   
	   guard let docId = signModel.docId, !docId.isEmpty else {
		  sendError(error: AppError.signThreePhaseIdNotFound)
		  return false
	   }
	   
        guard let datosInUse = signModel.datosInUse else {
            sendError(error: AppError.signThreePhaseDataNotFound)
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
             let signFormat = signModel.signFormat,
             let signAlgoInUse = signModel.signAlgoInUse else {
                // Devolvemos erro general porque se validan estos campos previamente. Nunca deberia llegar aqui
                sendError(error: AppError.generalSoftwareError)
           return
        }
        
        guard let decodedDatosInUse = Base64Utils.decode(datosInUse, urlSafe: true) else {
            sendError(error: AppError.datosInUseDecodeNotValid)
		  return
	   }
	   
	   guard let pkcs1 = getPKCS1Sign(dataToSign: decodedDatosInUse, algorithm: signAlgoInUse),
		    let encodedPKCS1 = Base64Utils.encode(pkcs1, urlSafe: true)
	   else {
            //sendError(error: AppError.signingError)
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
            // Devolvemos erro general porque se validan estos campos previamente. Nunca deberia llegar aqui
            sendError(error: AppError.generalSoftwareError)
		  return
	   }
	   
        preSign(
            operation: operation,
            datosInUse: datosInUse,
            signFormat: signFormat,
            signAlgoInUse: signAlgoInUse,
            certificateData: certificateData,
            extraParams: signModel.extraParams,
            triphasicServerURL: signModel.triphasicServerURL,
            rtServlet: signModel.rtServlet)
    }
    
    private func handlePresingResult(result: String) {
	   guard let signFormat = signModel.signFormat,
		    let signAlgoInUse = signModel.signAlgoInUse else {
            // Devolvemos erro general porque se validan estos campos previamente. Nunca deberia llegar aqui
            sendError(error: AppError.generalSoftwareError)
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
                sendError(error: HandeThirdPartyErrors.getServerPresignError(codigo: errorCodeServer))
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
               // sendError(error: AppError.signingError)
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
            // Devolvemos erro general porque se validan estos campos previamente. Nunca deberia llegar aqui
            sendError(error: AppError.generalSoftwareError)
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
                sendError(error: AppError.threePhaseServerPostsignErrorResponseOkFormat)
                return
            }
        } else {
            if let range = responseString.range(of: ":") {
                let errorCodeServer = String(responseString[..<range.lowerBound])
                sendError(error: HandeThirdPartyErrors.getServerPostSignError(codigo: errorCodeServer))
                return
            } else {
                sendError(error: AppError.threePhaseServerPostsignErrorResponseData)
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
                case .failure(let error):
                    self.sendError(error: error)
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
    
    private func sendError(error: AppError) {
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
              let docId = signModel.docId else {
		  return
	   }
        
        if let dataUpload = getDataUpload(dataSign: dataSign) {
            IntermediateServerRest().uploadData(dataUpload: dataUpload, stServlet: urlServlet, docId: docId) { result in
                switch result {
                case .success():
                    if let completionCallback = self.completionCallback {
                        completionCallback(.success(false))
                    }
                case .failure(let appError):
                    self.sendError(error: appError);
                }
            }
        }
    }
    
    /// Obtiene el string a guardar en el serivodr intermedio con los daos de la firma
    /// Si llega el cipherKey los datos se cifran con esa clave, en caso contrario se guardan en claro
    private func getDataUpload(dataSign: String) -> String? {
        guard let certificateData = getCertificateData() else {
            return nil
        }
        
        // Si llega la clave de cifrado, ciframos los datos. En caso contrario no es necesario
        if let cipherKey = signModel.cipherKey {
            guard let cipherSign = CipherUtils.cipherDataSend(dataString: dataSign, cipherKey: cipherKey) else {
                sendError(error: AppError.signingCipherSignError)
                return nil
            }
            
            guard let cipherCertificate = CipherUtils.cipherCertificateSend(certificateData: certificateData, cipherKey: cipherKey) else {
                sendError(error: AppError.signingCipherCertificateError)
                return nil
            }
            
            return "\(cipherCertificate)|\(cipherSign)"
        } else {
            return "\(certificateData)|\(dataSign)"
        }
        
    }
}
