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
			 case .success(let success):
				self.dniSingleSignUseCase?.wrapper?.nfcSessionManager?.nfcSession?.alertMessage = NSLocalizedString("sign_success_description", bundle: Bundle.main, comment: "")
				self.dniSingleSignUseCase?.wrapper?.nfcSessionManager?.nfcSession?.invalidate()
				DispatchQueue.main.async {
				    NotificationCenter.default.post(name: .DNIeSuccess, object: "")
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
		  self.dniBatchSignUseCase?.signBatch(dataOperation: swiftDictionary, completion: { responseMesage, errorInfo in
                if let errorInfo = errorInfo {
                    // Hubo error en el proceso de firma batch
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(
                           name: .DNIeError,
                           object: nil,
                           userInfo: ["errorInfo": errorInfo]
                        )
                    }
                    
                } else {
                    // El proceso batch se ejecuto correctamente. Devolvemos el string correspondiente en fucnoin de si se firmaron correctamente todas las firmas, algunas o ninguna
                    self.dniBatchSignUseCase?.wrapper?.nfcSessionManager?.nfcSession?.alertMessage = NSLocalizedString(responseMesage ?? "", bundle: Bundle.main, comment: "")
                    self.dniBatchSignUseCase?.wrapper?.nfcSessionManager?.nfcSession?.invalidate()
                    DispatchQueue.main.async {
                       NotificationCenter.default.post(name: .DNIeSuccess, object: responseMesage)
                    }
                }
			 
		  })
	   }
    }
    
    func invalidateSession(errorMessage: String) {
	   self.dniSingleSignUseCase?.wrapper?.nfcSessionManager?.nfcSession?.invalidate(errorMessage: errorMessage)
        self.dniBatchSignUseCase?.wrapper?.nfcSessionManager?.nfcSession?.invalidate(errorMessage: errorMessage)
    }

}
