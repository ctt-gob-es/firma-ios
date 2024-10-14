//
//  SingleSignUseCase.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 24/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class DNISingleSignUseCase : GenericSignUseCase, DNIeResult {
    var pkcs1: Data? = nil
    private var certificateData: String? = nil
    private var wrapper: SwiftDNIeWrapper?
    private var dnie: EsGobJmulticardCardDnieDnieNfc?
    
    init(can: String,
	    pin: String,
	    signModel: SignModel
    ) {
	   super.init(signModel: signModel)
	   wrapper = SwiftDNIeWrapper(can: can, pin: pin)
    }
    
    override func getCertificateData() -> String? {
	   return certificateData
    }
    
    override func getPKCS1Sign(dataToSign: Data, algorithm: String) -> Data? {
	   guard let privateKeyReference = dnie?.getPrivateKey(with: "CertFirmaDigital"),
		  let dataSigned = dnie?.sign(with: IOSByteArray(nsData: dataToSign), with: algorithm, with: privateKeyReference)
	   else {
		 print("Failed to sign data")
		 return nil
	  }
	   return dataSigned.toNSData()
    }
    
    override func singleSign(completion: @escaping (Result<Bool, Error>) -> Void) {
	   guard signModel != nil else {
		  handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_datos_firmar", bundle: Bundle.main, comment: "")]), completion: completion)
		  return
	   }
	   self.completionCallback = completion
	   wrapper?.getDNIe(completion: self)
    }
    
    func getDNIeNFCSuccess(dnie: EsGobJmulticardCardDnieDnieNfc) {
	   let certJ509 = dnie.getCertificateWith("CertFirmaDigital")
	   self.certificateData = EsGobAfirmaCoreMiscBase64_encodeWithByteArray_withBoolean_(certJ509?.getEncoded(), true)
	   self.dnie = dnie
	   presign(signModel: signModel!)
    }
    
    func getDNIeError() {
	   handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_datos_firmar", bundle: Bundle.main, comment: "")]), completion: self.completionCallback!)
    }
    
/*    private func presign(signModel: SignModel) {
	   guard let operation = signModel.operation,
		    let datosInUse = signModel.datosInUse,
		    let signFormat = signModel.signFormat,
		    let signAlgoInUse = signModel.signAlgoInUse,
		    let certificateData = certificateData else {
		  handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_datos_firmar", bundle: Bundle.main, comment: "")]), completion: self.completionCallback!)
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
				self.handlePresingResult(signModel: signModel, result: result, completion: self.completionCallback!)
			 })
	   } else {
		  handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_algoritmo_no_soportado", bundle: Bundle.main, comment: "")]), completion: self.completionCallback!)
	   }
    }
    
    private func handlePresingResult(signModel: SignModel, result: Result<String, Error>, completion: @escaping (Result<Bool, Error>) -> Void) {
	   switch result {
		  case .success(let serverResponse):
			 guard let algorithm = signModel.signAlgoInUse,
				let pkcs1 = generatePKCS1(
				dataReceivedb64: serverResponse,
				signAlgoInUse: algorithm,
				signFormat: signModel.signFormat
			   ) else {
				if serverResponse.contains(ERR_PASSWORD_PROTECTED) || serverResponse.contains(ERR_BAD_PASSWORD) {
				    handleRetryWithPassword(completion: completion)
				} else {
				    if let range = serverResponse.range(of: ":", options: .backwards) {
					   let result = serverResponse[range.upperBound...]
					   handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: result]), completion: completion)
				    } else {
					   handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_proceso_firma", bundle: Bundle.main, comment: "")]), completion: completion)
				    }
				}
				return
			 }
			 postsign(signModel: signModel, encodedData: pkcs1, completion: completion)
			 
		  case .failure(let error):
			 handleSignError(error: error, completion: completion)
	   }
    }
    
    override func generatePKCS1(
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
		  
		  guard let privateKeyReference = dnie?.getPrivateKey(with: "CertFirmaDigital"),
			 let dataSigned = dnie?.sign(with: IOSByteArray(nsData: data), with: signAlgoInUse, with: privateKeyReference)
		  else {
			print("Failed to sign data")
			return nil
		 }
		  
		  // Si nos llega del servidor intermedio el pk1Decoded a true entonces tenemos que decodificar el PKCS#1 antes de pasarlo a Base64 y enviarlo al servidor
		  if pk1Decoded {
			 let stringSigned = Firma().processDataAndReturnEncodedString(dataSigned.toNSData())
			 (firma as AnyObject).params["PK1"] = stringSigned
		  } else {
			 let stringSigned = dataSigned.toNSData().base64EncodedString()
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
    
    private func postsign(signModel: SignModel, encodedData: Data, completion: @escaping (Result<Bool, Error>) -> Void) {
	   guard let operation = signModel.operation,
		    let datosInUse = signModel.datosInUse,
		    let signFormat = signModel.signFormat,
		    let signAlgoInUse = signModel.signAlgoInUse,
		    let certificateData = certificateData else {
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
    
    override func postSign(
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
    }*/
}
