//
//  SignView.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 19/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import SwiftUI
import Combine

struct SignViewMode: View {
    @EnvironmentObject private var appStatus : AppStatus
    @Binding var certificates: [AOCertificateInfo]?
    @Binding var viewMode: ViewModes
    @Binding var shouldSign: Bool
    @Binding var showDocumentSavingPicker: Bool
    @Binding var downloadedData: URL?
    @State var buttonEnabled: Bool = false
    @State var urlReceived: URL?
    @State private var isLoading: Bool = false
    @State private var cancellables = Set<AnyCancellable>()
    @State var entity: AOEntity?
    @State var receiveDataUseCase: ReceiveDataUseCase?
    @State var sendCertificateUseCase: SendCertificateUseCase?
    @State var signUseCase: SingleSignUseCase?
    @State var batchSignUseCase: BatchSignUseCase?
    @State var saveDataUseCase: SaveDataUseCase?
    @State var historicalUseCase: HistoricalUseCase?
    @State var certificateUtils: CertificateUtils?
    @State var signModel: SignModel?
    @State var parameters: NSMutableDictionary = [:]
    @State var buttonTitle: String?
    @State var areCertificablesSelectable: Bool = false
    
    var body: some View {
	   VStack {
		  if appStatus.connectionError {
			 HomeErrorView(state: .connectionError)
		  } else if appStatus.updateNeeded {
			 HomeErrorView(state: .updateNeeded)
		  } else {
			 VStack(alignment: .center, spacing: 20) {
				VStack(alignment: .leading) {
				    AccessibleText(content: NSLocalizedString("home_certificates_label", bundle: Bundle.main, comment: ""))
					   .titleStyleBlack(foregroundColor: ColorConstants.Text.primary)
					   .accessibilityAddTraits(.isHeader)
				    
				    AccessibleText(content: NSLocalizedString("select_certificates_description", bundle: Bundle.main, comment: ""))
					   .regularStyle(foregroundColor: ColorConstants.Text.secondary)
				}
				.padding([.horizontal, .top])
				
				if let certificates = self.certificates {
				    List {
					   ForEach(certificates, id: \.certificateRef) { certificate in
						  CertificateCellView(
							 certificateInfo: certificate,
							 isSelectable: $areCertificablesSelectable,
							 isSelected: appStatus.selectedCertificate == certificate ? true : false
						  )
						  .listRowSeparator(.hidden)
					   }
				    }
				    .listStyle(PlainListStyle())
				    
				} else {
				    Spacer()
				    
				    NoDataView(
					   title: NSLocalizedString("home_certificates_not_available_title", bundle: Bundle.main, comment: ""),
					   description: NSLocalizedString("home_certificates_not_available_description", bundle: Bundle.main, comment: "")
				    )
				    
				    Spacer()
				}
				
				VStack(spacing: 10) {
				    if let buttonTitle = buttonTitle {
					   Button(action: {
						  if buttonEnabled {
							 handleButtonAction()
						  }
					   }) {
						  AccessibleText(content: buttonTitle)
					   }
					   .buttonStyle(CustomButtonStyle(isEnabled: buttonEnabled))
				    }
				}
			 }
		  }
	   }
	   .onChange(of: appStatus.selectedCertificate, perform: { value in
		  if let value = value{
			 DispatchQueue.global(qos: .background).async {
				buttonEnabled = SwiftCertificateUtils.updateSelectedCertificate(certificateUtils: certificateUtils, value.subject)
				guard let certificateUtils = certificateUtils,
					 let selectedCertificateName = certificateUtils.selectedCertificateName else {
				    return
				}
				
				DispatchQueue.main.async {
				    appStatus.showPseudonymModal = certificateUtils.isPseudonymCertificate(SwiftCertificateUtils.getIdentityFromKeychain(certName: selectedCertificateName))
				}
			 }
		  }
	   })
	   .onChange(of: shouldSign, perform: { value in
		  if value {
			 handleButtonAction()
			 shouldSign = false
		  }
	   })
	   .onChange(of: appStatus.importedDataURLS, perform: { value in
		  if let url = value {
			 FileUtils.convertURLFileToData(urls: url) { result in
				switch result {
				    case .success(let data):
					   signModel?.datosInUse = Base64Utils.encode(data)
				    case .failure(let error):
					   handleError(error: error)
				}
			 }
		  }
	   })
	   .onAppear {
		  self.certificateUtils = CertificateUtils()
		  
		  if let urlReceived = urlReceived {
			 appStatus.isLoading = true
			 receiveDataUseCase = ReceiveDataUseCase(
				appStatus: appStatus,
				startURL: urlReceived.absoluteString
			 )
			 receiveDataUseCase?.parseUrl() { result in
				handleReceiveData(result: result)
			 }
		  }
	   }
    }
    
    func handleReceiveData(result: (Result<(AOEntity, NSMutableDictionary), Error>)) {
	   appStatus.isLoading = false
	   switch result {
		  case .success(let result):
			 self.entity = result.0
			 self.signModel = SignModel(dictionary: result.1)
			 self.parameters = result.1
			 guard let signModel = self.signModel else {
				return
			 }
			 
			 signUseCase = SingleSignUseCase(signModel: signModel,certificateUtils: certificateUtils)
			 configureMode(signModel: signModel)
			 
		  case .failure(let error):
			 DispatchQueue.main.async {
				handleError(error: error)
			 }
	   }
    }
    
