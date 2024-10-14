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
    @Published var sessionActiveMessage: String = ""
    @Published var resultMessage: String?
    
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
    
    func getDNIeNFC(completion: @escaping (Result<Bool, Error>) -> Void) {
	   self.dniSignleSignUseCase?.singleSign(completion: { result in
		  switch result {
		  case .success(let success):
			 print("DNIe NFC process was successful.")
				DispatchQueue.main.async {
				    NotificationCenter.default.post(name: .DNIeSuccess, object: "")
				}
			 completion(.success(success))
		  case .failure(let error):
			 print("DNIe NFC process failed with error: \(error.localizedDescription)")
			 completion(.failure(error))
		  }
	   })
	   self.sessionActiveMessage = "Sesión NFC activa. Acerca el dispositivo al DNIe."
    }
    
    func invalidateSession(errorMessage: String) {
	   self.dniSignleSignUseCase?.wrapper?.nfcSessionManager?.nfcSession?.invalidate(errorMessage: errorMessage)
    }
}
