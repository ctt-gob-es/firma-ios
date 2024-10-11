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
    private var firstReset = true
    
    // MARK: - Init with tag & reader session
    init(tag: NFCISO7816Tag?,
	    nfcSession: IOSNFCSessionManager?) {
	   self.nfcTag = tag
	   self.nfcSession = nfcSession
    }
    
    // MARK: - Abrir conexión JMulticard
    override func open() {
	   nfcSession?.nfcSession?.alertMessage = NSLocalizedString("nfc_session_opened", comment: "")
    }
    
    // MARK: - Cerrar conexión JMulticard
    override func close() {
	   nfcSession?.nfcSession?.invalidate()
	   nfcSession?.nfcSession?.alertMessage = NSLocalizedString("nfc_session_closed", comment: "")
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
	   return "iOS NFC"
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
	   return true
    }
    
    // MARK: - Obtener subclase de conexión APDU
    override func getSub() -> (any EsGobJmulticardConnectionApduConnection)! {
	   return nil
    }
    
    // MARK: - Tamaño máximo de APDU
    override func getMaxApduSize() -> jint {
	   return 0xff
    }
    
    // MARK: - Reiniciar conexión NFC
    override func reset()  -> IOSByteArray! {
	   nfcSession?.nfcSession?.alertMessage = NSLocalizedString("nfc_resetting", comment: "")
	   print("Sending reset APDU")
	   
	   if firstReset {
		  firstReset.toggle()
		  
		  getNFCTagData()
		  
		  let state: StateAPDUCommand = StateAPDUCommand()
		  
		  DispatchQueue.global().async {
			 Task {
				do {
				    let resetResponse = try await self.sendResetCardCommand()
				    print("Reset response:")
				    print(resetResponse as Any)
				    state.returnIOSByteArray = resetResponse
				    state.isFinished.toggle()
				    self.nfcSession?.nfcSession?.alertMessage = NSLocalizedString("nfc_reset_successful", comment: "")
				    self.semaphore.signal()
				} catch {
				    print("Error while creating the RESET command")
				}
			 }
		  }
		  
		  semaphore.wait()
		  
		  return IOSByteArray()
	   } else {
		  return IOSByteArray()
	   }
    }
    
    private func getNFCTagData() -> IOSByteArray? {
	   var byteArray: IOSByteArray?
	   if nfcTag != nil {
		  if let historicalBytes = IOSByteArray(nsData: nfcTag?.historicalBytes) {
			 byteArray = historicalBytes
			 if byteArray?.length() ?? 0 > 0 {
				print("Historical Bytes: " + (byteArray?.description ?? ""))
			 }
		  }
		  if let applicationData = IOSByteArray(nsData: nfcTag?.applicationData) {
			 byteArray = applicationData
			 if byteArray?.length() ?? 0 > 0 {
				print("Application Data Bytes: " + (byteArray?.description ?? ""))
			 }
		  }
	   }
	   
	   return byteArray
    }
    
    private func sendResetCardCommand() async throws -> IOSByteArray? {
	   let apduData = Data([0x00, 0xA4, 0x00, 0x00])
	   guard let apdu = NFCISO7816APDU(data: apduData) else {
		  throw NSError(domain: "NFCErrorDomain", code: 3, userInfo: [NSLocalizedDescriptionKey: "Failed to create APDU command"])
	   }
	   
	   do {
		  return try await sendApdu(apdu: apdu)
	   } catch {
		  print("Error during sendResetCardCommand: \(error.localizedDescription)")
		  throw error
	   }
    }
    
    // MARK: - Enviar comando APDU y recibir respuesta
    override func internalTransmit(with apdu: IOSByteArray!) -> EsGobJmulticardApduResponseApdu! {
	   nfcSession?.nfcSession?.alertMessage = NSLocalizedString("apdu_transmitting", comment: "")
	   
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
			 self.semaphore.signal()
		  }
	   }
	   
	   semaphore.wait()
	   
	   return EsGobJmulticardApduResponseApdu(byteArray: state.returnIOSByteArray)
    }
    
    //MARK: Send Native APDU and retrieve an IOSByteArray
    private func sendApdu(apdu: NFCISO7816APDU) async throws -> IOSByteArray? {
	   nfcSession?.nfcSession?.alertMessage = NSLocalizedString("apdu_transmitting", comment: "")
	   
	   return try await withCheckedThrowingContinuation { continuation in
		  guard let nfcTag = nfcTag else {
			 continuation.resume(throwing: NSError(domain: "NFCErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("apdu_no_tag", comment: "")]))
			 return
		  }
		  
		  LogUtils.printNativeAPDUCommand(apduCommand: apdu)
		  
		  nfcTag.sendCommand(apdu: apdu) { (responseData, sw1, sw2, error) in
			 if let error = error {
				self.nfcSession?.nfcSession?.alertMessage = NSLocalizedString("apdu_send_error", comment: "") + error.localizedDescription
				continuation.resume(throwing: error)
				return
			 }
			 
			 self.nfcSession?.nfcSession?.alertMessage = NSLocalizedString("apdu_response_received", comment: "")
			 
			 var nativeByteArray = [UInt8](responseData)
			 nativeByteArray.append(sw1)
			 nativeByteArray.append(sw2)
			 
			 let byteArray = IOSByteArray(length: UInt(responseData.count + 2))
			 
			 for (index, byte) in responseData.enumerated() {
				byteArray?.replaceByte(at: UInt(index), withByte: jbyte(bitPattern: byte))
			 }
			 
			 byteArray?.replaceByte(at: UInt((byteArray?.length())! - 2), withByte: jbyte(bitPattern: sw1))
			 byteArray?.replaceByte(at: UInt((byteArray?.length())! - 1), withByte: jbyte(bitPattern: sw2))
			 
			 LogUtils.printIOSByteArray(byteArray!)
			 
			 continuation.resume(returning: byteArray)
		  }
	   }
    }
}
