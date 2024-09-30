//
//  DNIeWrapper.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 19/9/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class DNIeWrapper {
    var connection: EsGobJmulticardConnectionApduConnection
    private var cryptoHelper: EsGobJmulticardCryptoHelper
    private var callbackHandler: JavaxSecurityAuthCallbackCallbackHandler
    private var passwordCallback: JavaxSecurityAuthCallbackPasswordCallback?
    
    init(connection: EsGobJmulticardConnectionApduConnection,
	    cryptoHelper: EsGobJmulticardCryptoHelper,
	    callbackHandler: JavaxSecurityAuthCallbackCallbackHandler
    ) {
	   self.connection = connection
	   self.cryptoHelper = cryptoHelper
	   self.callbackHandler = callbackHandler
    }
    
    func getDnie() throws -> EsGobJmulticardCardDnieDnie {
	   guard let dnie = EsGobJmulticardCardDnieDnieFactory.getDnieWith(
		  connection,
		  with: passwordCallback,
		  with: cryptoHelper,
		  with: callbackHandler
	   ) else {
		  throw NSError(domain: "DNIeWrapperError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to get DNIe"])
	   }
	   return dnie
    }
    
    func setPin(pin: String) {
	   self.passwordCallback = JavaxSecurityAuthCallbackPasswordCallback(nsString: pin, withBoolean: false)
    }
    
    func getPinRetriesLeft() -> Int {
	   let dnie = try? self.getDnie()
	   
	   let retriesLeft = dnie?.getPinRetriesLeft() ?? 0
	   return Int(retriesLeft)
    }
}


