//
//  AppStatus.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 15/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import Combine

class AppStatus: ObservableObject {
    @Published var showingInfoModal: Bool = false
    @Published var showDeleteModal: Bool = false
    @Published var showSignModal : Bool = false
    @Published var showSuccessModal: Bool = false
    @Published var showErrorModal: Bool = false
    @Published var showRecoveryModal: Bool = false
    @Published var showDocumentErrorModal: Bool = false
    @Published var showPseudonymModal: Bool = false
    @Published var showDocumentPicker: Bool = false
    @Published var showDocumentSavingPicker: Bool = false
    
    @Published var successModalState: SuccessModalState = .successCertificateAdded
    @Published var errorModalState: ErrorModalState = .trackingError
    
    @Published var errorModalDescription: String = ""
    @Published var selectedCertificate: AOCertificateInfo? = nil
    @Published var downloadedData: Data? = nil
    @Published var shouldUseNFC: Bool? = false
    @Published var languageHasChanged: Bool? = false
    @Published var updateNeeded: Bool = false
    @Published var connectionError: Bool = false
    @Published var navigateToDNI: Bool = false
    @Published var navigateToSelectCertificate = false
    @Published var navigateToAddCertificate: Bool = false
    @Published var isLoading: Bool = false
    
    var errorPublisher = PassthroughSubject<String, Never>()
}
