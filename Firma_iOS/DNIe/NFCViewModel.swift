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
    
    @Published var nfcError: NFCError?
    
    private var dniSignleSignUseCase: DNISingleSignUseCase?
    
    init(can: String,
	    pin: String,
	    signModel: SignModel
    ) {
	   self.can = can
	   self.pin = pin
	   self.signModel = signModel
	   
	   self.dniSignleSignUseCase = DNISingleSignUseCase(
		  can: can,
		  pin: pin,
		  signModel: signModel
	   )
    }
    
    func signWithDNIe(completion: @escaping (Result<Bool, Error>) -> Void) {
	   self.dniSignleSignUseCase?.singleSign(completion: { result in
		  switch result {
			 case .success(let success):
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
    
    func invalidateSession(errorMessage: String) {
	   self.dniSignleSignUseCase?.wrapper?.nfcSessionManager?.nfcSession?.invalidate(errorMessage: errorMessage)
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
}
