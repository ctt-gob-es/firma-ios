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
    @Published var buttonEnabled: Bool? = false
    @Published var urlReceived: URL? = nil
    @Published var isLoading: Bool? = false
    @Published var entity: AOEntity? = nil
    @Published var receiveDataUseCase: ReceiveDataUseCase? = nil
    @Published var sendCertificateUseCase: SendCertificateUseCase? = nil
    @Published var signUseCase: SingleSignUseCase? = nil
    @Published var batchSignUseCase: BatchSignUseCase? = nil
    @Published var saveDataUseCase: SaveDataUseCase? = nil
    @Published var historicalUseCase: HistoricalUseCase? = nil
    @Published var certificateUtils: CertificateUtils? = nil
    @Published var signModel: SignModel? = nil
    @Published var parameters: NSMutableDictionary? = [:]
    @Published var buttonTitle: String? = nil
    @Published var areCertificatesSelectable: Bool? = false
    @Published var shouldSign: Bool? = false
    @Published var viewMode : ViewModes? = .sign
    @Published var downloadedData : URL? = nil
    @Published var showPseudonymModal: Bool? = false
    @Published var errorModalState: ErrorModalState? = nil
    @Published var successModalState: SuccessModalState? = nil
    @Published var showErrorModal: Bool? = false
    @Published var showSuccessModal: Bool? = false
    @Published var showDocumentImportingPicker: Bool? = false
    @Published var showDocumentSavingPicker: Bool? = false
    @Published var errorModalDescription: String? = ""
    @Published var showSignModal: Bool? = false
    @Published var signType: SignType? = nil
    @Published var dataType: DataType? = nil
    @Published var showTextfieldModal: Bool = false
    @Published var sheetHeight: CGFloat = .zero
    
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
	   certificateUtils = CertificateUtils()
	   if viewMode == .sign {
		  if let urlReceived = urlReceived {
			 isLoading = true
			 receiveDataUseCase = ReceiveDataUseCase(startURL: urlReceived.absoluteString)
			 receiveDataUseCase?.parseUrl { result in
				self.handleReceiveData(result: result)
			 }
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
	   self.isLoading = true
	   guard let url = value else { return }
	   FileUtils.convertURLFileToData(urls: url) { result in
		  switch result {
			 case .success(let data):
				self.signModel?.datosInUse = Base64Utils.encode(data,urlSafe: true)
				self.isLoading = false
			 case .failure(let error):
				self.handleError(error: error)
		  }
	   }
    }
    
    private func handleReceiveData(result: Result<(AOEntity, NSMutableDictionary), Error>) {
	   isLoading = false
	   switch result {
		  case .success(let result):
			 self.entity = result.0
			 self.signModel = SignModel(dictionary: result.1)
			 self.parameters = result.1
			 guard let signModel = self.signModel else { return }
			 self.signUseCase = SingleSignUseCase(signModel: signModel, certificateUtils: certificateUtils)
			 configureMode(signModel: signModel)
		  case .failure(let error):
			 handleError(error: error)
	   }
    }
    
    private func configureMode(signModel: SignModel) {
	   if signModel.datosInUse == nil && signModel.fileId == nil{
		  //IF THE DATA IS NIL WE MUST GET THE ARCHIVE LOCALLY
		  signModel.operation = OPERATION_SIGN_FROM_LOCAL
		  dataType = .local
	   } else {
		  dataType = .external
	   }
	   
	   switch signModel.operation {
		  case OPERATION_SELECT_CERTIFICATE:
			 areCertificatesSelectable = true
			 buttonTitle = NSLocalizedString("send", bundle: Bundle.main, comment: "")
		  case OPERATION_SIGN, OPERATION_BATCH:
			 areCertificatesSelectable = true
			 buttonTitle = NSLocalizedString("home_certificates_sign_button_title", bundle: Bundle.main, comment: "")
		  case OPERATION_SAVE:
			 buttonEnabled = true
			 areCertificatesSelectable = false
			 buttonTitle = NSLocalizedString("download", bundle: Bundle.main, comment: "")
		  case OPERATION_SIGN_FROM_LOCAL:
			 showDocumentImportingPicker = true
			 areCertificatesSelectable = true
			 signModel.operation = OPERATION_SIGN
			 buttonTitle = NSLocalizedString("home_certificates_sign_button_title", bundle: Bundle.main, comment: "")
		  default:
			 break
	   }
    }
    
    func handleButtonAction() {
	   isLoading = true
	   guard let operation = signModel?.operation else { return }
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
	   guard let certificateData = certificateUtils?.base64UrlSafeCertificateData,
		    let urlServlet = signModel?.urlServlet,
		    let cipherKey = signModel?.cipherKey,
		    let docId = signModel?.docId else {
		  return
	   }
	   sendCertificateUseCase = SendCertificateUseCase(urlServlet: urlServlet, cipherKey: cipherKey, docId: docId, base64UrlSafeCertificateData: certificateData)
	   sendCertificateUseCase?.sendCertificate(dataSign: certificateData) { result in
		  switch result {
			 case .success(let result):
				print("Success sending certificate, result: " + (String(data: result, encoding: .utf8) ?? ""))
				self.viewMode = .home
				self.successModalState = .successCertificateSent
				self.showSuccessModal = true
			 case .failure(let error):
				self.handleError(error: error)
		  }
	   }
    }
    
    private func handleOperationSign() {
	   
	   self.signUseCase?.singleSign { result in
		  DispatchQueue.main.async {
			 self.isLoading = false
			 
			 switch result {
				case .success(let shouldRetry):
				    if shouldRetry {
					   self.showTextfieldModal = true
				    } else {
					   self.historicalUseCase = HistoricalUseCase()
					   let history = HistoryModel(
						  date: Date(),
						  signType: self.signType ?? .external,
						  externalApp: nil,
						  dataType: self.dataType ?? .external,
						  filename: FileUtils.getArchiveNameFromParameters(parameters: self.parameters)
					   )
					   self.historicalUseCase?.saveHistory(history: history) { result in
						  switch result {
							 case .success():
								self.viewMode = .home
								self.successModalState = .successSign
								self.showSuccessModal = true
								self.areCertificatesSelectable = false
							 case .failure(let error):
								self.handleError(error: error)
						  }
					   }
				    }
				    
				case .failure(let error):
				    self.handleError(error: error)
			 }
		  }
	   }
    }
    
    private func handleOperationBatch() {
	   guard let certificateData = certificateUtils?.base64UrlSafeCertificateData,
		    let privateKey = certificateUtils?.privateKey else {
		  return
	   }
	   batchSignUseCase = BatchSignUseCase(certificate: certificateData, privateKey: privateKey)
	   batchSignUseCase?.signBatch(parameters as! [AnyHashable: Any]) { responseMessage, error in
		  if let error = error as NSError? {
			 self.handleError(error: error)
		  } else {
			 self.viewMode = .home
			 self.successModalState = .successSign
			 self.showSuccessModal = true
		  }
	   }
    }
    
    private func handleOperationSaveData() {
	   saveDataUseCase = SaveDataUseCase()
	   
	   if let receivedStringData = signModel?.datosInUse {
		  saveDataUseCase?.saveFileFromBase64Data(
			 archiveName: FileUtils.getArchiveNameFromParameters(parameters: parameters),
			 base64Data: receivedStringData
		  ) { result in
			 self.isLoading = false
			 switch result {
				case .success(let url):
				    self.downloadedData = url
				    self.showDocumentSavingPicker = true
				case .failure(let error):
				    self.handleError(error: error)
			 }
		  }
	   }
    }
    
    private func handleError(error: Error) {
	   DispatchQueue.main.async {
		  self.errorModalState = .globalError
		  self.errorModalDescription = error.localizedDescription
		  self.showErrorModal = true
	   }
	   
	   let reportErrorUseCase = ReportErrorUseCase()
	   reportErrorUseCase.reportErrorAsync(urlServlet: signModel?.urlServlet, docId: signModel?.docId, error: ErrorHandlerUtils.getErrorModalDescriptionFromError(error: error)) { result in
		  switch result {
			 case .success(let errorFromServer):
				if let response = String(data: errorFromServer, encoding: .utf8) {
				    print("Server response from reportError: " + response)
				}
			 case .failure(let error):
				print("Server error from reportError: " + error.localizedDescription)
		  }
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
	   ) { result in
		  switch result {
			 case .success(let signature):
				self.viewMode = .home
				self.successModalState = .successSign
				self.showSuccessModal = true
				
			 case .failure(let error):
				self.handleError(error: error)
		  }
	   }
    }
}
