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

class NFCViewModel: NSObject, ObservableObject {
    @State var can: String
    @State var pin: String
    @State var dataToSign: Data? = nil
    @State var signModel: SignModel
    @State var parameters: NSMutableDictionary?
    
    @Published var nfcError: NFCError?
    @Published var signType: SignType? = nil
    @Published var dataType: DataType? = nil
    
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
    
    func signWithDNIe() {
	   if signModel.operation == OPERATION_SIGN {
		  self.dniSingleSignUseCase = DNISingleSignUseCase(
			 can: can,
			 pin: pin,
			 signModel: signModel
		  )
		  singleSignWithDNIe()
	   } else if signModel.operation == OPERATION_BATCH {
		  self.dniBatchSignUseCase = DNIeBatchSignUseCase(
			 can: can,
			 pin: pin
		  )
		  batchSignWithDNIe()
	   }
    }
    
    private func singleSignWithDNIe() {
	   self.dniSingleSignUseCase?.singleSign(completion: { result in
		  switch result {
			 case .success(let shouldRetry):
				if shouldRetry {
				    //TODO: Show textfieldModal
				    
				} else {
				    let history = HistoryModel(
					   date: Date(),
					   signType: self.signType ?? .external,
					   externalApp: self.signModel.appname,
					   dataType: self.dataType ?? .external,
					   filename: FileUtils.getArchiveNameFromParameters(parameters: self.parameters)
				    )
				    HistoricalUseCase().saveHistory(history: history) { result in
					   let modalState = SuccessModalState.successSign
					   self.dniSingleSignUseCase?.wrapper?.nfcSessionManager?.nfcSession?.alertMessage = modalState.description
					   self.dniSingleSignUseCase?.wrapper?.nfcSessionManager?.nfcSession?.invalidate()
					   DispatchQueue.main.async {
						  NotificationCenter.default.post(name: .DNIeSuccess, object: modalState)
					   }
				    }
				}
			 case .failure(let errorInfo):
                    DispatchQueue.main.async {
				    NotificationCenter.default.post(
					   name: .DNIeError,
					   object: nil,
					   userInfo: ["errorInfo": errorInfo]
				    )
				}
		  }
	   })
    }
    
    private func batchSignWithDNIe() {
	   if let parameters = parameters {
		  var swiftDictionary: [String: Any] = [:]
		  for (key, value) in parameters {
			 if let keyString = key as? String {
				swiftDictionary[keyString] = value
			 }
		  }
            
		  self.dniBatchSignUseCase?.signBatch(dataOperation: swiftDictionary, completion: { result in
                switch result {
                case .success(let resultBatch):
                    let successModalState = self.getSuccessModal(resultBatch)
                    
                    self.dniBatchSignUseCase?.wrapper?.nfcSessionManager?.nfcSession?.alertMessage = successModalState.description
                    self.dniBatchSignUseCase?.wrapper?.nfcSessionManager?.nfcSession?.invalidate()
                    DispatchQueue.main.async {
                       NotificationCenter.default.post(name: .DNIeSuccess, object: successModalState)
                    }
                case .failure(let error):
                    // Hubo error en el proceso de firma batch
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(
                           name: .DNIeError,
                           object: nil,
                           userInfo: ["errorInfo": error]
                        )
                    }
                }
			 
		  })
	   }
    }
    
    private func getSuccessModal(_ resultBatch: BatchResult) -> SuccessModalState {
        switch resultBatch {
        case .ok:
            return .successSignBatch
        case .signsWithError:
            return .successSignBatchWithError
        case .allSignWihtError:
            return .successSignBatchWithAllError
        }
    }
    
    func invalidateSession(errorMessage: String) {
	   self.dniSingleSignUseCase?.wrapper?.nfcSessionManager?.nfcSession?.invalidate(errorMessage: errorMessage)
        self.dniBatchSignUseCase?.wrapper?.nfcSessionManager?.nfcSession?.invalidate(errorMessage: errorMessage)
    }

}
