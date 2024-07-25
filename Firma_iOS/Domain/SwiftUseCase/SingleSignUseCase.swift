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
    private let reportErrorRest: ReportErrorRest = ReportErrorRest()
    
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
	   completion: @escaping (Result<Data, Error>) -> Void) {
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
    
    func reportErrorAsync(
	   urlServlet: String?,
	   docId: String?,
	   error: String,
	   completion: @escaping (Result<Data, Error>) -> Void
    ) {
	   reportErrorRest.reportError(
		  urlServlet: urlServlet,
		  docId: docId,
		  error: error,
		  completion: completion
	   )
    }
}
