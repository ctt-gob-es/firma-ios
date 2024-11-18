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
    @Published var downloadedData : URL? = nil
    @Published var showPseudonymModal: Bool? = false
    @Published var errorInfo: ErrorInfo? = nil
    @Published var successModalState: SuccessModalState? = nil
    @Published var showErrorModal: Bool? = false
    @Published var showSuccessModal: Bool? = false
    @Published var showDocumentImportingPicker: Bool? = false
    @Published var showDocumentSavingPicker: Bool? = false
    @Published var errorModalDescription: String? = ""
    @Published var showSignModal: Bool? = false
    @Published var showSignCoordinatesModal: Bool = false
    @Published var signType: SignType? = nil
    @Published var dataType: DataType? = nil
    @Published var showTextfieldModal: Bool = false
    @Published var sheetHeight: CGFloat = .zero
    @Published var showSelectSignMode: Bool = false
    @Published var selectDNIe: Bool = false
    @Published var selectElectronicCertificate: Bool = false
    @Published var signMode: SignMode?
    @Published var shouldCancel: Bool? = false
    @Published var certificates: [AOCertificateInfo]?
    @Published var annotations: [PDFAnnotation] = []
    @Published var password: String = ""
    
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
         downloadedData: URL? = nil,
         certificates: [AOCertificateInfo]? = [],
         shouldCancel: Bool? = nil
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
        self.downloadedData = downloadedData
        self.certificates = certificates
        self.shouldCancel = shouldCancel
    }
    
    func onAppear() {
        loadData()
    }
    
    func loadData() {
        certificateUtils = CertificateUtils()
        if viewMode == .sign {
            self.areCertificatesSelectable = false
            if let urlReceived = urlReceived {
                isLoading = true
                
                ParseDataURLOperationUseCase().execute(url: urlReceived.absoluteString) { result in
                    self.isLoading = false
                    switch result {
                    case .success(let dictionary):
                        self.signModel = SignModel(dictionary: dictionary)
                        self.parameters = dictionary
                        guard let signModel = self.signModel else { return }
                        self.configureMode(signModel: signModel)
                    case .failure(let error):
                        self.showError(errorInfo: error)
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
            
            guard let certificateUtils = self.certificateUtils,
                  let selectedCertificateName = certificateUtils.selectedCertificateName else {
                return
            }
            
            let shouldShowPseudonymModal = certificateUtils.isPseudonymCertificate(SwiftCertificateUtils.getIdentityFromKeychain(certName: selectedCertificateName))
            
            DispatchQueue.main.async {
                self.buttonEnabled = isButtonEnabled
                self.showPseudonymModal = shouldShowPseudonymModal
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
            areCertificatesSelectable = true
            signMode = .electronicCertificate
		  if let visibleSingature = self.signModel?.visibleSignature,
		  visibleSingature {
			 self.showSignCoordinatesModal = true
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
                self.showError(errorInfo: error)
            }
        }
    }
    
    private func configureMode(signModel: SignModel) {
        // Por defecto la firma es externa
        dataType = .external
        
        if (signModel.operation == OPERATION_SIGN || signModel.operation == OPERATION_COSIGN || signModel.operation == OPERATION_COUNTERSIGN) {
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
            if (signModel.operation != OPERATION_SAVE) {
                signMode = .electronicCertificate
                areCertificatesSelectable = true
            } else {
                areCertificatesSelectable = false
                viewMode = .home
                handleOperationSaveData()
            }
        }
        
        // Establecemos el nombre del boton
        switch signModel.operation {
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
            handleOperationSignWithElectronicCertificate()
        }
    }
    
    func handleOpenReturnURL() {
        if let url = signModel?.returnURL {
            if let urlFromModel = URL(string: url) {
                UIApplication.shared.open(urlFromModel) { success in
                    print("Open \(success)")
                }
            }
        }
    }
    
    private func handleOperationSelectCertificate() {
        guard let certificateData = certificateUtils?.base64UrlSafeCertificateData,
              let signModel = signModel else {
            return
        }
        
        SendCertificateUseCase().execute(base64Certificate: certificateData, signModel: signModel) { errorInfo in
            self.isLoading = false
            if let errorInfo = errorInfo {
                self.showError(errorInfo: errorInfo)
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
                                self.viewMode = .home
                                self.successModalState = .successSign
                                self.showSuccessModal = true
                                self.areCertificatesSelectable = false
                            }
                        }
                        
                    case .failure(let error):
                        self.viewMode = .home
                        self.areCertificatesSelectable = false
                        self.showError(errorInfo: error)
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
                self.areCertificatesSelectable = false
                self.viewMode = .home
                self.successModalState = self.getSuccessModal(resultBatch)
                self.showSuccessModal = true
            case .failure(let error):
                self.showError(errorInfo: error)
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
                    self.downloadedData = url
                    self.showDocumentSavingPicker = true
                case .failure(let error):
                    self.showError(errorInfo: error)
                }
            }
        }
    }
    
    private func showError(errorInfo: ErrorInfo) {
        self.isLoading = false
        DispatchQueue.main.async {
           self.showErrorModal = false
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
               self.errorInfo = errorInfo
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
            showError(errorInfo: ErrorCodes.InternalSoftwareErrorCodes.generalSoftwareError.info)
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
	   ) { base64Signature  in
		  print(base64Signature)
		  self.viewMode = .home
		  self.successModalState = .successSign
		  self.showSuccessModal = true
	   }
    }
    
    func handleOperationSignWithElectronicCertificate() {
	   guard let signModel = self.signModel else { return }
	   self.signUseCase = SingleSignUseCase(signModel: signModel, certificateUtils: certificateUtils)
	   
	   isLoading = true
	   guard let operation = signModel.operation else { return }
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
    
    func handleFinishSign() {
	   self.resetHomeViewModelVariables()
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
    func sendErrorOperation(error: ErrorInfo) {
        resetHomeViewModelVariables()
        showError(errorInfo: error)
        SendErrorOperationUseCase().execute(error: error, signModel: signModel)
    }
    
    func cancelOperation() {
        resetHomeViewModelVariables()
        SendErrorOperationUseCase().execute(error: ErrorCodes.FunctionalErrorCodes.userOperationCanceled.info, signModel: signModel)
    }
    
    func handleNotAnyCoordinatesSelected() {
        cancelOperation()
    }
    
    func resetHomeViewModelVariables() {
	   self.selectElectronicCertificate = false
	   self.selectDNIe = false
	   self.viewMode = .home
	   self.areCertificatesSelectable = false
    }
}
