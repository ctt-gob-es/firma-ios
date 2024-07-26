//
//  ReceiveDataUseCase.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 18/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

@objc public class ReceiveDataUseCase: NSObject {
    private var startURL: String?
    var opParameters: NSMutableDictionary?
    private var stServletCert: String?
    private var idDocCert: String?
    private var fileIdCert: String?
    private var rtServletCert: String?
    private var cipherKeyCert: String?
    private var reportErrorCert: Bool = false
    private var retrievingDataFromServletCert: Bool = false
    private var receivedDataCert: Data?
    private var receivedStringCert: String?
    private var numberOfRetries = 0
    
    var appStatus: AppStatus
    
    init(appStatus: AppStatus) {
	   self.appStatus = appStatus
    }
    
    public func parseUrl(
	   _ urlString: String,
	   completion: @escaping (Result<(AOEntity, NSMutableDictionary), Error>) -> Void
    ) {
	   self.startURL = urlString
	   
	   guard let urlParameters = CADESSignUtils.parseUrl(urlString) as? [String: Any] else {
		  completion(.failure(NSError(domain: "Error",code: -1,userInfo: [NSLocalizedDescriptionKey:NSLocalizedString("error_codigo_desconocido",bundle: Bundle.main,comment: "")])))
		  return
	   }
	   self.opParameters = NSMutableDictionary(dictionary: urlParameters)
	   var datosInUseCert: String?
	   
	   if self.opParameters?[PARAMETER_NAME_OPERATION] as? String == OPERATION_SELECT_CERTIFICATE {
		  if let stServlet = self.opParameters?[PARAMETER_NAME_STSERVLET] as? String {
			 self.stServletCert = stServlet
		  }
		  if let idDoc = self.opParameters?[PARAMETER_NAME_ID] as? String {
			 self.idDocCert = idDoc
		  }
	   } else {
		  if let datosInUse = self.opParameters?[PARAMETER_NAME_DAT] as? String {
			 datosInUseCert = datosInUse
		  }
		  if let stServlet = self.opParameters?[PARAMETER_NAME_STSERVLET] as? String {
			 self.stServletCert = stServlet
		  }
		  if let idDoc = self.opParameters?[PARAMETER_NAME_ID] as? String {
			 self.idDocCert = idDoc
		  }
		  if datosInUseCert == nil {
			 if let fileId = self.opParameters?[PARAMETER_NAME_FILE_ID] as? String {
				self.fileIdCert = fileId
			 }
			 if self.fileIdCert == nil {
				self.reportError(errorCode: ERROR_MISSING_DATA, errorDesc: DESC_ERROR_MISSING_DATA)
				completion(.failure(NSError(domain: "Error",code: -1,userInfo: [NSLocalizedDescriptionKey:NSLocalizedString("error_descarga_fichero",bundle: Bundle.main,comment: "")])))
			 } else {
				if let rtServlet = self.opParameters?[PARAMETER_NAME_RTSERVLET] as? String {
				    self.rtServletCert = rtServlet
				}
				if let cipherKey = self.opParameters?[PARAMETER_NAME_CIPHER_KEY] as? String {
				    self.cipherKeyCert = cipherKey
				}
				if self.cipherKeyCert != nil && self.rtServletCert != nil {
				    self.loadDataFromRtservlet(completion: completion)
				} else {
				    self.reportError(errorCode: ERROR_MISSING_DATA, errorDesc: DESC_ERROR_MISSING_DATA)
				    completion(.failure(NSError(domain: "Error",code: -1,userInfo: [NSLocalizedDescriptionKey:NSLocalizedString("error_descarga_fichero",bundle: Bundle.main,comment: "")])))
				}
			 }
		  }
	   }
    }
    
    private func reportError(errorCode: String, errorDesc: String) {
	   let errorToSend = errorCode + ERROR_SEPARATOR + errorDesc
	   if let _ = self.stServletCert, let _ = self.idDocCert {
		  self.errorReportAsync(errorToSend)
	   }
    }
    
    private func errorReportAsync(_ error: String) {
	   DispatchQueue.main.async {
		  self.appStatus.errorPublisher.send(error)
	   }
    }
    
