//
//  HomeViewModel.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 2/8/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

enum SignMode {
    case idCard
    case electronicCertificate
}

class HomeViewModel: ObservableObject {
    @Published var buttonEnabled: Bool? = false
    @Published var urlReceived: URL? = nil
    @Published var isLoading: Bool? = false
    @Published var signUseCase: GenericSignUseCase? = nil
    @Published var batchSignUseCase: GenericBatchSignUseCase? = nil
    @Published var localSignUseCase: GenericLocalSignUseCase? = nil
    @Published var certificateUtils: CertificateUtils? = nil
    @Published var signModel: SignModel? = nil
    @Published var parameters: NSMutableDictionary? = [:]
    @Published var buttonTitle: String? = nil
    @Published var areCertificatesSelectable: Bool? = false
    @Published var shouldSign: Bool? = false
    @Published var viewMode : ViewModes? = .sign
    @Published var showPseudonymModal: Bool = false
    @Published var appError: AppError? = nil
    @Published var successModalState: SuccessModalState? = nil
    @Published var showErrorModal: Bool? = false
    @Published var showSuccessModal: Bool? = false
    @Published var showSignCoordinatesModal: Bool = false
    @Published var signType: SignType? = nil
    @Published var dataType: DataType? = nil
    @Published var showTextfieldModal: Bool = false
    @Published var showSelectSignMode: Bool = false
    @Published var showDocumentSavingPicker: Bool = false
    @Published var downloadedData: URL? = nil
    @Published var selectDNIe: Bool = false
    @Published var selectElectronicCertificate: Bool = false
    @Published var signMode: SignMode?
    @Published var shouldCancel: Bool? = false
    @Published var annotations: [PDFAnnotation] = []
    @Published var password: String = ""
    @Published var certificates: [AOCertificateInfo] = []
    @Published var shouldReloadCertificates: Bool = false
    @Published var certificateURL: URL?
    @Published var navigateToAddCertificate: Bool = false
    @Published var navigateToInstallCertificateTutorial: Bool = false
    
    // Variables para el modal de certificado (Expirado o a punto de expirar)
    @Published var showCertificateInfoModal: Bool = false
    @Published var titleCertificateInfoModal: String = ""
    @Published var messageCertificateInfoModal: String = ""
    
    @Published var shouldLoad: Bool = true
    @Published var shouldSendStopSign: Bool = false
    
    var appStatus: AppStatus
    
    var isLocalSign: Bool = false
    var localSignData: Data?
    
    init(buttonEnabled: Bool? = false,
         urlReceived: URL? = nil,
         isLoading: Bool? = false,
         signUseCase: GenericSignUseCase? = nil,
         batchSignUseCase: GenericBatchSignUseCase? = nil,
	    localSignUseCase: GenericLocalSignUseCase? = nil,
         certificateUtils: CertificateUtils? = nil,
         signModel: SignModel? = nil,
         parameters: NSMutableDictionary? = [:],
         buttonTitle: String? = nil,
         areCertificatesSelectable: Bool? = false,
         shouldSign: Bool? = nil,
         viewMode: ViewModes? = .sign,
         shouldCancel: Bool? = nil,
         appStatus: AppStatus
    ) {
        self.buttonEnabled = buttonEnabled
        self.urlReceived = urlReceived
        self.isLoading = isLoading
        self.signUseCase = signUseCase
        self.batchSignUseCase = batchSignUseCase
	   self.localSignUseCase = localSignUseCase
        self.certificateUtils = certificateUtils
        self.signModel = signModel
        self.parameters = parameters
        self.buttonTitle = buttonTitle
        self.areCertificatesSelectable = areCertificatesSelectable
        self.shouldSign = shouldSign
        self.viewMode = viewMode
        self.shouldCancel = shouldCancel
        self.appStatus = appStatus
    }
    
    func getCertificates(_ value: Bool) {
        if value {
            if let certificates = OpenSSLCertificateHelper.getAddedCertificatesInfo() as? [AOCertificateInfo] {
                self.certificates = certificates
            } else {
                self.certificates = []
            }
            self.shouldReloadCertificates = false
        }
    }
    
