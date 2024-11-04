//
//  DNIeWrapper.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 19/9/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import CoreNFC

extension Notification.Name {
    static let DNIeSuccess = Notification.Name("DNIeSuccess")
    static let DNIeError = Notification.Name("DNIeError")
}

protocol DNIeResult {
    func getDNIeNFCSuccess(wrapper: EsGobJmulticardIosDnieWrapper)
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
	   print("NFC session invalidated")
	   if let nfcError = error as? NFCReaderError {
		  switch nfcError.code {
		  case .readerSessionInvalidationErrorSessionTimeout,
			 .readerSessionInvalidationErrorUserCanceled:
			 dniResult?.getDNIeError(errorCode: 3, errorMessage: error.localizedDescription)
		  default:
			 print("With error: \(error.localizedDescription)")
		  }
	   }
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
			 if let _ = wrapper.getDnie() {
				dniResult?.getDNIeNFCSuccess(wrapper: wrapper)
			 } else {
				dniResult?.getDNIeError(
				    errorCode: getWrapperError(wrapper: wrapper).0,
				    errorMessage: getWrapperError(wrapper: wrapper).1
				)
			 }
		  }
	   }
    }
    
    private func getWrapperDNIe () throws -> EsGobJmulticardIosDnieWrapper? {
	   return EsGobJmulticardIosDnieFactoryWrapper.getDnieWith(connection, with: callbackHandler)
    }
    
    private func getWrapperError(wrapper: EsGobJmulticardIosDnieWrapper) -> (Int, String) {
	   let errorCode = Int(wrapper.getErrorCode())
	   let errorMessage = wrapper.getErrorMessage() ?? ""
	   return (errorCode, errorMessage)
    }
}
