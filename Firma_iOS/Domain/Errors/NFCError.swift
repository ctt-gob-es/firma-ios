//
//  NFCError.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 24/9/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

struct NFCError: Identifiable, LocalizedError {
    var id = UUID()
    var errorDescription: String?
}
