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
		  // If we have the URL of the triphasic server, we return it
		  return URL(string: triphasicServerURL)
	   } else if let rtServlet = rtServlet {
		  // Create the URL of the triphasic server from the rtServlet and the default triphasic signing path
		  var urlComponents = URLComponents(string: rtServlet)
		  urlComponents?.query = nil
		  urlComponents?.path = PATH_DEFAULT_TRIPHASE_SIGN // Adjust PATH_DEFAULT_TRIPHASE_SIGN accordingly
		  return urlComponents?.url
	   } else {
		  return nil
	   }
    }
    
    func preSign(operation: String, datosInUse: String, signFormat: String, signAlgoInUse: String, certificateData: String, extraParams: String?, triphasicServerURL: String?, rtServlet: String?, completion: @escaping (Result<String, Error>) -> Void) {
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
	   print(dataReceivedb64)
	   
	   // Decode the received data from base64
	   guard let dataReceived = Base64.decode(dataReceivedb64, urlSafe: true) else {
		  print("Failed to decode base64 data")
		  return nil
	   }
	   guard String(data: dataReceived, encoding: .utf8) != nil else {
		  print("Failed to convert data to string")
		  return nil
	   }
	   
	   // Parse the XML data
	   let parser = AOCounterSignXMLParser()
	   guard let firmas = parser.parseXML(dataReceived) else {
		  print("Failed to parse XML")
		  return nil
	   }
	   
	   // Iterate through the pre-signatures
	   for firma in firmas {
		  guard let pre = (firma as AnyObject).params["PRE"] as? String else {
			 print("Missing PRE in params")
			 continue
		  }
		  var preClean = pre.replacingOccurrences(of: "\n", with: "")
		  preClean = preClean.replacingOccurrences(of: " ", with: "")
		  
		  guard let data = Base64.decode(preClean, urlSafe: true), data.count > 0 else {
			 print("Failed to decode base64 data or data is empty")
			 continue
		  }
		  
		  // With the decoded pre-signature data, proceed to perform the pkcs1 signing
		  let signUtils = CADESSignUtils()
		  var unmanagedPrivateKey: Unmanaged<SecKey>? = Unmanaged<SecKey>.passUnretained(privateKey)
		  let pointerToUnmanagedPrivateKey: UnsafeMutablePointer<Unmanaged<SecKey>?> = UnsafeMutablePointer(&unmanagedPrivateKey)

		  guard let dataSigned = signUtils.signData(withPrivateKey: pointerToUnmanagedPrivateKey, data: data, algorithm: signAlgoInUse) else {
			 print("Failed to sign data")
			 return nil
		  }
		  
		  // Contains the signed pre-signatures
		  // If it is XADES or FACTURA-E, we will do an additional process
		  if let signFormat = signFormat, signFormat.contains("XAdES") || signFormat.contains("FacturaE") {
			 let byteArray = IOSByteArray(bytes: [UInt8](dataSigned), count: UInt(dataSigned.count))
			 let decodedSignature = EsGobAfirmaCoreSignersPkcs1Utils.decodeSignature(with: byteArray)
			 let decodedSignatureData = CADESSignUtils().getDataFrom(decodedSignature)
			 let stringSigned = decodedSignatureData?.base64EncodedString()
			 (firma as AnyObject).params["PK1"] = stringSigned
		  } else {
			 let stringSigned = dataSigned.base64EncodedString()
			 (firma as AnyObject).params["PK1"] = stringSigned
		  }
	   }
	   
	   // Generate the XML
	   let preItems = AOCounterSignPreItems()
	   
	   // XML sent to the server with the date when the pkcs7 was prepared and the pairs of signed data and "dummy data"
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
	   postSignRest.postSign(operation: operation, dict: dict, datosInUse: datosInUse, signFormat: signFormat, signAlgoInUse: signAlgoInUse, base64UrlSafeCertificateData: base64UrlSafeCertificateData, extraParams: extraParams, encodedData: encodedData, triphasicServerURL: triphasicServerURL, rtServlet: rtServlet, completion: completion)
    }
    
    func reportErrorAsync(urlServlet: String?, docId: String?, error: String, completion: @escaping (Result<Data, Error>) -> Void) {
	   reportErrorRest.reportError(urlServlet: urlServlet, docId: docId, error: error, completion: completion)
    }
}
