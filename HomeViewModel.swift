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

class HomeViewModel: ObservableObject {
    // UI State
    @Published var buttonEnabled: Bool? = false
    @Published var urlReceived: URL? = nil
    @Published var isLoading: Bool? = false
    @Published var buttonTitle: String? = nil
    @Published var areCertificatesSelectable: Bool? = false
    @Published var shouldSign: Bool? = false
    @Published var viewMode : ViewModes? = .sign
    @Published var showPseudonymModal: Bool? = false
    @Published var errorModalState: ErrorModalState? = nil
    @Published var successModalState: SuccessModalState? = nil
    @Published var showErrorModal: Bool? = false
    @Published var showSuccessModal: Bool? = false
    @Published var showDocumentImportingPicker: Bool? = false
    @Published var showDocumentSavingPicker: Bool? = false
    @Published var errorModalDescription: String? = ""
    @Published var showSignModal: Bool? = false
    @Published var showTextfieldModal: Bool = false
    @Published var sheetHeight: CGFloat = .zero
    
    // Data State
    @Published var entity: AOEntity? = nil
    @Published var signModel: SignModel? = nil
    @Published var parameters: NSMutableDictionary? = [:]
    @Published var downloadedData : URL? = nil
    @Published var signType: SignType? = nil
    @Published var dataType: DataType? = nil
    
    // Business Logic
    @Published var receiveDataUseCase: ReceiveDataUseCase?
    @Published var sendCertificateUseCase: SendCertificateUseCase?
    @Published var signUseCase: SingleSignUseCase?
    @Published var batchSignUseCase: BatchSignUseCase?
    @Published var saveDataUseCase: SaveDataUseCase?
    @Published var historicalUseCase: HistoricalUseCase?
    @Published var certificateUtils:CertificateUtils? = nil
    
    init(buttonEnabled: Bool? = false,
	    urlReceived: URL? = nil,
	    isLoading: Bool? = false,
	    entity: AOEntity? = nil,
	    receiveDataUseCase: ReceiveDataUseCase? = nil,
	    sendCertificateUseCase: SendCertificateUseCase? = nil,
	    signUseCase: SingleSignUseCase? = nil,
	    batchSignUseCase: BatchSignUseCase? = nil,
	    saveDataUseCase: SaveDataUseCase? = nil,
	    historicalUseCase: HistoricalUseCase? = nil,
	    certificateUtils: CertificateUtils? = nil,
	    signModel: SignModel? = nil,
	    parameters: NSMutableDictionary? = [:],
	    buttonTitle: String? = nil,
	    areCertificatesSelectable: Bool? = false,
	    shouldSign: Bool? = nil,
	    viewMode: ViewModes? = .sign,
	    downloadedData: URL? = nil
    ) {
	   self.buttonEnabled = buttonEnabled
	   self.urlReceived = urlReceived
	   self.isLoading = isLoading
	   self.entity = entity
	   self.receiveDataUseCase = receiveDataUseCase
	   self.sendCertificateUseCase = sendCertificateUseCase
	   self.signUseCase = signUseCase
	   self.batchSignUseCase = batchSignUseCase
	   self.saveDataUseCase = saveDataUseCase
	   self.historicalUseCase = historicalUseCase
	   self.certificateUtils = certificateUtils
	   self.signModel = signModel
	   self.parameters = parameters
	   self.buttonTitle = buttonTitle
	   self.areCertificatesSelectable = areCertificatesSelectable
	   self.shouldSign = shouldSign
	   self.viewMode = viewMode
	   self.downloadedData = downloadedData
    }
    
    func onAppear() {
	   loadData()
    }
    
    func loadData() {
	   guard viewMode == .sign, let url = urlReceived else { return }
	   certificateUtils = CertificateUtils()
	   isLoading = true
	   receiveDataUseCase = ReceiveDataUseCase(startURL: url.absoluteString)
	   receiveDataUseCase?.parseUrl { [weak self] result in
		  self?.handleReceiveData(result: result)
	   }
    }
    
    func handleCertificateChange(_ value: AOCertificateInfo?) {
	   guard let value = value, let certUtils = certificateUtils else { return }
	   
	   DispatchQueue.global(qos: .userInitiated).async {
		  let isButtonEnabled = SwiftCertificateUtils.updateSelectedCertificate(certificateUtils: certUtils, value.subject)
		  guard let selectedCertificateName = certUtils.selectedCertificateName else { return }
		  let shouldShowPseudonymModal = certUtils.isPseudonymCertificate(SwiftCertificateUtils.getIdentityFromKeychain(certName: selectedCertificateName))
		  
		  DispatchQueue.main.async {
			 self.buttonEnabled = isButtonEnabled
			 self.showPseudonymModal = shouldShowPseudonymModal
			 self.signLocalPdf()
		  }
	   }
    }
    
