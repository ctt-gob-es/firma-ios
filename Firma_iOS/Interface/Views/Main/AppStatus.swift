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
    @Published var showSuccessModal: Bool = false
    @Published var showErrorModal: Bool = false
    @Published var showRecoveryModal: Bool = false
    @Published var showDocumentErrorModal: Bool = false
    @Published var showDocumentPicker: Bool = false
    @Published var showDocumentSavingPicker: Bool = false
    @Published var showDocumentImportingPicker: Bool = false
    @Published var showSignCoordinatesModal: Bool = false
    
    @Published var successModalState: SuccessModalState = .successCertificateAdded
    @Published var appError: AppError?
    
    @Published var selectedCertificate: AOCertificateInfo? = nil
    @Published var importedDataArchiveName: String? = nil
    @Published var shouldUseNFC: Bool? = false
    @Published var languageHasChanged: Bool? = false
    @Published var updateNeeded: Bool = false
    @Published var connectionError: Bool = false
    @Published var navigateToSelectCertificate = false
    @Published var keepParentController = false
    @Published var isLoading: Bool = false
    
    @Published var userIDCAN: String? = nil
    @Published var userIDPIN: String? = nil
    
    @Published var shouldAutosign: Bool = false {
	   didSet {
		  if shouldAutosign {
			 resetSticky()
		  }
	   }
    }
    
    private var stickyTimer: Timer?
    
    private func resetSticky() {
	   stickyTimer?.invalidate()
	   stickyTimer = Timer.scheduledTimer(withTimeInterval: TimeInterval(STICKY_TIMER), repeats: false) { [weak self] _ in
		  DispatchQueue.main.async {
			 self?.shouldAutosign = false
		  }
	   }
    }
}