    func configureMode(signModel: SignModel) {
	   if signModel.operation == OPERATION_SELECT_CERTIFICATE {
		  areCertificablesSelectable = true
		  buttonTitle = NSLocalizedString("send", bundle: Bundle.main, comment: "")
	   } else if signModel.operation == OPERATION_SIGN || signModel.operation == OPERATION_BATCH {
		  areCertificablesSelectable = true
		  buttonTitle = NSLocalizedString("home_certificates_sign_button_title", bundle: Bundle.main, comment: "")
	   } else if signModel.operation == OPERATION_SAVE {
		  buttonEnabled = true
		  areCertificablesSelectable = false
		  buttonTitle = NSLocalizedString("download", bundle: Bundle.main, comment: "")
	   } else if signModel.operation == OPERATION_SIGN_FROM_LOCAL {
		  appStatus.showDocumentImportingPicker = true
		  areCertificablesSelectable = true
		  signModel.operation = OPERATION_SIGN
		  buttonTitle = NSLocalizedString("home_certificates_sign_button_title", bundle: Bundle.main, comment: "")
	   }
    }
    
    func handleButtonAction() {
	   appStatus.isLoading = true
	   
	   if signModel?.operation == OPERATION_SELECT_CERTIFICATE {
		  handleOperationSendCertificate()
	   } else if signModel?.operation == OPERATION_SIGN || signModel?.operation == OPERATION_SIGN_FROM_LOCAL {
		  handleOperationSign()
	   } else if signModel?.operation == OPERATION_BATCH {
		  handleOperationBatch()
	   } else if signModel?.operation == OPERATION_SAVE {
		  handleOperationSaveData()
	   }
    }
    
    func handleOperationSendCertificate() {
	   guard let certificateData = certificateUtils?.base64UrlSafeCertificateData,
		    let urlServlet = signModel?.urlServlet,
		    let cipherKey = signModel?.cipherKey,
		    let docId = signModel?.docId else {
		  return
	   }
	   
	   self.sendCertificateUseCase = SendCertificateUseCase(
		  urlServlet: urlServlet,
		  cipherKey: cipherKey,
		  docId: docId,
		  base64UrlSafeCertificateData: certificateData
	   )
	   
	   sendCertificateUseCase?.sendCertificate(dataSign: certificateData, completion: { result in
		  DispatchQueue.main.async {
			 switch result {
				case .success(let result):
				    print("Success sending certificate, result: " + (String(data: result, encoding: .utf8) ?? ""))
				    viewMode = .home
				    appStatus.successModalState = .successCertificateSent
				    appStatus.showSuccessModal = true
				
				case .failure(let error):
				    handleError(error: error)
			 }
		  }
		  
	   })
    }
    
    func handleOperationSign() {
	   signUseCase?.singleSign(completion: { result in
		  DispatchQueue.main.async {
			 appStatus.isLoading = false
			 switch result {
				case .success(_):
				    historicalUseCase = HistoricalUseCase()
				    
				    //TODO: WE NEED TO GET THE ARCHIVE NAME
				    historicalUseCase?.saveHistory(archiveName: UUID().uuidString, date: Date(), completion: { result in
					   switch result {
						  case .success():
							 viewMode = .home
							 appStatus.successModalState = .successCertificateSent
							 appStatus.showSuccessModal = true
						  case .failure(let error):
							 handleError(error: error)
					   }
				    })
				case .failure(let error):
				    handleError(error: error)
			 }
		  }
	   }
	   )
    }
    
    func handleOperationBatch() {
	   guard let certificateData = certificateUtils?.base64UrlSafeCertificateData,
		    let privateKey = certificateUtils?.privateKey else {
		  return
	   }
	   
	   batchSignUseCase = BatchSignUseCase(certificate: certificateData, privateKey: privateKey)
	   batchSignUseCase?.signBatch(parameters as! [AnyHashable : Any], completion: { responseMessage, error in
		  DispatchQueue.main.async {
			 if let error = error as NSError? {
				handleError(error: error)
			 } else {
				viewMode = .home
				appStatus.successModalState = .successSign
				appStatus.showSuccessModal = true
			 }
		  }
		  
	   })
    }
    
    func handleOperationSaveData() {
	   self.saveDataUseCase = SaveDataUseCase()
	   if let receivedStringData = signModel?.datosInUse {
		  //TODO: Get the archive name in order to save it
		  saveDataUseCase?.saveFileFromBase64Data(archiveName: "", base64Data: receivedStringData) { result in
			 appStatus.isLoading = false
			 switch result {
				case .success(let url):
				    appStatus.downloadedData = url
				    self.downloadedData = url
				    appStatus.showDocumentSavingPicker = true
				case .failure(let error):
				    handleError(error: error)
			 }
		  }
	   }
    }
    
    func handleError(error: Error) {
	   self.appStatus.errorModalState = .globalError
	   self.appStatus.errorModalDescription = error.localizedDescription
	   self.appStatus.showErrorModal = true
	   
	   let reportErrorUseCase = ReportErrorUseCase()
	   
	   reportErrorUseCase.reportErrorAsync(
		  urlServlet: signModel?.urlServlet,
		  docId: signModel?.docId,
		  error: ErrorHandlerUtils.getErrorModalDescriptionFromError(error: error),
		  completion: { result in
			 switch result {
				case .success(let errorFromServer):
				    if let response = String(data: errorFromServer, encoding: .utf8) {
					   print("Server response from reportError: " + response)
				    }
				case .failure(let error):
				    print("Server error from reportError: " + error.localizedDescription)
			 }
		  })
    }
}
