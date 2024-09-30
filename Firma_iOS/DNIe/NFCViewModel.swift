//
//  NFCViewModel.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 24/9/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import CoreNFC
import SwiftUI

class NFCViewModel: NSObject, ObservableObject {
    
    @State var can: String
    @State var pin: String
    @Published var nfcError: NFCError?
    @Published var sessionActiveMessage: String = ""
    @Published var resultMessage: String?
    
    private var dniService: DNIeService?
    
    init(can: String, pin: String) {
	   self.can = can
	   self.pin = pin
    }
    
    func startNFCSession() {
	   self.dniService = DNIeService(
		  can: can,
		  pin: pin
	   )
	   dniService?.initializeDNIeConnection()
	   sessionActiveMessage = "Sesión NFC activa. Acerca el dispositivo al DNIe."
    }
    
    func fetchDNIeInfo() {
	   do {
		  if let dnie = try dniService?.getDNIe() {
			 resultMessage = "DNIe obtenido con éxito"
		  }
	   } catch {
		  nfcError = NFCError(errorDescription: "Error al obtener el DNIe")
	   }
    }
    
    func checkPinRetries() -> Int {
	   return dniService?.getRemainingPinRetries() ?? 0
    }
}
