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
		  completion(.failure(ErrorGenerator.generateError(from: RequestErrorCodes.generalRequestError)))
		  return
	   }
	   self.opParameters = NSMutableDictionary(dictionary: urlParameters)
	   
	   if self.opParameters?[PARAMETER_NAME_OPERATION] as? String == OPERATION_SELECT_CERTIFICATE {
		  processSelectCertificateOperation(completion: completion)
	   } else if self.opParameters?[PARAMETER_NAME_DAT] == nil && self.opParameters?[PARAMETER_NAME_FILE_ID] == nil {
		  processSignLocalArchiveOperation(completion: completion)
	   } else {
		  handleCertificateParameters(completion: completion)
	   }
    }
    
    private func processSelectCertificateOperation(completion: @escaping (Result<(AOEntity, NSMutableDictionary), Error>) -> Void) {
	   self.urlParameters.stServletCert = self.opParameters?[PARAMETER_NAME_STSERVLET] as? String
	   self.urlParameters.idDocCert = self.opParameters?[PARAMETER_NAME_DOCID] as? String
	   self.urlParameters.cipherKeyCert = self.opParameters?[PARAMETER_NAME_CIPHER_KEY] as? String
	   
	   let aoEntity = AOEntity()
	   if let opParameters = self.opParameters {
		  completion(.success((aoEntity, opParameters)))
	   } else {
		  completion(.failure(ErrorGenerator.generateError(from: InternalSoftwareErrorCodes.certificateManagementError)))
	   }
    }
    
    private func processSignLocalArchiveOperation(completion: @escaping (Result<(AOEntity, NSMutableDictionary), Error>) -> Void) {
	   let aoEntity = AOEntity()
	   if let opParameters = self.opParameters {
		  completion(.success((aoEntity, opParameters)))
	   } else {
		  completion(.failure(ErrorGenerator.generateError(from: InternalSoftwareErrorCodes.dataSavingError)))
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
			 completion(.failure(ErrorGenerator.generateError(from: CommunicationErrorCodes.signatureDownloadError)))
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
				completion(.failure(ErrorGenerator.generateError(from: CommunicationErrorCodes.signatureDownloadError)))
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
			 throw ErrorGenerator.generateError(from: InternalSoftwareErrorCodes.jsonBatchOperationError)
		  }
		  
		  guard let decoded = DesCypher.decypherData(String(data: data, encoding: .utf8) ?? "", sk: cipherKeyCertData) else {
			 throw ErrorGenerator.generateError(from: InternalSoftwareErrorCodes.jsonBatchOperationError)
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
			 throw ErrorGenerator.generateError(from: InternalSoftwareErrorCodes.xmlBatchOperationError)
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
				completion(.failure(ErrorGenerator.generateError(from: InternalSoftwareErrorCodes.jsonBatchOperationError)))
			 }
		  }
	   } catch {
		  DispatchQueue.main.async {
			 completion(.failure(error))
		  }
	   }
    }
}