    func handleShouldSignChange(_ value: Bool) {
	   if value {
		  handleButtonAction()
		  shouldSign = false
	   }
    }
    
    func handleImportedDataURLsChange(_ value: [URL]?) {
	   guard let urls = value else { return }
	   isLoading = true
	   FileUtils.convertURLFileToData(urls: urls) { [weak self] result in
		  self?.handleFileConversion(result: result)
	   }
    }
    
    private func handleReceiveData(result: Result<(AOEntity, NSMutableDictionary), Error>) {
	   isLoading = false
	   switch result {
		  case .success(let (entity, parameters)):
			 self.entity = entity
			 self.signModel = SignModel(dictionary: parameters)
			 self.parameters = parameters
			 configureMode()
		  case .failure(let error):
			 handleError(error: error)
	   }
    }
    
    private func configureMode() {
	   guard let signModel = signModel else { return }
	   
	   dataType = signModel.datosInUse == nil && signModel.fileId == nil ? .local : .external
	   
	   switch signModel.operation {
		  case OPERATION_SELECT_CERTIFICATE:
			 configureForSelectCertificate()
		  case OPERATION_SIGN, OPERATION_BATCH:
			 configureForSignOrBatch()
		  case OPERATION_SAVE:
			 configureForSave()
		  case OPERATION_SIGN_FROM_LOCAL:
			 configureForSignFromLocal()
		  default:
			 break
	   }
    }
    
    private func configureForSelectCertificate() {
	   areCertificatesSelectable = true
	   buttonTitle = NSLocalizedString("send", bundle: Bundle.main, comment: "")
    }
    
    private func configureForSignOrBatch() {
	   areCertificatesSelectable = true
	   buttonTitle = NSLocalizedString("home_certificates_sign_button_title", bundle: Bundle.main, comment: "")
    }
    
    private func configureForSave() {
	   buttonEnabled = true
	   areCertificatesSelectable = false
	   buttonTitle = NSLocalizedString("download", bundle: Bundle.main, comment: "")
    }
    
    private func configureForSignFromLocal() {
	   showDocumentImportingPicker = true
	   areCertificatesSelectable = true
	   signModel?.operation = OPERATION_SIGN
	   buttonTitle = NSLocalizedString("home_certificates_sign_button_title", bundle: Bundle.main, comment: "")
    }
    
    func handleButtonAction() {
	   guard let operation = signModel?.operation else { return }
	   isLoading = true
	   
	   switch operation {
		  case OPERATION_SELECT_CERTIFICATE:
			 handleOperationSendCertificate()
		  case OPERATION_SIGN, OPERATION_SIGN_FROM_LOCAL:
			 handleOperationSign()
		  case OPERATION_BATCH:
			 handleOperationBatch()
		  case OPERATION_SAVE:
			 handleOperationSaveData()
		  default:
			 break
	   }
    }
    
    private func handleOperationSendCertificate() {
	   guard let certData = certificateUtils?.base64UrlSafeCertificateData,
		    let urlServlet = signModel?.urlServlet,
		    let cipherKey = signModel?.cipherKey,
		    let docId = signModel?.docId else { return }
	   
	   sendCertificateUseCase = SendCertificateUseCase(urlServlet: urlServlet, cipherKey: cipherKey, docId: docId, base64UrlSafeCertificateData: certData)
	   sendCertificateUseCase?.sendCertificate(dataSign: certData) { [weak self] result in
		  self?.handleSendCertificateResult(result)
	   }
    }
    
    private func handleSendCertificateResult(_ result: Result<Data, Error>) {
	   switch result {
		  case .success(let resultData):
			 print("Success sending certificate, result: " + (String(data: resultData, encoding: .utf8) ?? ""))
			 viewMode = .home
			 successModalState = .successCertificateSent
			 showSuccessModal = true
		  case .failure(let error):
			 handleError(error: error)
	   }
    }
    
    private func handleOperationSign() {
	   signUseCase?.singleSign { [weak self] result in
		  DispatchQueue.main.async {
			 self?.isLoading = false
			 self?.handleSignResult(result)
		  }
	   }
    }
    
    private func handleSignResult(_ result: Result<Bool, Error>) {
	   switch result {
		  case .success(let shouldRetry):
			 if shouldRetry {
				showTextfieldModal = true
			 } else {
				saveSignHistory()
			 }
		  case .failure(let error):
			 handleError(error: error)
	   }
    }
    
    private func saveSignHistory() {
	   historicalUseCase = HistoricalUseCase()
	   let history = HistoryModel(
		  date: Date(),
		  signType: signType ?? .external,
		  externalApp: nil,
		  dataType: dataType ?? .external,
		  filename: FileUtils.getArchiveNameFromParameters(parameters: parameters)
	   )
	   historicalUseCase?.saveHistory(history: history) { [weak self] result in
		  self?.handleSaveHistoryResult(result)
	   }
    }
    
