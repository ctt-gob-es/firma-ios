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
	   print("Received APDUResponse. IOSByteArray: \(byteArray)")
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
}