    func onAppear() {
        getCertificates(true)
	   certificateUtils = CertificateUtils()
	   if shouldLoad {
		  loadData()
	   } else {
		  cancelOperation()
	   }
    }
    
    func loadData() {
        if viewMode == .sign {
            self.areCertificatesSelectable = false
            if let urlReceived = urlReceived {
			 self.appStatus.isLoading = true
                
                let parseDataUrlUseCase = ParseDataURLOperationUseCase()
                parseDataUrlUseCase.execute(url: urlReceived.absoluteString) { result in
                    self.appStatus.isLoading = false
                    switch result {
                    case .success(let dictionary):
                        self.signModel = SignModel(dictionary: dictionary)
                        self.parameters = dictionary
                        guard let signModel = self.signModel else { return }
                        self.configureMode(signModel: signModel)
                    case .failure(let error):
                        self.signModel = SignModel(dictionary: parseDataUrlUseCase.getOpParameters())
                        self.handleOperationError(appError: error)
                    }
                }
            } else {
               handleLocalSing()
            }
        }
    }
    
    func handleLocalSing() {
        self.signModel = SignModel(dictionary: NSMutableDictionary())
        
        if let signModel = self.signModel {
            checkStickyData(signModel: signModel)
        }
        
	   self.viewMode = .sign
	   self.isLocalSign = true
	   self.signModel?.operation = OPERATION_SIGN
	   self.signModel?.signFormat = PADES_FORMAT
	   self.signModel?.visibleSignature =
		  (UserDefaults.standard.object(forKey: "isSignatureVisible") == nil ||
		   UserDefaults.standard.bool(forKey: "isSignatureVisible")) ? .want : VisibleSignatureType.none
	   chooseButtonTitle()
	   appStatus.showDocumentImportingPicker = true
    }
    
