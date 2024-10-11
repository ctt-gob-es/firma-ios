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
    func getDNIeNFCSuccess(dnie: EsGobJmulticardCardDnieDnieNfc)
    func getDNIeError()
}

class SwiftDNIeWrapper : IOSNFCSessionDelegate{
    private var connection: EsGobJmulticardConnectionApduConnection?
    private var callbackHandler: IOSCallbackHandler
    private var nfcSessionManager: IOSNFCSessionManager?
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
		  if let dni = try? getDNIeNFC() {
			 dniResult?.getDNIeNFCSuccess(dnie: dni)
		  }else {
			 dniResult?.getDNIeError()
		  }
	   }
    }
    
    private func getWrapperDNIe () throws -> EsGobJmulticardIosDnieWrapper? {
	   return EsGobJmulticardIosDnieFactoryWrapper.getDnieWith(connection, with: callbackHandler)
    }
    
    private func getDNIeNFC () throws -> EsGobJmulticardCardDnieDnieNfc? {
	   return EsGobJmulticardCardDnieDnieFactory.getDnieNfc(with: connection, with: EsGobJmulticardCryptoBcCryptoHelper(), with: callbackHandler)
    }
}


