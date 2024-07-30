//
//  SingleSignUseCase.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 24/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class SingleSignUseCase {
    private let presignRest: PresignRest = PresignRest()
    private let postSignRest: PostSignRest = PostSignRest()
    
    var signModel: SignModel?
    var certificateUtils: CertificateUtils?
    
    init(signModel: SignModel, certificateUtils: CertificateUtils? = nil) {
	   self.signModel = signModel
	   self.certificateUtils = certificateUtils
    }
    
    func singleSign(completion: @escaping (Result<Void, Error>) -> Void) {
	   guard let signModel else {
		  handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_datos_firmar", bundle: Bundle.main, comment: "")]), completion: completion)
		  return
	   }
	   presign(signModel: signModel, completion: completion)
    }
    
    private func presign(signModel: SignModel, completion: @escaping (Result<Void, Error>) -> Void) {
	   guard let operation = signModel.operation,
		    let datosInUse = signModel.datosInUse,
		    let signFormat = signModel.signFormat,
		    let signAlgoInUse = signModel.signAlgoInUse,
		    let certificateData = certificateUtils?.base64UrlSafeCertificateData else {
		  handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_datos_firmar", bundle: Bundle.main, comment: "")]), completion: completion)
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
				self.handlePresingResult(signModel: signModel, result: result, completion: completion)
			 })
	   } else {
		  handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_algoritmo_no_soportado", bundle: Bundle.main, comment: "")]), completion: completion)
	   }
    }
    
    private func handlePresingResult(signModel: SignModel, result: Result<String, Error>, completion: @escaping (Result<Void, Error>) -> Void) {
	   guard let signFormat = signModel.signFormat,
		    let signAlgoInUse = signModel.signAlgoInUse else {
		  handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_datos_firmar", bundle: Bundle.main, comment: "")]), completion: completion)
		  return
	   }
	   
	   switch result {
		  case .success(let serverResponse):
			 guard let privateKey = certificateUtils?.privateKey,
				  let encodedData = generatePKCS1(
				    dataReceivedb64: serverResponse,
				    privateKey: privateKey,
				    signAlgoInUse: signAlgoInUse,
				    signFormat: signFormat
				  ) else {
				if let range = serverResponse.range(of: ":", options: .backwards) {
				    let result = serverResponse[range.upperBound...]
				    handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: result]), completion: completion)
				} else {
				    handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_proceso_firma", bundle: Bundle.main, comment: "")]), completion: completion)
				}
				return
			 }
			 postsign(signModel: signModel, encodedData: encodedData, completion: completion)
			 
		  case .failure(let error):
			 handleSignError(error: error, completion: completion)
	   }
    }
    
    private func postsign(signModel: SignModel, encodedData: Data, completion: @escaping (Result<Void, Error>) -> Void) {
	   guard let operation = signModel.operation,
		    let datosInUse = signModel.datosInUse,
		    let signFormat = signModel.signFormat,
		    let signAlgoInUse = signModel.signAlgoInUse,
		    let certificateData = certificateUtils?.base64UrlSafeCertificateData else {
		  handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_datos_firmar", bundle: Bundle.main, comment: "")]), completion: completion)
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
				signModel: signModel,
				result: result,
				completion: completion
			 )
		  })
    }
    
    private func handlePostSignResult(signModel: SignModel, result: Result<Data, Error>, completion: @escaping (Result<Void, Error>) -> Void) {
	   switch result {
		  case .success(let postSignResult):
			 if let responseString = String(data: postSignResult, encoding: .utf8) {
				if responseString.contains("OK") {
				    if let range = responseString.range(of: "=") {
					   let parte2 = String(responseString[range.upperBound...])
					   sendCertificate(dataSign: parte2, completion: completion)
				    } else {
					   handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_proceso_firma", bundle: Bundle.main, comment: "")]), completion: completion)
				    }
				} else {
				    if let range = responseString.range(of: ":", options: .backwards) {
					   let result = responseString[range.upperBound...]
					   handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: result]), completion: completion)
				    } else {
					   handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_proceso_firma", bundle: Bundle.main, comment: "")]), completion: completion)
				    }
				}
			 } else {
				handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_proceso_firma", bundle: Bundle.main, comment: "")]), completion: completion)
			 }
			 
		  case .failure(let error):
			 handleSignError(error: error, completion: completion)
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
	   privateKey: SecKey,
	   signAlgoInUse: String,
	   signFormat: String?
    ) -> Data? {
	   guard let dataReceived = Base64Utils.decode(dataReceivedb64, urlSafe: true) else {
		  print("Failed to decode base64 data")
		  return nil
	   }
	   
	   guard String(data: dataReceived, encoding: .utf8) != nil else {
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
		  
		  let signUtils = CADESSignUtils()
		  var unmanagedPrivateKey: Unmanaged<SecKey>? = Unmanaged<SecKey>.passUnretained(privateKey)
		  let pointerToUnmanagedPrivateKey: UnsafeMutablePointer<Unmanaged<SecKey>?> = UnsafeMutablePointer(&unmanagedPrivateKey)
		  
		  guard let dataSigned = signUtils.signData(
			 withPrivateKey: pointerToUnmanagedPrivateKey,
			 data: data,
			 algorithm: signAlgoInUse
		  ) else {
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
    
    static func getDefaultTriphaseServer(triphasicServerURL: String?, rtServlet: String?) -> URL? {
	   if let triphasicServerURL = triphasicServerURL {
		  return URL(string: triphasicServerURL)
	   } else if let rtServlet = rtServlet {
		  var urlComponents = URLComponents(string: rtServlet)
		  urlComponents?.query = nil
		  urlComponents?.path = PATH_DEFAULT_TRIPHASE_SIGN
		  return urlComponents?.url
	   } else {
		  return nil
	   }
    }
    
    func loadCertificateAndRetrieveValues(
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
    }
    
    private func handleSignError(error: Error, completion: @escaping (Result<Void, Error>) -> Void) {
	   print("Error occurred: \(error.localizedDescription)")
	   completion(.failure(error))
    }
    
    private func sendCertificate(dataSign: String, completion: @escaping (Result<Void, Error>) -> Void) {
	   guard let urlServlet = signModel?.urlServlet,
		    let cipherKey = signModel?.cipherKey,
		    let docId = signModel?.docId,
		    let certificateData = certificateUtils?.base64UrlSafeCertificateData else {
		  return
	   }
	   
	   let sendCertificateUseCase = SendCertificateUseCase(
		  urlServlet: urlServlet,
		  cipherKey: cipherKey,
		  docId: docId,
		  base64UrlSafeCertificateData: certificateData
	   )
	   
	   sendCertificateUseCase.sendCertificate(dataSign: dataSign, completion: { result in
		  switch result {
			 case .success(let storeDataServerResponse):
				if let response = String(data: storeDataServerResponse, encoding: .utf8) {
				    if response == OK {
					   completion(.success(()))
				    } else {
					   self.handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_proceso_firma", bundle: Bundle.main, comment: "")]), completion: completion)
				    }
				}
			 case .failure(let error):
				self.handleSignError(error: error, completion: completion)
		  }
	   })
    }
}
