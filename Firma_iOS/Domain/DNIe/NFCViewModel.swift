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
    @Published var showTextfieldModal: Bool = false
    
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
        if signModel.operation == OPERATION_SIGN || signModel.operation == OPERATION_COSIGN || signModel.operation == OPERATION_COUNTERSIGN {
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
				    self.showTextfieldModal = true
                        self.dniSingleSignUseCase?.invalidateSessionManually(withErrorMessage: NSLocalizedString("textfield_modal_description",bundle: Bundle.main, comment: ""))
				} else {
				    let history = HistoryModel(
					   date: Date(),
					   signType: self.signType ?? .external,
					   dataType: self.dataType ?? .external,
					   externalApp: self.signModel.appname,
                            filename: self.signModel.filename,
					   returnURL: self.signModel.returnURL,
					   operation: self.signModel.operation
				    )
				    HistoricalUseCase().saveHistory(history: history) { result in
					   let modalState = SuccessModalState.successSign
                            self.dniSingleSignUseCase?.invalidateSessionManually(withAlertMessage: modalState.description)
                            DispatchQueue.main.async {
						  NotificationCenter.default.post(name: .DNIeSuccess, object: modalState)
					   }
				    }
				}
			 case .failure(let appError):
                    self.dniSingleSignUseCase?.invalidateSessionManually(withErrorMessage: appError.screenType.title)

                    DispatchQueue.main.async {
				    NotificationCenter.default.post(
					   name: .DNIeError,
					   object: nil,
					   userInfo: ["error": appError]
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
                    let history = HistoryModel(
                       date: Date(),
                       signType: self.signType ?? .external,
                       dataType: self.dataType ?? .external,
                       externalApp: self.signModel.appname,
                       filename: nil,
                       returnURL: self.signModel.returnURL,
                       operation: self.signModel.operation
                    )
                    HistoricalUseCase().saveHistory(history: history) { result in
                        let successModalState = self.getSuccessModal(resultBatch)
                        self.dniBatchSignUseCase?.invalidateSessionManually(withAlertMessage: successModalState.description)
                        DispatchQueue.main.async {
                           NotificationCenter.default.post(name: .DNIeSuccess, object: successModalState)
                        }
                    }
                case .failure(let appError):
                    self.dniBatchSignUseCase?.invalidateSessionManually(withAlertMessage: appError.screenType.title)
                    
                    // Hubo error en el proceso de firma batch
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(
                           name: .DNIeError,
                           object: nil,
                           userInfo: ["error": appError]
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
    
    func sendError(error: AppError) {
	   SendErrorOperationUseCase().execute(error: error, signModel: signModel)
    }
}
