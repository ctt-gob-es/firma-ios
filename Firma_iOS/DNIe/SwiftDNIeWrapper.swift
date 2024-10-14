//
//  DNIeWrapper.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 19/9/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import CoreNFC

protocol DNIeResult {
    func getDNIeNFCSuccess(dnie: EsGobJmulticardCardDnieDnie)
    func getDNIeError(errorCode: Int, errorMessage: String)
}

class SwiftDNIeWrapper : IOSNFCSessionDelegate{
    private var connection: EsGobJmulticardConnectionApduConnection?
    private var callbackHandler: IOSCallbackHandler
    var nfcSessionManager: IOSNFCSessionManager?
    private var dniResult: DNIeResult?
    
    init(can: String, pin: String) {
	   self.callbackHandler = IOSCallbackHandler(can: can, pin: pin)
	   self.nfcSessionManager = IOSNFCSessionManager()
	   nfcSessionManager?.delegate = self
    }
    
    func getDNIe(completion: DNIeResult ) {
	   self.dniResult = completion
	   nfcSessionManager?.beginSession()
    }
    
    func didInvalidateNFCSession(with error: any Error) {
	   print("NFC session invalidated with error: \(error.localizedDescription)")
	   dniResult?.getDNIeError(errorCode: 1, errorMessage: error.localizedDescription)
    }
    
    func didBecomeActive() {
	   print("NFC session is active.")
    }
    
    func didDetectNFC(tag: any NFCISO7816Tag) {
	   self.connection = IOSApduConnection(
		  tag: tag,
		  nfcSession: nfcSessionManager
	   )
	   
	   Task {
		  if let wrapper = try? getWrapperDNIe() {
			 if let dni = wrapper.getDnie() {
				dniResult?.getDNIeNFCSuccess(dnie: dni)
			 }else {
				let errorCode = Int(wrapper.getErrorCode())
				let errorMessage = wrapper.getErrorMessage() ?? ""
				dniResult?.getDNIeError(errorCode: errorCode, errorMessage: errorMessage)
				DispatchQueue.main.async {
				    NotificationCenter.default.post(name: .DNIeError, object: nil, userInfo: ["errorCode": errorCode, "errorMessage": errorMessage])
				}
			 }
		  }
	   }
    }
    
    private func getWrapperDNIe () throws -> EsGobJmulticardIosDnieWrapper? {
	   return EsGobJmulticardIosDnieFactoryWrapper.getDnieWith(connection, with: callbackHandler)
    }
}


extension Notification.Name {
    static let DNIeSuccess = Notification.Name("DNIeSuccess")
    static let DNIeError = Notification.Name("DNIeError")
}