    private func handleSaveHistoryResult(_ result: Result<Void, Error>) {
	   switch result {
		  case .success():
			 viewMode = .home
			 successModalState = .successSign
			 showSuccessModal = true
			 areCertificatesSelectable = false
		  case .failure(let error):
			 handleError(error: error)
	   }
    }
    
    private func handleOperationBatch() {
	   guard let certData = certificateUtils?.base64UrlSafeCertificateData,
		    let privateKey = certificateUtils?.privateKey else { return }
	   
	   batchSignUseCase = BatchSignUseCase(certificate: certData, privateKey: privateKey)
	   batchSignUseCase?.signBatch(parameters as! [AnyHashable: Any]) { [weak self] responseMessage, error in
		  self?.handleBatchSignResult(error)
	   }
    }
    
    private func handleBatchSignResult(_ error: Error?) {
	   if let error = error {
		  handleError(error: error)
	   } else {
		  viewMode = .home
		  successModalState = .successSign
		  showSuccessModal = true
	   }
    }
    
    private func handleOperationSaveData() {
	   guard let receivedStringData = signModel?.datosInUse else { return }
	   
	   saveDataUseCase = SaveDataUseCase()
	   saveDataUseCase?.saveFileFromBase64Data(
		  archiveName: FileUtils.getArchiveNameFromParameters(parameters: parameters),
		  base64Data: receivedStringData
	   ) { [weak self] result in
		  self?.handleSaveDataResult(result)
	   }
    }
    
    private func handleSaveDataResult(_ result: Result<URL, Error>) {
	   isLoading = false
	   switch result {
		  case .success(let url):
			 downloadedData = url
			 showDocumentSavingPicker = true
		  case .failure(let error):
			 handleError(error: error)
	   }
    }
    
    private func handleFileConversion(result: Result<Data, Error>) {
	   switch result {
		  case .success(let data):
			 signModel?.datosInUse = Base64Utils.encode(data, urlSafe: true)
			 isLoading = false
		  case .failure(let error):
			 handleError(error: error)
	   }
    }
    
    private func handleError(error: Error) {
	   errorModalDescription = error.localizedDescription
	   errorModalState = .globalError
	   showErrorModal = true
	   
	   let reportErrorUseCase = ReportErrorUseCase()
	   reportErrorUseCase.reportErrorAsync(
		  urlServlet: signModel?.urlServlet,
		  docId: signModel?.docId,
		  error: ErrorHandlerUtils.getErrorModalDescriptionFromError(error: error)
	   ) { result in
		  self.handleReportErrorResult(result)
	   }
    }
    
    private func handleReportErrorResult(_ result: Result<Data, Error>) {
	   switch result {
		  case .success(let errorFromServer):
			 if let response = String(data: errorFromServer, encoding: .utf8) {
				print("Server response from reportError: " + response)
			 }
		  case .failure(let error):
			 print("Server error from reportError: " + error.localizedDescription)
	   }
    }
    
    func signLocalPdf() {
	   guard
		  let pdfData = Data(base64Encoded: PDFConstants.mockPDFString),
		  let privateKeyRef = certificateUtils?.privateKey,
		  let certificateName = certificateUtils?.selectedCertificateName,
		  let identity = SwiftCertificateUtils.getIdentityFromKeychain(certName: certificateName),
		  let certificateRef = SwiftCertificateUtils.getCertificateRefFromIdentity(identity: identity) else {
		  print("Missing required data for signing")
			 handleError(error: NSError(domain: "SignError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Unknown error"]))
		  return
	   }
	   
	   let padesUtils = PadesUtils()
	   
	   padesUtils.signPdf(
		  pdfData: pdfData,
		  algorithm: nil,
		  privateKey: privateKeyRef,
		  certificateRef: certificateRef,
		  extraParams: nil
	   ) { [weak self] result in
		  DispatchQueue.main.async {
			 self?.handleSignPdfResult(result)
		  }
	   }
    }
    
    private func handleSignPdfResult(_ result: EsGobAfirmaIosSignatureResult?) {
	   isLoading = false
	   guard let result = result else {
		  handleError(error: NSError(domain: "SignError", code: -1, userInfo: [NSLocalizedDescriptionKey: "No result returned from signing"]))
		  return
	   }
	   
	   if result.isError() {
		  handleError(error: NSError(domain: "SignError", code: Int(result.getErrorCode()), userInfo: [NSLocalizedDescriptionKey: result.getErrorMessage() ?? "Unknown error"]))
	   } else if let signedPdfData = result.getSignature() {
		  print("Successfully signed the PDF, result: " + signedPdfData.debugDescription)
		  viewMode = .home
		  successModalState = .successSign
		  showSuccessModal = true
	   }
    }
}
