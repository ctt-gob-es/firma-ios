//
//  IOSNFCSessionManager.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 25/9/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import CoreNFC

protocol IOSNFCSessionDelegate: AnyObject {
    func didDetectNFC(tag: NFCISO7816Tag)
    func didInvalidateNFCSession(with error: Error)
    func didBecomeActive()
}

class IOSNFCSessionManager: NSObject, NFCTagReaderSessionDelegate {
    
    internal var nfcSession: NFCTagReaderSession?
    var delegate: IOSNFCSessionDelegate?
    var nfcTag: NFCISO7816Tag?
    
    // MARK: - Iniciar la sesión NFC
    func beginSession() {
	   guard NFCTagReaderSession.readingAvailable else {
		  print("Este dispositivo no soporta NFC.")
		  return
	   }
	   nfcSession = NFCTagReaderSession(pollingOption: [.iso14443], delegate: self)
	   nfcSession?.alertMessage = "Acerca tu dispositivo a la etiqueta NFC para leer."
	   nfcSession?.begin()
    }
    
    // MARK: - Reiniciar la sesión NFC
    func resetSession() {
	   nfcSession?.restartPolling()
    }
    
    // MARK: - Cerrar la sesión NFC
    func closeSession() {
	   nfcSession?.invalidate()
    }
    
    // MARK: - NFCTagReaderSessionDelegate - Detectar etiquetas NFC
    func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {
	   delegate?.didBecomeActive()
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didDetect tags: [NFCTag]) {
	   print("Detected \(tags.count) tags")
	   
	   if tags.count > 1 {
		  session.invalidate(errorMessage: "More than 1 tag was found. Please present only 1 tag.")
		  return
	   }
	   
	   guard let firstTag = tags.first else {
		  session.invalidate(errorMessage: "Unable to get first tag")
		  return
	   }
	   
	   session.connect(to: firstTag) { (error: Error?) in
		  if let error = error {
			 session.invalidate(errorMessage: "Error al conectar con la etiqueta NFC: \(error.localizedDescription)")
			 return
		  }
		  
		  switch firstTag {
			 case .feliCa(_), .iso15693(_), .miFare(_):
				session.invalidate(errorMessage: "La etiqueta detectada no es compatible.")
				return
			 case .iso7816(let iso7816Tag):
				self.nfcTag = iso7816Tag
				self.delegate?.didDetectNFC(tag: iso7816Tag)
			 @unknown default:
				session.invalidate(errorMessage: "La etiqueta detectada no es compatible.")
				return
		  }
	   }
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didInvalidateWithError error: Error) {
	   delegate?.didInvalidateNFCSession(with: error)
    }
    
    func isOpen() -> Bool {
	   return nfcSession?.isReady ?? false
    }
    
    func getDetectedTag() -> NFCISO7816Tag? {
	   return self.nfcTag
    }
}
