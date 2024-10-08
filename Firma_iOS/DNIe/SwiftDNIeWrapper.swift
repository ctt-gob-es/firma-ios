//
//  DNIeWrapper.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 19/9/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class SwiftDNIeWrapper {
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
	   
	   self.printDNIeAttributes(dnie: dnie)
	   
	   dnie.openSecureChannelIfNotAlreadyOpened()
	   print("Numero de intentos restantes de pin")
	   print(dnie.getPinRetriesLeft())
	   
	   return dnie
    }
    
    func getWrapperDNIe () throws -> EsGobJmulticardIosDnieWrapper? {
	   return EsGobJmulticardIosDnieFactoryWrapper.getDnieWith(connection, with: callbackHandler)
    }
    
    func getDNIeNFC () throws -> EsGobJmulticardCardDnieDnieNfc? {
	   return EsGobJmulticardCardDnieDnieFactory.getDnieNfc(with: connection, with: cryptoHelper, with: callbackHandler)
    }
    
    func setPin(pin: String) {
	   self.passwordCallback = JavaxSecurityAuthCallbackPasswordCallback(nsString: pin, withBoolean: false)
    }
    
    func getPinRetriesLeft() -> Int {
	   let dnie = try? self.getDnie()
	   
	   let retriesLeft = dnie?.getPinRetriesLeft() ?? 0
	   return Int(retriesLeft)
    }
    
    func printDNIeAttributes(dnie: EsGobJmulticardCardDnieDnie) {
	   print("Leído DNIE:")

	   if let idesp = dnie.getIdesp() {
		  print("IDESP: \(idesp)")
	   } else {
		  print("IDESP: no disponible")
	   }

	   if let serialNumber = dnie.getSerialNumber() {
		  print("Número de serie: \(serialNumber)")
	   } else {
		  print("Número de serie: no disponible")
	   }

	   /*let retriesLeft = dnie.getPinRetriesLeft()
	   print("Intentos de PIN restantes: \(retriesLeft)")*/

	   if let aliases = dnie.getAliases() {
		  print("Alias disponibles: \(aliases)")
	   } else {
		  print("Alias no disponibles")
	   }

	   print("Nombre de la tarjeta: \(String(describing: dnie.getName()))")
	   
	   let isSecurityChannelOpen = dnie.isSecurityChannelOpen()
	   print("Canal de seguridad abierto: \(isSecurityChannelOpen)")

	   if let rsaPublicKey = dnie.getIccCertPublicKey() {
		  print("Clave pública RSA: \(rsaPublicKey)")
	   } else {
		  print("Clave pública RSA no disponible")
	   }
    }
}