    private func loadDataFromRtservlet(
	   completion: @escaping (Result<(AOEntity, NSMutableDictionary), Error>) -> Void
    ) {
	   var post = ""
	   post += PARAMETER_NAME_OPERATION
	   post += HTTP_EQUALS
	   post += OPERATION_GET
	   post += HTTP_AND
	   post += PARAMETER_NAME_VERSION
	   post += HTTP_EQUALS
	   post += PARAMETER_NAME_VERSION_1_0
	   post += HTTP_AND
	   post += PARAMETER_NAME_ID
	   post += HTTP_EQUALS
	   post += fileIdCert ?? ""
	   
	   guard let postData = post.data(using: .utf8, allowLossyConversion: true) else { return }
	   let postLength = String(postData.count)
	   
	   guard let requestUrl = URL(string: rtServletCert ?? "") else { return }
	   var request = URLRequest(url: requestUrl, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30.0)
	   request.httpMethod = POST
	   request.setValue(postLength, forHTTPHeaderField: "Content-Length")
	   request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
	   request.setValue("Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)", forHTTPHeaderField: "User-Agent")
	   request.setValue("text/plain,text/html,application/xhtml+xml,application/xml", forHTTPHeaderField: "Accept")
	   
	   request.httpBody = postData
	   
	   retrievingDataFromServletCert = true
	   
	   let task = URLSession.shared.dataTask(with: request) { data, response, error in
		  guard let data = data, error == nil else {
			 print("Error: \(error?.localizedDescription ?? "No data")")
			 completion(.failure(NSError(domain: "Error",code: -1,userInfo: [NSLocalizedDescriptionKey:NSLocalizedString("error_url_servidor",bundle: Bundle.main,comment: "")])))
			 return
		  }
		  self.receivedDataCert = data
		  self.connectionDidFinishLoading(data: data, completion: completion)
	   }
	   task.resume()
    }
    
    private func connectionDidFinishLoading(
	   data: Data,
	   completion: @escaping (Result<(AOEntity, NSMutableDictionary), Error>) -> Void
    ) {
	   guard let receivedData = receivedDataCert else { return }
	   
	   receivedStringCert = String(data: receivedData, encoding: .utf8)
	   
	   if retrievingDataFromServletCert {
		  retrievingDataFromServletCert = false
		  let responseString = String(data: receivedData, encoding: .utf8) ?? ""
		  
		  decodeData(responseString, completion: completion)
	   } else if reportErrorCert {
		  reportErrorCert = false
	   }
    }
    
    private func decodeData(
	   _ responseString: String,
	   completion: @escaping (Result<(AOEntity, NSMutableDictionary), Error>) -> Void
    ) {
	   do {
		  guard let cipherKeyCertData = cipherKeyCert?.data(using: .utf8) else {
			 throw NSError(domain: "Error",code: -1,userInfo: [NSLocalizedDescriptionKey:NSLocalizedString("error_descarga_fichero",bundle: Bundle.main,comment: "")])
		  }
		  
		  guard let decoded = DesCypher.decypherData(responseString, sk: cipherKeyCertData) else {
			 throw NSError(domain: "Error",code: -1,userInfo: [NSLocalizedDescriptionKey:NSLocalizedString("error_descarga_fichero",bundle: Bundle.main,comment: "")])
		  }
		  
		  if responseString.hasPrefix("ERR-06") && numberOfRetries < 3 {
			 DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
				self.parseUrl(self.startURL ?? "", completion: completion)
				self.numberOfRetries += 1
			 }
		  } else {
			 var datosInUse = String(data: decoded, encoding: .utf8)
			 datosInUse = datosInUse?.removingPercentEncoding
			 
			 guard let entidad = AOXMLReader().loadXML(by: datosInUse ?? "") else {
				throw NSError(domain: "Error",code: -1,userInfo: [NSLocalizedDescriptionKey:NSLocalizedString("error_descarga_fichero",bundle: Bundle.main,comment: "")])
			 }
			 
			 opParameters?[PARAMETER_NAME_DAT] = (entidad as AnyObject).datField ?? ""
			 opParameters?[PARAMETER_NAME_FORMAT] = (entidad as AnyObject).formatField ?? ""
			 opParameters?[PARAMETER_NAME_ALGORITHM2] = (entidad as AnyObject).algorithmField ?? ""
			 opParameters?[PARAMETER_NAME_PROPERTIES] = (entidad as AnyObject).propertiesField ?? ""
			 opParameters?[PARAMETER_NAME_ID] = (entidad as AnyObject).idField ?? ""
			 opParameters?[PARAMETER_NAME_STSERVLET] = (entidad as AnyObject).stServletField ?? ""
			 opParameters?[PARAMETER_NAME_BATCH_PRESIGNER_URL] = (entidad as AnyObject).batchpresignerurl ?? ""
			 opParameters?[PARAMETER_NAME_BATCH_POSTSIGNER_URL] = (entidad as AnyObject).batchpostsignerurl ?? ""
			 opParameters?[PARAMETER_NAME_BATCH_JSON] = (entidad as AnyObject).batchjson ?? ""
			 
			 DispatchQueue.main.async {
				if let opParameters = self.opParameters {
				    completion(.success((entidad as! AOEntity, opParameters)))
				} else {
				    completion(.failure(NSError(domain: "Error",code: -1,userInfo: [NSLocalizedDescriptionKey:NSLocalizedString("error_descarga_fichero",bundle: Bundle.main,comment: "")])))
				}
			 }
		  }
	   } catch {
		  DispatchQueue.main.async {
			 completion(.failure(error))
		  }
	   }
    }
}
