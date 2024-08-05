//
//  ReceiveDataUseCase.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 18/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
import Foundation

public class ReceiveDataUseCase: NSObject {
    private var startURL: String
    private let restClient: ReceiveDataRest
    private var urlParameters : ParseURLParameters = ParseURLParameters()
    private var opParameters: NSMutableDictionary?
    
    init(startURL : String,
	    restClient: ReceiveDataRest = ReceiveDataRest()) {
	   self.startURL = startURL
	   self.restClient = restClient
    }
    
    public func parseUrl(
	   completion: @escaping (Result<(AOEntity, NSMutableDictionary), Error>) -> Void
    ) {
	   guard let urlParameters = CADESSignUtils.parseUrl(startURL) as? [String: Any] else {
		  completion(.failure(NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_codigo_desconocido", bundle: Bundle.main, comment: "")])))
		  return
	   }
	   self.opParameters = NSMutableDictionary(dictionary: urlParameters)
	   
	   //OPERATION: SELECT CERTIFICATE OPERATION
	   if self.opParameters?[PARAMETER_NAME_OPERATION] as? String == OPERATION_SELECT_CERTIFICATE {
		  self.urlParameters.stServletCert = self.opParameters?[PARAMETER_NAME_STSERVLET] as? String
		  self.urlParameters.idDocCert = self.opParameters?[PARAMETER_NAME_DOCID] as? String
		  self.urlParameters.cipherKeyCert = self.opParameters?[PARAMETER_NAME_CIPHER_KEY] as? String
		  
		  let aoEntity = AOEntity()
		  if let opParameters = self.opParameters {
			 completion(.success((aoEntity, opParameters)))
		  } else {
			 completion(.failure(NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_codigo_desconocido", bundle: Bundle.main, comment: "")])))
		  }
	   } else {
		  handleCertificateParameters(completion: completion)
	   }
    }
    
    private func handleCertificateParameters(completion: @escaping (Result<(AOEntity, NSMutableDictionary), Error>) -> Void) {
	   let datosInUseCert = self.opParameters?[PARAMETER_NAME_DAT] as? String
	   let idDocCert = self.opParameters?[PARAMETER_NAME_ID] as? String
	   
	   self.urlParameters.stServletCert = self.opParameters?[PARAMETER_NAME_STSERVLET] as? String
	   self.urlParameters.idDocCert = idDocCert
	   
	   if datosInUseCert == nil {
		  self.urlParameters.fileIdCert = self.opParameters?[PARAMETER_NAME_FILE_ID] as? String
		  if self.urlParameters.fileIdCert == nil {
			 completion(.failure(NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_descarga_fichero", bundle: Bundle.main, comment: "")])))
		  } else {
			 self.urlParameters.rtServletCert = self.opParameters?[PARAMETER_NAME_RTSERVLET] as? String
			 self.urlParameters.cipherKeyCert = self.opParameters?[PARAMETER_NAME_CIPHER_KEY] as? String
			 if self.urlParameters.cipherKeyCert != nil && self.urlParameters.rtServletCert != nil {
				self.restClient.performRestRequest(rtServletCert: self.urlParameters.rtServletCert, fileIdCert: self.urlParameters.fileIdCert) { result in
				    switch result {
					   case .success(let data):
						  self.handleReceiveData(data: data, completion: completion)
					   case .failure(let error):
						  completion(.failure(error))
				    }
				}
			 } else {
				completion(.failure(NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_descarga_fichero", bundle: Bundle.main, comment: "")])))
			 }
		  }
	   }
    }
    
    private func handleReceiveData(
	   data: Data,
	   completion: @escaping (Result<(AOEntity, NSMutableDictionary), Error>) -> Void
    ) {
	   self.urlParameters.receivedDataCert = data
	   
	   do {
		  guard let cipherKeyCertData = urlParameters.cipherKeyCert?.data(using: .utf8) else {
			 throw NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_descarga_fichero", bundle: Bundle.main, comment: "")])
		  }
		  
		  guard let decoded = DesCypher.decypherData(String(data: data, encoding: .utf8) ?? "", sk: cipherKeyCertData) else {
			 throw NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_descarga_fichero", bundle: Bundle.main, comment: "")])
		  }
		  
		  if String(data: data, encoding: .utf8)?.hasPrefix("ERR-06") == true && self.urlParameters.numberOfRetries < 3 {
			 DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
				self.parseUrl(completion: completion)
				self.urlParameters.numberOfRetries += 1
			 }
		  } else {
			 processDecodedData(decoded, completion: completion)
		  }
	   } catch {
		  DispatchQueue.main.async {
			 completion(.failure(error))
		  }
	   }
    }
    
    private func processDecodedData(
	   _ decodedData: Data,
	   completion: @escaping (Result<(AOEntity, NSMutableDictionary), Error>) -> Void
    ) {
	   do {
		  var datosInUse = String(data: decodedData, encoding: .utf8)
		  datosInUse = datosInUse?.removingPercentEncoding
		  
		  guard let entidad = AOXMLReader().loadXML(by: datosInUse ?? "") else {
			 throw NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_descarga_fichero", bundle: Bundle.main, comment: "")])
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
				completion(.failure(NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_descarga_fichero", bundle: Bundle.main, comment: "")])))
			 }
		  }
	   } catch {
		  DispatchQueue.main.async {
			 completion(.failure(error))
		  }
	   }
    }
}
