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
    @State var dataToSign: Data? = nil
    @State var algorithm: String
    @Published var nfcError: NFCError?
    @Published var sessionActiveMessage: String = ""
    @Published var resultMessage: String?
    
    private var dniWrapper: SwiftDNIeWrapper?
    
    init(can: String, pin: String, algorithm: String) {
	   self.can = can
	   self.pin = pin
	   self.algorithm = algorithm
    }
    
    func getDNIeNFC(completion: DNIeResult) {
	   self.dniWrapper = SwiftDNIeWrapper(can: can, pin: pin)
	   dniWrapper?.getDNIe(completion: completion)
	   self.sessionActiveMessage = "Sesión NFC activa. Acerca el dispositivo al DNIe."
    }
    
    func signData(dnie: EsGobJmulticardCardDnieDnieNfc, dataToSign: Data) {
	   
    }
}
