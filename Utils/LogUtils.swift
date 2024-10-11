//
//  LogUtils.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 26/9/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import CoreNFC

class LogUtils {
    static func printIOSByteArray(_ iosByteArray: IOSByteArray) {
	   var byteArray: [UInt8] = []
	   for i in 0..<iosByteArray.length() {
		  byteArray.append(UInt8(bitPattern: iosByteArray.byte(at: UInt(i))))
	   }
	   let hexString = byteArray.map { String(format: "%02X", $0) }.joined()
	   print("Received APDUResponse. HexString: \(hexString)")
    }
    
    static func printNativeAPDUCommand(apduCommand: NFCISO7816APDU) {
	   if let apduData = apduCommand.data {
		  let byteArray = [UInt8](apduData)
		  let hexString = byteArray.map { String(format: "%02hhx", $0) }.joined()
		  print("Sending Native APDU. Bytes: \(byteArray)")
		  print("Sending Native APDU. HexString: \(hexString)")
	   }
    }
    
    static func printDNIeAttributes(dnie: EsGobJmulticardCardDnieDnie) {
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
