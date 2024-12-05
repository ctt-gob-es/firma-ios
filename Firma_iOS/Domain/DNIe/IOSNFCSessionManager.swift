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

    private var nfcSession: NFCTagReaderSession?
    var delegate: IOSNFCSessionDelegate?
    var nfcTag: NFCISO7816Tag?
    private var wasManuallyInvalidated = false
    
    
    // MARK: - Iniciar la sesión NFC
    func beginSession() {
	   guard NFCTagReaderSession.readingAvailable else {
		  print(NSLocalizedString("nfc_not_supported", comment: ""))
		  return
	   }
	   nfcSession = NFCTagReaderSession(pollingOption: [.pace], delegate: self)
	   nfcSession?.alertMessage = NSLocalizedString("nfc_dni_warning", comment: "")
	   nfcSession?.begin()
    }

    // MARK: - Reiniciar la sesión NFC
    func resetSession() {
	   nfcSession?.restartPolling()
    }

    // MARK: - Cerrar la sesión NFC
    func closeSession() {
        invalidateSessionManually()
    }

    // MARK: - NFCTagReaderSessionDelegate - Detectar etiquetas NFC
    func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {
	   delegate?.didBecomeActive()
    }

    func tagReaderSession(_ session: NFCTagReaderSession, didDetect tags: [NFCTag]) {
	   print(NSLocalizedString("nfc_detected_tags", comment: "\(tags.count)"))

	   if tags.count > 1 {
		  session.invalidate(errorMessage: NSLocalizedString("nfc_multiple_tags_error", comment: ""))
		  return
	   }

	   guard let firstTag = tags.first else {
		  session.invalidate(errorMessage: NSLocalizedString("nfc_no_tag_error", comment: ""))
		  return
	   }

	   session.connect(to: firstTag) { (error: Error?) in
		  if let error = error {
			 session.invalidate(errorMessage: String(format: NSLocalizedString("nfc_connection_error", comment: ""), error.localizedDescription))
			 return
		  }

		  switch firstTag {
			 case .feliCa(_), .iso15693(_), .miFare(_):
				session.invalidate(errorMessage: NSLocalizedString("nfc_unsupported_tag_error", comment: ""))
				return
			 case .iso7816(let iso7816Tag):
				self.nfcTag = iso7816Tag
				self.delegate?.didDetectNFC(tag: iso7816Tag)
				session.alertMessage = NSLocalizedString("nfc_dni_active_conexion_warning", comment: "")
			 @unknown default:
				session.invalidate(errorMessage: NSLocalizedString("nfc_unsupported_tag_error", comment: ""))
				return
		  }
	   }
    }

    func tagReaderSession(_ session: NFCTagReaderSession, didInvalidateWithError error: Error) {
        // Si se invalido manualmente desde codigo no lanzamos error porque ya lo tratamos previamente
        if wasManuallyInvalidated {
            wasManuallyInvalidated = false;
        } else {
            delegate?.didInvalidateNFCSession(with: error)
        }
    }

    func invalidateSessionManually() {
        wasManuallyInvalidated = true
        nfcSession?.invalidate()
    }
    
    func invalidateSessionManually(withAlertMessage: String) {
        nfcSession?.alertMessage = withAlertMessage
        invalidateSessionManually()
    }
    
    func invalidateSessionManually(withErrorMessage: String) {
        wasManuallyInvalidated = true
        nfcSession?.invalidate(errorMessage: withErrorMessage)
    }

    
    func isOpen() -> Bool {
	   return nfcSession?.isReady ?? false
    }

    func getDetectedTag() -> NFCISO7816Tag? {
	   return self.nfcTag
    }
}
