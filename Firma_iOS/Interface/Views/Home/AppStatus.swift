//
//  AppStatus.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 15/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class AppStatus: ObservableObject {
    @Published var showingInfoModal = false
    @Published var showDeleteModal = false
    @Published var showSignModal = false
    @Published var showDocumentPicker = false
    @Published var selectedCertificate: AOCertificateInfo? = nil
    @Published var shouldUseNFC: Bool? = false
}
