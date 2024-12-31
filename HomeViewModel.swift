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
    @Published var showDocumentImportingPicker: Bool? = false
    @Published var errorModalDescription: String? = ""
    @Published var showSignCoordinatesModal: Bool = false
    @Published var signType: SignType? = nil
    @Published var dataType: DataType? = nil
    @Published var showTextfieldModal: Bool = false
    @Published var showSelectSignMode: Bool = false
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
    
    // Variables para el modal de certificado (Expirado o a punto de expirar)
    @Published var showCertificateInfoModal: Bool = false
    @Published var titleCertificateInfoModal: String = ""
    @Published var messageCertificateInfoModal: String = ""
    
    var appStatus: AppStatus
    
    var isLocalSign: Bool = false
    var localSignData: Data?
    
    init(buttonEnabled: Bool? = false,
         urlReceived: URL? = nil,
         isLoading: Bool? = false,
         signUseCase: GenericSignUseCase? = nil,
         batchSignUseCase: GenericBatchSignUseCase? = nil,
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
        loadData()
    }
    
    func loadData() {
        certificateUtils = CertificateUtils()
        if viewMode == .sign {
            self.areCertificatesSelectable = false
            if let urlReceived = urlReceived {
                isLoading = true
                
                let parseDataUrlUseCase = ParseDataURLOperationUseCase()
                parseDataUrlUseCase.execute(url: urlReceived.absoluteString) { result in
                    self.isLoading = false
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
                //TODO: If we don't have any URL, its signing locally
                self.isLocalSign = true
                self.signModel = SignModel(dictionary: NSMutableDictionary())
                self.signUseCase = SingleSignUseCase(signModel: signModel!, certificateUtils: certificateUtils)
                configureMode(signModel: signModel!)
            }
        }
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
        if nfcEnabled {
            showSelectSignMode = true
        } else {
            if certificates.isEmpty {
			 sendErrorOperation(error: AppError.certificateNeeded)
            } else {
                areCertificatesSelectable = true
                signMode = .electronicCertificate
                if let visibleSignature = self.signModel?.visibleSignature {
                    self.showSignCoordinatesModal = true
                }
            }
        }
    }
    
    func handleImportedDataURLsChange(_ value: [URL]?) {
        self.isLoading = true
        LoadDataLocalFileUseCase().execute(urlFile: value, signModel: signModel) {result in
            switch result {
            case .success(let stringData):
                self.signModel?.datosInUse = stringData
                self.isLoading = false
                self.selectSignMode()
            case .failure(let error):
                self.showError(appError: error)
            }
        }
    }
    
    private func configureMode(signModel: SignModel) {
        // Por defecto la firma es externa
        dataType = .external
        
        if (signModel.operation == OPERATION_SIGN || signModel.operation == OPERATION_COSIGN || signModel.operation == OPERATION_COUNTERSIGN) {
		  // Si el NFC está deshabilitado, deberemos comprobar si hay certificados antes de escoger archivo, sólo podremos comprobarlo si está deshabilitado, ya que si no podría escoger firmar con DNI
		  let nfcEnabled = UserDefaults.standard.object(forKey: "isNfcEnabled") == nil ? true : UserDefaults.standard.bool(forKey: "isNfcEnabled")
		  if !nfcEnabled {
                if certificates.isEmpty {
				sendErrorOperation(error: AppError.certificateNeeded)
				return
			 }
		  }
		  
            if signModel.datosInUse == nil && signModel.fileId == nil {
                // No tenemos datos para firmar. Es una firma seleccionando fichero local. Mostramos el picker y establecemos el dataType a .local
                showDocumentImportingPicker = true
                dataType = .local
            }
        }
        
        // Si es firma o batch hay que seleccionar con que se quiere realizar (certificado o dnie). Para el sendcertificate o save, es siempre certificado
        if (signModel.operation == OPERATION_SIGN || signModel.operation == OPERATION_COSIGN || signModel.operation == OPERATION_COUNTERSIGN || signModel.operation == OPERATION_BATCH) {
            if(!(showDocumentImportingPicker ?? false)) {
                selectSignMode()
            }
	   } else {
		  // La operación de guardado no necesita certificados
		  if signModel.operation == OPERATION_SAVE {
			 areCertificatesSelectable = false
			 viewMode = .home
			 handleOperationSaveData()
		  } else {
			 // Ya que esta operación solo es para certificados, debemos comprobar si disponemos de ellos
                if certificates.isEmpty {
				sendErrorOperation(error: AppError.certificateNeeded)
			 } else {
				signMode = .electronicCertificate
				areCertificatesSelectable = true
			 }
		  }
	   }
	   
	   // Establecemos el nombre del boton
	   chooseButtonTitle()
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
                    // Compronbamos el certificado seleccionado por si hay que mostrar avisos y continua la operacion
                    checkCertificateSelected()
                }
		  }
        }
    }
    
    func handleOperationSuccess(successState: SuccessModalState) {
        resetHomeViewModelVariables()
        
        if let baseURL = signModel?.returnURL,
             let stservlet = signModel?.urlServlet,
             let docId = signModel?.docId {
            
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
    
    func handleOperationError(appError: AppError) {
        resetHomeViewModelVariables()
        
        if let baseURL = signModel?.returnURL {
            
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
        
        SendCertificateUseCase().execute(base64Certificate: certificateData, signModel: signModel) { appError in
            self.isLoading = false
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
    
    private func handleOperationSign() {
        if isLocalSign {
            signLocalPdf()
        } else {
            guard let signModel = self.signModel else { return }
            self.signUseCase = SingleSignUseCase(signModel: signModel, certificateUtils: certificateUtils)
            self.signUseCase?.singleSign { result in
                DispatchQueue.main.async {
                    self.isLoading = false
                    
                    switch result {
                    case .success(let shouldRetry):
                        if shouldRetry {
                            self.showTextfieldModal = true
                        } else {
                            let history = HistoryModel(
                                date: Date(),
                                signType: self.signType ?? .external,
                                externalApp: self.signModel?.appname,
                                dataType: self.dataType ?? .external,
                                filename: FileUtils.getArchiveNameFromParameters(parameters: self.parameters)
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
    }
    
    private func handleOperationBatch() {
        if signMode == .electronicCertificate {
            guard let certificateData = certificateUtils?.base64UrlSafeCertificateData,
                  let privateKey = certificateUtils?.privateKey else {
                return
            }
            batchSignUseCase = CertificateBatchSignUseCase(certificate: certificateData, privateKey: privateKey)
        }
        
        batchSignUseCase?.signBatch(dataOperation: parameters as! [String : Any]) { result in
            self.isLoading = false
            
            switch result {
            case .success(let resultBatch):
                self.handleOperationSuccess(successState: self.getSuccessModal(resultBatch))
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
    
    private func handleOperationSaveData() {
        if let receivedStringData = signModel?.datosInUse {
            SaveDataUseCase().saveFileFromBase64Data(
                archiveName: FileUtils.getArchiveNameFromParameters(parameters: parameters),
                base64Data: receivedStringData
            ) { result in
                self.isLoading = false
                switch result {
                case .success(let url):
                    self.appStatus.downloadedData = url
                    self.appStatus.showDocumentSavingPicker = true
                case .failure(let error):
                    self.showError(appError: error)
                }
            }
        }
    }
    
    func showError(appError: AppError) {
        resetHomeViewModelVariables()
        self.isLoading = false
        DispatchQueue.main.async {
           self.showErrorModal = false
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
               self.appError = appError
               self.showErrorModal = true
               self.signModel?.returnURL = nil
           }
        }
    }
    
    func signLocalPdf() {
	   guard
		  //let stringBase64Data = PDFConstants.mockPDFString,
		  let pdfData = Base64Utils.decode(PDFConstants.mockPDFString, urlSafe: true),
		  let privateKeyRef = certificateUtils?.privateKey,
		  let certificateName = certificateUtils?.selectedCertificateName,
		  let identity = SwiftCertificateUtils.getIdentityFromKeychain(certName: certificateName),
		  let certificateRef = SwiftCertificateUtils.getCertificateRefFromIdentity(identity: identity),
		  let certificateAlgorithm = SwiftCertificateUtils.getAlgorithmFromCertificate(certificate: certificateRef) else {
		  print("Missing required data for signing")
            showError(appError: AppError.generalSoftwareError)
		  isLoading = false
		  return
	   }
	   
	   let extraParams = [
		  "signaturePositionOnPageLowerLeftX": "0",
		  "signaturePositionOnPageLowerLeftY": "0",
		  "signaturePositionOnPageUpperRightX": "200",
		  "signaturePositionOnPageUpperRightY": "200",
		  "signaturePages": "1"
	   ]
	   
	   let swiftPadesUtils = PadesUtilsSwift()
	   swiftPadesUtils.signPdf(
		  pdfData: pdfData,
		  signAlgorithm: nil,
		  privateKey: privateKeyRef,
		  certificateRef: certificateRef,
		  certificateAlgorithm: certificateAlgorithm,
		  extraParams: extraParams
	   ) { result in
            switch result {
            case .success(_):
                self.viewMode = .home
                self.successModalState = .successSign
                self.showSuccessModal = true
            case.failure(let error):
                // Al ser firma local no necesitamos enviar error al servidor
                self.showError(appError: error)
            }
		  
	   }
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
        
        isLoading = true
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
	   }
    }
    
    func handlePasswordEncryption(password: String) {
	   self.signModel?.updateExtraParams(dict: ["ownerPassword": password])
    }
    
    /// Envia el error en la operación al servidor intermedio, resetea la vista y muestra la pantalla de error
    func sendErrorOperation(error: AppError) {
        SendErrorOperationUseCase().execute(error: error, signModel: signModel)
        handleOperationError(appError: error)
    }
    
    func cancelOperation() {
        if (self.viewMode == .sign) {
            // Si estamos en operacion de firma, mostramos el aviso de operacion cancelada y enviamos al servidor
            SendErrorOperationUseCase().execute(error: AppError.userOperationCanceled, signModel: signModel)
            handleOperationError(appError: AppError.userOperationCanceled)
        } else {
            resetHomeViewModelVariables()
        }
    }
    
    func handleNotAnyCoordinatesSelected() {
        // Si no se meten coordenadas y es obligatoria la firma se cancela la operacion
        if let visibleSignature = signModel?.visibleSignature, visibleSignature == .want {
            cancelOperation()
        }
    }
    
    func resetHomeViewModelVariables() {
	   self.selectElectronicCertificate = false
	   self.selectDNIe = false
	   self.viewMode = .home
	   self.areCertificatesSelectable = false
    }
}
