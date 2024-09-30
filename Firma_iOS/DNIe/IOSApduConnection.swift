//
//  IOSNFCConnection.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 24/9/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//
//

import Foundation
import CoreNFC

class StateAPDUCommand {
    var isFinished: Bool = false
    var returnIOSByteArray: IOSByteArray?
}

class IOSApduConnection: EsGobJmulticardConnectionAbstractApduConnectionIso7816 {
    private var nfcTag: NFCISO7816Tag?
    private var nfcSession: IOSNFCSessionManager?
    private var semaphore = DispatchSemaphore(value: 0)
    
    // MARK: - Init with tag & reader session
    init(tag: NFCISO7816Tag?,
	    nfcSession: IOSNFCSessionManager?) {
	   self.nfcTag = tag
	   self.nfcSession = nfcSession
    }
    
    // MARK: - Abrir conexión JMulticard
    override func open() {
	   if nfcTag == nil {
		  nfcSession?.nfcSession?.restartPolling()
	   }
    }
    
    // MARK: - Cerrar conexión JMulticard
    override func close() {
	   nfcSession?.nfcSession?.invalidate()
    }
    
    // MARK: - Implementación de EsGobJmulticardConnectionApduConnection
    override func setProtocolWith(_ p: EsGobJmulticardConnectionApduConnectionProtocol!) {
	   // Implement protocol handling if needed
    }
    
    // MARK: - Establecer un terminal específico
    override func setTerminalWith(_ t: jint) {
	   // Implement setTerminalWith handling if needed
    }
    
    
    // MARK: - Obtener información de un terminal específico
    override func getTerminalInfo(with terminal: jint) -> String! {
	   return ""
    }
    
    // MARK: - Obtener información de los terminales
    override func getTerminalsWithBoolean(_ onlyWithCardPresent: jboolean) -> IOSLongArray! {
	   let arraySize: UInt = 1
	   let longArray = IOSLongArray(length: arraySize)
	   
	   for i in 0..<arraySize {
		  longArray?.replaceLong(at: i, withLong: jlong(0))
	   }
	   
	   return longArray
    }

    // MARK: - Comprobar si la conexión NFC está abierta
    override func isOpen() -> jboolean {
	   if let isOpen = nfcSession?.nfcSession?.isReady {
		  return isOpen
	   } else {
		  return false
	   }
    }
    
    // MARK: - Obtener subclase de conexión APDU
    override func getSub() -> (any EsGobJmulticardConnectionApduConnection)! {
	   return nil
    }
    
    // MARK: - Tamaño máximo de APDU
    override func getMaxApduSize() -> jint {
	   return 261
    }
    
    // MARK: - Reiniciar conexión NFC
    override func reset()  -> IOSByteArray! {
	   var byteArray: IOSByteArray?
	   if nfcTag != nil {
		  if let historicalBytes = IOSByteArray(nsData: nfcTag?.historicalBytes) {
			 byteArray = historicalBytes
			 print("Historical Bytes: " + (byteArray?.description ?? ""))
		  }
		  if let applicationData = IOSByteArray(nsData: nfcTag?.applicationData) {
			 byteArray = applicationData
			 print("Application Data Bytes: " + (byteArray?.description ?? ""))
		  }
	   }
	   
	   let state: StateAPDUCommand = StateAPDUCommand()
	   
	   DispatchQueue.global().async {
		  Task {
			 do {
				print("Sending reset APDU")
				let resetResponse = try await self.sendResetCardCommand()
				print("Reset response:")
				print(resetResponse as Any)
				state.returnIOSByteArray = resetResponse
				state.isFinished.toggle()
				self.semaphore.signal()
			 } catch {
				print("Error while creating the RESET command")
			 }
		  }
	   }
	   
	   semaphore.wait()
	   
	   return IOSByteArray()
    }
    
    private func sendResetCardCommand() async throws -> IOSByteArray? {
	   let apduData = Data([0x00, 0xA4, 0x00, 0x00])
	   guard let apdu = NFCISO7816APDU(data: apduData) else {
		  throw NSError(domain: "NFCErrorDomain", code: 3, userInfo: [NSLocalizedDescriptionKey: "Failed to create APDU command"])
	   }
	   
	   do {
		  let byteArray = try await sendApdu(apdu: apdu)
		  return byteArray
	   } catch {
		  print("Error during sendResetCardCommand: \(error.localizedDescription)")
		  throw error
	   }
    }
    
    // MARK: - Enviar comando APDU y recibir respuesta
    override func internalTransmit(with apdu: IOSByteArray!) -> EsGobJmulticardApduResponseApdu! {
	   guard let apduCommand = ByteArrayUtils.getApduFromAPDUIOSByteArray(apdu: apdu) else {
		  print("Error: No se puede crear el apdu.")
		  return nil
	   }
	   
	   let state: StateAPDUCommand = StateAPDUCommand()
	   
	   DispatchQueue.global().async {
		  Task {
			 print("Sending internalTransmit APDU")
			let response =  try? await self.sendApdu(apdu: apduCommand)
			 state.returnIOSByteArray = response
			 state.isFinished.toggle()
			 print("internalTransmit response:")
			 print(response as Any)
			 self.semaphore.signal()
		  }
	   }
	   
	   semaphore.wait()

	   //TODO: Pass the correct ResponseApdu to JMulticard Library
	   return EsGobJmulticardApduResponseApdu(byteArray: state.returnIOSByteArray)
    }
    
    //MARK: Send Native APDU and retrieve an IOSByteArray
    private func sendApdu(apdu: NFCISO7816APDU) async throws -> IOSByteArray? {
	   return try await withCheckedThrowingContinuation { continuation in
		  guard let nfcTag = nfcTag else {
			 continuation.resume(throwing: NSError(domain: "NFCErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "No NFC tag found"]))
			 return
		  }
		  
		  LogUtils.printNativeAPDUCommand(apduCommand: apdu)
		  
		  nfcTag.sendCommand(apdu: apdu) { (responseData, sw1, sw2, error) in
			 if let error = error {
				continuation.resume(throwing: error)
				return
			 }
			 
			 guard sw1 == 0x90 && sw2 == 0x00 else {
				let errorDescription = "Error in response: SW1 = \(sw1), SW2 = \(sw2)"
				continuation.resume(throwing: NSError(domain: "NFCErrorDomain", code: 2, userInfo: [NSLocalizedDescriptionKey: errorDescription]))
				return
			 }
			 
			 let nativeByteArray = [UInt8](responseData)
			 let hexString = nativeByteArray.map { String(format: "%02X", $0) }.joined(separator: " ")
			 print("Native Response Data Bytes: \(hexString)")
			 
			 let byteArray = IOSByteArray(length: UInt(responseData.count))
			 for (index, byte) in responseData.enumerated() {
				byteArray?.replaceByte(at: UInt(index), withByte: jbyte(bitPattern: byte))
			 }
			 
			 LogUtils.printIOSByteArray(byteArray!)
			 
			 continuation.resume(returning: byteArray)
		  }
	   }
    }
}
