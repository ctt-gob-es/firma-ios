//
//  ByteArrayUtils.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 26/9/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import CoreNFC

class ByteArrayUtils {
   static func hexStringToByteArray(_ hexString: String) -> [UInt8]? {
	   var byteArray = [UInt8]()
	   var index = hexString.startIndex
	   
	   while index < hexString.endIndex {
		  let nextIndex = hexString.index(index, offsetBy: 2)
		  let byteString = hexString[index..<nextIndex]
		  
		  if let byte = UInt8(byteString, radix: 16) {
			 byteArray.append(byte)
		  } else {
			 return nil
		  }
		  
		  index = nextIndex
	   }
	   
	   return byteArray
    }
    
    static func getApduFromAPDUIOSByteArray(apdu: IOSByteArray) -> NFCISO7816APDU? {
	   var byteArray: [UInt8] = []
	   
	   for i in 0..<apdu.length() {
		  byteArray.append(UInt8(bitPattern: apdu.byte(at: UInt(i))))
	   }
	   
	   let hexString = byteArray.map { String(format: "%02X", $0) }.joined()
	   print("Received internalTransmit APDU HexString: \(hexString)")
	   
	   let data = Data(ByteArrayUtils.hexStringToByteArray(hexString) ?? [])
	   
	   // Convert the hex string to an array of UInt8
	   if let byteArray = ByteArrayUtils.hexStringToByteArray(hexString) {
		  // Print each byte as 0x-prefixed hex value
		  let formattedByteArray = byteArray.map { String(format: "0x%02X", $0) }
		  print("Creating APDU to send with bytes : \(formattedByteArray)")
	   } else {
		  print("Invalid hex string")
	   }
	   
	   return NFCISO7816APDU(data: data)
    }
}
