//
//  NFCViewModel.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 24/9/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import CoreNFC
import SwiftUI

class NFCViewModel: NSObject, ObservableObject, BatchSignUseCaseDelegate {
    @State var can: String
    @State var pin: String
    @State var dataToSign: Data? = nil
    @State var signModel: SignModel
    @State var parameters: NSMutableDictionary?
    
    @Published var nfcError: NFCError?
    
    private var dniSingleSignUseCase: DNISingleSignUseCase?
    private var dniBatchSignUseCase: DNIeBatchSignUseCase?
    
    init(can: String,
	    pin: String,
	    signModel: SignModel,
	    parameters: NSMutableDictionary? = nil
    ) {
	   self.can = can
	   self.pin = pin
	   self.signModel = signModel
	   self.parameters = parameters
    }
    
    func signWithDNIe(completion: @escaping (Result<Bool, Error>) -> Void) {
	   if signModel.operation == OPERATION_SIGN {
		  self.dniSingleSignUseCase = DNISingleSignUseCase(
			 can: can,
			 pin: pin,
			 signModel: signModel
		  )
		  singleSignWithDNIe(completion: completion)
	   } else if signModel.operation == OPERATION_BATCH {
		  self.dniBatchSignUseCase = DNIeBatchSignUseCase(
			 can: can,
			 pin: pin
		  )
		  self.dniBatchSignUseCase?.delegate = self
		  batchSignWithDNIe(completion: completion)
	   }
    }
    
    func singleSignWithDNIe(completion: @escaping (Result<Bool, Error>) -> Void) {
	   self.dniSingleSignUseCase?.singleSign(completion: { result in
		  switch result {
			 case .success(let success):
				self.dniBatchSignUseCase?.wrapper?.nfcSessionManager?.nfcSession?.alertMessage = NSLocalizedString("sign_success_description", bundle: Bundle.main, comment: "")
				self.dniBatchSignUseCase?.wrapper?.nfcSessionManager?.nfcSession?.invalidate()
				DispatchQueue.main.async {
				    NotificationCenter.default.post(name: .DNIeSuccess, object: "")
				}
				completion(.success(success))
			 case .failure(let error):
				let nsError = error as NSError
				DispatchQueue.main.async {
				    NotificationCenter.default.post(
					   name: .DNIeError,
					   object: nil,
					   userInfo: ["errorCode": nsError.code, "errorMessage": nsError.userInfo["errorMessage"] as? String ?? nsError.localizedDescription]
				    )
				}
				self.handleError(error: error)
				completion(.failure(error))
		  }
	   })
    }
    
    func batchSignWithDNIe(completion: @escaping (Result<Bool, Error>) -> Void) {
	   if let parameters = parameters {
		  var swiftDictionary: [String: Any] = [:]
		  for (key, value) in parameters {
			 if let keyString = key as? String {
				swiftDictionary[keyString] = value
			 }
		  }
		  self.dniBatchSignUseCase?.signBatch(dataOperation: swiftDictionary, completion: { result, error in
			 switch result {
				case true:
				    self.dniBatchSignUseCase?.wrapper?.nfcSessionManager?.nfcSession?.alertMessage = NSLocalizedString("batch_signs_all_ok", bundle: Bundle.main, comment: "")
				    self.dniBatchSignUseCase?.wrapper?.nfcSessionManager?.nfcSession?.invalidate()
				    DispatchQueue.main.async {
					   NotificationCenter.default.post(name: .DNIeSuccess, object: "")
				    }
				    completion(.success(result))
				case false:
				    if let error = error {
					   let nsError = error as NSError
					   DispatchQueue.main.async {
						  NotificationCenter.default.post(
							 name: .DNIeError,
							 object: nil,
							 userInfo: ["errorCode": nsError.code, "errorMessage": nsError.userInfo["errorMessage"] as? String ?? nsError.localizedDescription]
						  )
					   }
					   completion(.failure(error))
				    }
			 }
			 
		  })
	   }
	   
    }
    
    func invalidateSession(errorMessage: String) {
	   self.dniSingleSignUseCase?.wrapper?.nfcSessionManager?.nfcSession?.invalidate(errorMessage: errorMessage)
    }
    
    private func handleError(error: Error) {
	   let reportErrorUseCase = ReportErrorUseCase()
	   reportErrorUseCase.reportErrorAsync(
		  urlServlet: signModel.urlServlet,
		  docId: signModel.docId,
		  error: ErrorHandlerUtils.getServerError(error: error as NSError)
	   ) { result in
		  switch result {
			 case .success(let errorFromServer):
				if let response = String(data: errorFromServer, encoding: .utf8) {
				    print("Server response from reportError: " + response)
				}
			 case .failure(let error):
				print("Server error from reportError: " + error.localizedDescription)
		  }
	   }
    }
    
    func didSuccessBatch(response: String) {
	   
    }
    
    func didErrorBatch(error: any Error) {
	   let nsError = error as NSError
	   DispatchQueue.main.async {
		  NotificationCenter.default.post(
			 name: .DNIeError,
			 object: nil,
			 userInfo: ["errorCode": nsError.code, "errorMessage": nsError.userInfo["errorMessage"] as? String ?? nsError.localizedDescription]
		  )
	   }
    }
}