    func handleCertificateChange(_ value: AOCertificateInfo?) {
        guard let value = value else { return }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let isButtonEnabled = SwiftCertificateUtils.updateSelectedCertificate(certificateUtils: self.certificateUtils, value.subject)
            
            DispatchQueue.main.async {
                self.buttonEnabled = isButtonEnabled
            }
        }
    }
    
    func handleSignModeChange() {
	   areCertificatesSelectable = false
	   DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
		  if self.signModel?.isSignatureCoordinatesRequired() ?? false{
			 self.showSignCoordinatesModal = true
		  }
		  self.areCertificatesSelectable = true
	   }
    }
    
    func handleShouldSignChange(_ value: Bool) {
        if value {
            if signMode == nil {
                selectSignMode()
            } else {
                handleButtonAction()
                shouldSign = false
            }
        }
    }
    
    
    func selectSignMode() {
        let nfcEnabled = UserDefaults.standard.object(forKey: "isNfcEnabled") == nil ? true : UserDefaults.standard.bool(forKey: "isNfcEnabled")
        
        if nfcEnabled && !(self.appStatus.shouldAutosign && appStatus.selectedCertificate != nil){
            showSelectSignMode = true
        } else {
            if certificates.isEmpty {
                sendErrorOperation(error: AppError.certificateNeeded)
            } else {
                areCertificatesSelectable = true
                signMode = .electronicCertificate
                
                if self.signModel?.isSignatureCoordinatesRequired() ?? false {
                    self.showSignCoordinatesModal = true
                } else {
                    if (self.appStatus.shouldAutosign) {
                        stickyOperation()
                    }
                }
            }
        }
    }
    
    func handleImportedDataURLsChange(_ value: [URL]?) {
        self.appStatus.isLoading = true
        LoadDataLocalFileUseCase().execute(urlFile: value, signModel: signModel) {result in
            switch result {
            case .success(let (filename, stringData)):
                self.appStatus.isLoading = false
                
                // Si tenemos firma visible opcional o requerida y es una firma PDF comprobamos que el formato sea PDF
                if self.signModel?.isSignatureCoordinatesRequired() ?? false {
                    //Check if the data is a PDF
                    if !FileUtils.isBase64StringPDF(stringData) {
                        self.appStatus.appError = AppError.selectedFileIsNotPDF
                        self.appStatus.showErrorModal = true
                        return
                    }
                }
                self.signModel?.datosInUse = stringData
                self.signModel?.filename = filename
				
			 self.selectSignMode()
            case .failure(let error):
                self.showError(appError: error)
            }
        }
    }
    
    private func configureMode(signModel: SignModel) {
	   var shouldSelectSignMode = false
	   
        checkStickyData(signModel: signModel)
        
	   dataType = .external

	   if [OPERATION_SIGN, OPERATION_COSIGN, OPERATION_COUNTERSIGN].contains(signModel.operation) {
		  let nfcEnabled = UserDefaults.standard.object(forKey: "isNfcEnabled") == nil ? true : UserDefaults.standard.bool(forKey: "isNfcEnabled")

		  if !nfcEnabled && certificates.isEmpty {
			 sendErrorOperation(error: AppError.certificateNeeded)
			 return
		  }

		  if signModel.datosInUse == nil && signModel.fileId == nil {
			 //Prevent warning while presenting a view whose is not in the window hierarchy
			 DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
				self.appStatus.showDocumentImportingPicker = true
			 }
			 dataType = .local
		  }
	   }

	   if [OPERATION_SIGN, OPERATION_COSIGN, OPERATION_COUNTERSIGN, OPERATION_BATCH].contains(signModel.operation) {
		  // MARK: Sign operation
		  shouldSelectSignMode = true
	   } else if signModel.operation == OPERATION_SAVE {
		  // MARK: Save operation
		  areCertificatesSelectable = false
		  viewMode = .home
		  handleOperationSaveData()
	   } else {
		  // MARK: Certificate selection
		  handleCertificateSelectionAction()
	   }

	   DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
		  if self.appStatus.showDocumentImportingPicker == false {
			 if shouldSelectSignMode {
                    self.selectSignMode()
			 }
		  }
	   }

	   chooseButtonTitle()
    }
    
    private func handleCertificateSelectionAction() {
	   if certificates.isEmpty {
		  sendErrorOperation(error: AppError.certificateNeeded)
	   } else {
		  signMode = .electronicCertificate
		  areCertificatesSelectable = true
		  
            if appStatus.shouldAutosign {
			 stickyOperation()
		  }
	   }
    }
    
    private func chooseButtonTitle() {
	   switch signModel?.operation {
	   case OPERATION_SELECT_CERTIFICATE:
		  buttonTitle = NSLocalizedString("send", bundle: Bundle.main, comment: "")
	   case OPERATION_SIGN,
		  OPERATION_BATCH,
		  OPERATION_COSIGN,
		  OPERATION_COUNTERSIGN:
		  buttonTitle = NSLocalizedString("home_certificates_sign_button_title", bundle: Bundle.main, comment: "")
	   case OPERATION_SAVE:
		  buttonTitle = nil
	   default:
		  break
	   }
    }
    
    func handleButtonAction() {
        if signMode == nil {
            selectSignMode()
            return
        } else if signMode == .electronicCertificate {
            if certificates.isEmpty {
			 sendErrorOperation(error: AppError.certificateNeeded)
		  } else {
                // La operacion de guardado no necesita comprobar certificado porque no tiene certificado
                if let signModel = signModel, let operation = signModel.operation, operation == OPERATION_SAVE {
                    handleOperationSignWithElectronicCertificate()
                } else {
                    // Comprobamos el certificado seleccionado por si hay que mostrar avisos y continua la operacion
                    checkCertificateSelected()
                }
		  }
        }
    }
    
    func handleOperationSuccess(successState: SuccessModalState) {
	   DispatchQueue.main.async {
		  self.allowScreenSleep()
		  self.resetHomeViewModelVariables()
		  
		  if let baseURL = self.signModel?.returnURL,
			let stservlet = self.signModel?.urlServlet,
			let docId = self.signModel?.docId {
			 
			 // Si tiene url de retorno navegamos y no se muuestra pop up
			 var urlComponents = URLComponents(string: baseURL + "success")!
			 urlComponents.queryItems = [
				URLQueryItem(name: "stservlet", value: stservlet),
				URLQueryItem(name: "docId", value: docId)
			 ]
			 
			 if let finalURL = urlComponents.url {
				UIApplication.shared.open(finalURL) { success in
				    
				}
			 }
		  } else {
			 // si no tienen return URL mostramos dialogo de success
			 self.successModalState = successState
			 self.showSuccessModal = true
		  }
	   }
    }
    
    func handleOperationError(appError: AppError) {
	   DispatchQueue.main.async {
		  self.allowScreenSleep()
		  self.resetHomeViewModelVariables()
		  
		  if let baseURL = self.signModel?.returnURL {
			 
			 // Si tiene url de retorno navegamos y no se muuestra pop up
			 var urlComponents = URLComponents(string: baseURL + "failure")!
			 urlComponents.queryItems = [
				URLQueryItem(name: "code", value: String(appError.code)),
				URLQueryItem(name: "description", value: String(appError.description))
			 ]
			 
			 if let finalURL = urlComponents.url {
				UIApplication.shared.open(finalURL) { success in
				    
				}
			 }
		  } else {
			 // si no tienen return URL mostramos dialogo de error
			 self.showError(appError: appError)
		  }
	   }
    }
    
    /*func handleOpenReturnURL(success: Bool) -> Bool {
	   guard let baseURL = signModel?.returnURL,
		    let stservlet = signModel?.urlServlet,
		    let docId = signModel?.docId else {
		  return false
	   }
	   
	   var urlComponents: URLComponents
	   
	   if success {
		  urlComponents = URLComponents(string: baseURL + "success")!
		  urlComponents.queryItems = [
			 URLQueryItem(name: "stservlet", value: stservlet),
			 URLQueryItem(name: "docId", value: docId)
		  ]
	   } else {
		  urlComponents = URLComponents(string: baseURL + "failure")!
		  urlComponents.queryItems = [
			 URLQueryItem(name: "code", value: String(appStatus.appError?.code ?? AppError.generalSoftwareError.code)),
                URLQueryItem(name: "description", value: String(appStatus.appError?.description ?? AppError.generalSoftwareError.description))
		  ]
	   }
	   
	   if let finalURL = urlComponents.url {
		  UIApplication.shared.open(finalURL) { success in
			 print("Open \(success) with URL: \(finalURL)")
		  }
	   }
        return true
    }*/
    
    private func handleOperationSelectCertificate() {
        guard let certificateData = certificateUtils?.base64UrlSafeCertificateData,
              let signModel = signModel else {
            return
        }
        
	   self.appStatus.isLoading = true
	   
	   SendCertificateUseCase().execute(base64Certificate: certificateData, signModel: signModel) { appError in
		  DispatchQueue.main.async {
			 self.appStatus.isLoading = false

			 if let appError = appError {
				self.showError(appError: appError)
			 } else {
				self.viewMode = .home
				self.successModalState = .successCertificateSent
				self.showSuccessModal = true
				self.areCertificatesSelectable = false
			 }
		  }
	   }
    }
    
    func handleOperationSign() {
	   DispatchQueue.main.async {
		  self.preventScreenSleep()
		  self.appStatus.isLoading = true
	   }
        if isLocalSign {
            signLocalPdf()
        } else {
		  signWeb()
        }
    }
    
    private func handleOperationBatch() {
        if signMode == .electronicCertificate {
            guard let certificateData = certificateUtils?.base64UrlSafeCertificateData,
                  let privateKey = certificateUtils?.privateKey else {
                return
            }
            batchSignUseCase = CertificateBatchSignUseCase(certificate: certificateData, privateKey: privateKey)
        }
	   
	   DispatchQueue.main.async {
		  self.preventScreenSleep()
		  self.appStatus.isLoading = true
	   }
	   
        batchSignUseCase?.signBatch(dataOperation: parameters as! [String : Any]) { result in
		  DispatchQueue.main.async {
			 self.appStatus.isLoading = false
		  }
            switch result {
            case .success(_):
                let history = HistoryModel(
                    date: Date(),
                    signType: self.signType ?? .external,
                    dataType: self.dataType ?? .external,
                    externalApp: self.signModel?.appname,
                    filename: nil,
                    returnURL: self.signModel?.returnURL,
                    operation: self.signModel?.operation
                )
               
                HistoricalUseCase().saveHistory(history: history) { result in
                    // Independientemente del resultado del guardado en historico, mostramos que la firma ha sido correcta
                    self.handleOperationSuccess(successState: .successSign)
                }
            case .failure(let error):
                self.handleOperationError(appError: error)
            }
        }
    }
    
    private func getSuccessModal(_ resultBatch: BatchResult) -> SuccessModalState {
        switch resultBatch {
        case .ok:
            return .successSignBatch
        case .signsWithError:
            return .successSignBatchWithError
        case .allSignWihtError:
            return .successSignBatchWithAllError
        }
    }
    
    func handleOperationSaveData() {
        if let receivedStringData = signModel?.datosInUse {
		  let archiveName: String
		  if isLocalSign {
			 if let name = appStatus.importedDataArchiveName {
				archiveName = name + "_signed.pdf"
			 } else {
				archiveName = FileUtils.getArchiveNameFromParameters(parameters: parameters)
			 }
		  } else {
			 archiveName = FileUtils.getArchiveNameFromParameters(parameters: parameters)
		  }
		  
            SaveDataUseCase().saveFileFromBase64Data(
                archiveName: archiveName,
                base64Data: receivedStringData
            ) { result in
                switch result {
                case .success(let url):
                    self.downloadedData = url
                    self.showDocumentSavingPicker = true
                case .failure(let error):
                    self.sendErrorOperation(error: error)
                }
            }
        }
    }
    
    func showError(appError: AppError) {
        resetHomeViewModelVariables()
        self.appStatus.isLoading = false
        DispatchQueue.main.async {
           self.showErrorModal = false
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
               self.appError = appError
               self.showErrorModal = true
               self.signModel?.returnURL = nil
           }
        }
    }
    
    private func signWeb() {
	   guard let signModel = self.signModel else { return }
	   self.signUseCase = SingleSignUseCase(signModel: signModel, certificateUtils: certificateUtils)
	   self.signUseCase?.singleSign { result in
		  DispatchQueue.main.async {
			 self.appStatus.isLoading = false
			 
			 switch result {
			 case .success(let shouldRetry):
				if shouldRetry {
				    self.showTextfieldModal = true
				} else {
				    let history = HistoryModel(
					   date: Date(),
					   signType: self.signType ?? .external,
					   dataType: self.dataType ?? .external,
					   externalApp: self.signModel?.appname,
					   filename: self.signModel?.filename,
					   returnURL: self.signModel?.returnURL,
					   operation: self.signModel?.operation
				    )
				    
				    HistoricalUseCase().saveHistory(history: history) { result in
					   // Independientemente del resultado del guardado en historico, mostramos que la firma ha sido correcta
					   self.handleOperationSuccess(successState: .successSign)
				    }
				}
				
			 case .failure(let error):
				self.handleOperationError(appError: error)
			 }
		  }
	   }
    }
    
    private func signLocalPdf() {
	   guard let signModel = self.signModel else { return }
	   self.localSignUseCase = CertificateLocalSignUseCase(signModel: signModel, certificateUtils: certificateUtils)
	   DispatchQueue.main.async {
		  self.appStatus.isLoading = true
	   }
	   self.localSignUseCase?.executeSign(completion: { result in
		  switch result {
			 case .success(let shouldRetry):
				if shouldRetry {
				    self.showTextfieldModal = true
				} else {
				    let history = HistoryModel(
					   date: Date(),
					   signType: .local,
					   dataType: .local,
					   externalApp: self.signModel?.appname,
					   filename: self.signModel?.filename,
					   returnURL: self.signModel?.returnURL,
					   operation: self.signModel?.operation
				    )
				    
				    HistoricalUseCase().saveHistory(history: history) { result in
					   // Independientemente del resultado del guardado en historico, mostramos que la firma ha sido correcta
					   self.appStatus.showDocumentSavingPicker = true
					   self.handleOperationSaveData()
					   self.resetHomeViewModelVariables()
				    }
				}

			 case .failure(let error):
				self.showError(appError: error)
		  }
	   })
    }
    
    private func showCertificateInfoModal(title: String, message: String) {
        titleCertificateInfoModal = title
        messageCertificateInfoModal = message
        showCertificateInfoModal = true
    }
    
    enum CheckCertificateStep {
        case initial
        case pseudonymPass
        case expiredNearPass
    }
    
    /// Comprubea el certificado seleccionado par verificar si es de psuedomimo, a punto de caducar o caducado y mostrsar los avisos correspondientes.
    /// En caso de que se realizen todas la compronbaciones se lanza la operacion
    func checkCertificateSelected(step: CheckCertificateStep = .initial) {
        switch step {
        case .initial:
            // Compronbamos si es de pseudonimo
            if (!checkCertificatePseudonym()) {
                checkCertificateSelected(step: .pseudonymPass)
            }
        case .pseudonymPass:
            if (!checkCertificateExpiredOrNear()) {
                checkCertificateSelected(step: .expiredNearPass)
            }
        case .expiredNearPass:
		  showCertificateInfoModal = false
		  handleOperationSignWithElectronicCertificate()
        }
    }
    
    /// Comprueba si el certificado es de pseudonimo.
    /// En caso de ser pesudonimo muestra aviso y devuelve true
    private func checkCertificatePseudonym() -> Bool {
        guard let certificateUtils = self.certificateUtils,
              let selectedCertificateName = certificateUtils.selectedCertificateName else {
            return false
        }
        
        if (certificateUtils.isPseudonymCertificate(SwiftCertificateUtils.getIdentityFromKeychain(certName: selectedCertificateName))) {
            self.showPseudonymModal = true
            return true
        }

        return false
    }
    
    /// Comprueba si el certificado esta  caducado o a punto de caducar.
    /// En ese caso muestra aviso y devuelve true
    private func checkCertificateExpiredOrNear() -> Bool {
        // Comprobamos si esta caducado o a punto de caducar para mostrar aviso
        if let selectedCertificate = appStatus.selectedCertificate {
            let certExpiration = SwiftCertificateUtils.getCertificateOption(certificate: selectedCertificate)
            if (certExpiration == .expired) {
                showCertificateInfoModal(title: "certificate_expired_title", message: "certificate_expired_description")
                return true
            } else if (certExpiration == .almostExpired) {
                showCertificateInfoModal(title: "certificate_near_expiry_title", message: "certificate_near_expiry_description")
                return true
            }
        }
        return false
    }
    
    private func handleOperationSignWithElectronicCertificate() {
        guard let signModel = self.signModel else { return }
        guard let operation = signModel.operation else { return }
	   self.preventScreenSleep()
	   switch operation {
		  case OPERATION_SELECT_CERTIFICATE:
                handleOperationSelectCertificate()
		  case OPERATION_SIGN,
			 OPERATION_COSIGN,
                OPERATION_COUNTERSIGN:
			 handleOperationSign()
		  case OPERATION_BATCH:
			 handleOperationBatch()
		  case OPERATION_SAVE:
			 handleOperationSaveData()
		  default:
			 break
			 //TODO: HANDLE ERROR: SIGN OPERATION NOT SUPPORTED
	   }
    }
    
    func handleCoordinatesSelection(annotation: PDFAnnotation) {
	   if let signModel = signModel {
		  PDFCoordinateUtils.setCoordinatesFromAnnotation(signModel: signModel, annotation: annotation)
            if appStatus.shouldAutosign {
			 stickyOperation()
		  }
	   }
    }
    
    func handlePasswordEncryption(password: String) {
	   self.signModel?.updateExtraParams(dict: ["ownerPassword": password])
        if appStatus.shouldAutosign {
            stickyOperation()
        }
    }
    
    /// Envia el error en la operación al servidor intermedio, resetea la vista y muestra la pantalla de error
    func sendErrorOperation(error: AppError) {
	   if !isLocalSign {
		  SendErrorOperationUseCase().execute(error: error, signModel: signModel)
	   }
        handleOperationError(appError: error)
    }
    
    func cancelOperation() {
	   self.allowScreenSleep()
        if (self.viewMode == .sign) {
		  if !isLocalSign {
			 SendErrorOperationUseCase().execute(error: AppError.userOperationCanceled, signModel: signModel)
		  }
            handleOperationError(appError: AppError.userOperationCanceled)
        } else {
            resetHomeViewModelVariables()
        }
    }
    
    func successOperationSaveFile() {
        viewMode = .home
	   self.showDocumentSavingPicker = false
        appStatus.showSuccessModal = true
	   appStatus.isLoading = false
	   if !isLocalSign {
		  appStatus.successModalState = .successArhiveAdded
		  SendSuccessOperationUseCase().execute(signModel: self.signModel)
	   } else {
		  appStatus.successModalState = .successSign
	   }
	   resetHomeViewModelVariables()
    }
    
    func cancelOperationSaveFile() {
	   if !isLocalSign {
		  SendErrorOperationUseCase().execute(error: AppError.userOperationSaveCanceled, signModel: signModel)
	   }
        handleOperationError(appError: AppError.userOperationSaveCanceled)
    }
    
    func handleNotAnyCoordinatesSelected() {
        // Si no se meten coordenadas y es obligatoria la firma se cancela la operacion
	   if signModel?.isSignatureCoordinatesMandatory() ?? false {
		  cancelOperation()
	   }
    }
    
    func resetHomeViewModelVariables() {
	   self.allowScreenSleep()
	   // We set lastDateAutoSign or delete selected certicate
        if appStatus.shouldAutosign {
            self.appStatus.lastDateAutoSign = Date()
        }
	   
	   DispatchQueue.main.async {
		  self.selectElectronicCertificate = false
          self.showSignCoordinatesModal = false
          self.appStatus.showDocumentImportingPicker = false
		  self.selectDNIe = false
		  self.viewMode = .home
		  self.areCertificatesSelectable = false
		  self.appStatus.keepParentController = false
		  if !self.appStatus.shouldAutosign {
			 self.appStatus.selectedCertificate = nil
		  }
		  self.annotations = []
	   }
    }
    
    func stickyOperation() {
	   if let selectedCertificate = appStatus.selectedCertificate {
		  Task {
			 _ = SwiftCertificateUtils.updateSelectedCertificate(
				certificateUtils: certificateUtils,
				selectedCertificate.subject
			 )

			 await MainActor.run {
				handleOperationSignWithElectronicCertificate()
			 }
		  }
	   }
    }
    
    /**
     Check Sticky values. If sticky is true set autosing in other case clear all data Sticky. If resetSticky is true clear all data Sticky
     */
    private func checkStickyData(signModel: SignModel) {
        // First check if date is expired. In that case, clear data Sticky
        if let lastDateAutoSign = appStatus.lastDateAutoSign {
            let secondsPassed = Date().timeIntervalSince(lastDateAutoSign)
            if Int(secondsPassed) > TimeoutConstants.stickyTimeoutInSeconds {
                clearDataSticky()
            }
        } else {
            clearDataSticky()
        }
        
        if signModel.resetSticky == "true" {
            clearDataSticky()
        }
        
        if signModel.sticky == "true" {
            appStatus.shouldAutosign = true
        } else {
            clearDataSticky()
        }
    }
    
    /**
        Clean all data related Sticky: All data of appstatus and selected certificate
     */
    func clearDataSticky() {
        self.appStatus.cleanAutosignVariables()
        _ = SwiftCertificateUtils.updateSelectedCertificate(certificateUtils: self.certificateUtils, "")
    }
    
    
    private func preventScreenSleep() {
	   UIApplication.shared.isIdleTimerDisabled = true
    }

    private func allowScreenSleep() {
	   UIApplication.shared.isIdleTimerDisabled = false
    }
}
