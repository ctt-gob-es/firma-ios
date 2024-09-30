//
//  DNIeService.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 24/9/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import CoreNFC

protocol DNIeServiceProtocol {
    func initializeDNIeConnection()
    func getDNIe() throws -> EsGobJmulticardCardDnieDnie?
    func getRemainingPinRetries() -> Int
}

class DNIeService: DNIeServiceProtocol, IOSNFCSessionDelegate {
    private var dnieWrapper: DNIeWrapper?
    private var nfcSessionManager: IOSNFCSessionManager?
    private var apduConnection: IOSApduConnection?
    private let cryptoHelper = EsGobJmulticardCryptoBcCryptoHelper()
    private var callbackHandler: IOSCallbackHandler?

    init(can: String, pin: String) {
	   callbackHandler = IOSCallbackHandler(can: can, pin: pin)
	   self.nfcSessionManager = IOSNFCSessionManager()
    }
    
    func initializeDNIeConnection() {
	   nfcSessionManager?.delegate = self
	   nfcSessionManager?.beginSession()
    }
    
    func didDetectNFC(tag: NFCISO7816Tag) {
	   print("NFC Tag detected, creating APDU connection.")
	   self.apduConnection = IOSApduConnection(
		  tag: tag,
		  nfcSession: nfcSessionManager
	   )

	   self.dnieWrapper = DNIeWrapper(
		  connection: apduConnection!,
		  cryptoHelper: cryptoHelper!,
		  callbackHandler: callbackHandler!
	   )
	   Task {
		  print(getDNIe())
	   }
    }
    
    func getDNIe() -> EsGobJmulticardCardDnieDnie? {
	   return try? dnieWrapper!.getDnie()
    }
    
    func getRemainingPinRetries() -> Int {
	   return dnieWrapper!.getPinRetriesLeft()
    }
    
    func didBecomeActive() {
	   print("NFC session is active.")
    }
    
    func didInvalidateNFCSession(with error: Error) {
	   print("NFC session invalidated with error: \(error.localizedDescription)")
    }
}
