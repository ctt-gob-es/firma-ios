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
    @Binding var downloadedData: Data?
    @State var buttonEnabled: Bool = false
    @State var urlReceived: URL?
    @State private var isLoading: Bool = false
    @State private var cancellables = Set<AnyCancellable>()
    @State var entity: AOEntity?
    @State var receiveDataUseCase: ReceiveDataUseCase?
    @State var sendCertificateUseCase: SendCertificateUseCase?
    @State var signUseCase: SingleSignUseCase?
    @State var batchSignUseCase: BatchSignUseCase?
    @State var downloadDataUseCase: DownloadDataUseCase?
    @State var certificateUtils: CertificateUtils?
    @State var signModel: SignModel?
    @State var parameters: NSMutableDictionary = [:]
    @State var buttonTitle: String = NSLocalizedString("home_certificates_sign_button_title", bundle: Bundle.main, comment: "")
    
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
							 isSelectable: true,
							 isSelected: appStatus.selectedCertificate == certificate ? true : false
						  )
						  .listRowSeparator(.hidden)
					   }
				    }
				    .listStyle(PlainListStyle())
				    
				} else {
				    Spacer()
				    
				    NoCertificatesView()
				    
				    Spacer()
				}
				
				VStack(spacing: 10) {
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
	   .onAppear {
		  self.certificateUtils = CertificateUtils()
		  
		  if let urlReceived = urlReceived {
			 appStatus.isLoading = true
			 receiveDataUseCase = ReceiveDataUseCase(appStatus: appStatus)
			 receiveDataUseCase?.parseUrl(urlReceived.absoluteString) { result in
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
			 
			 if signModel.operation == OPERATION_SELECT_CERTIFICATE {
				buttonTitle = NSLocalizedString("send", bundle: Bundle.main, comment: "")
			 } else if signModel.operation == OPERATION_SIGN {
				buttonTitle = NSLocalizedString("home_certificates_sign_button_title", bundle: Bundle.main, comment: "")
			 } else if signModel.operation == OPERATION_DOWNLOAD {
				buttonTitle = NSLocalizedString("download", bundle: Bundle.main, comment: "")
			 }
			 
		  case .failure(let error):
			 DispatchQueue.main.async {
				appStatus.errorModalDescription = error.localizedDescription
				appStatus.errorModalState = .globalError
				appStatus.showErrorModal = true
			 }
	   }
    }
    
    func handleButtonAction() {
	   appStatus.isLoading = true
	   
	   if signModel?.operation == OPERATION_SELECT_CERTIFICATE {
		  handleOperationSelectCertificate()
	   } else if signModel?.operation == OPERATION_SIGN {
		  handleOperationSign()
	   } else if signModel?.operation == OPERATION_BATCH {
		  handleOperationBatch()
	   } else if signModel?.operation == OPERATION_DOWNLOAD {
		  handleOperationBatch()
	   }
    }
    
    func handleOperationSelectCertificate() {
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
				    appStatus.errorModalDescription = error.localizedDescription
				    appStatus.errorModalState = .globalError
				    appStatus.showErrorModal = true
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
				    viewMode = .home
				    appStatus.successModalState = .successSign
				    appStatus.showSuccessModal = true
				case .failure(let error):
				    appStatus.errorModalDescription = error.localizedDescription
				    appStatus.errorModalState = .globalError
				    appStatus.showErrorModal = true
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
				appStatus.errorModalDescription = error.localizedDescription
				appStatus.errorModalState = .globalError
				appStatus.showErrorModal = true
			 } else {
				viewMode = .home
				appStatus.successModalState = .successSign
				appStatus.showSuccessModal = true
			 }
		  }
		  
	   })
    }
    
    func handleOperationSaveData(urlString: String) {
	   let downloadUseCase = DownloadDataUseCase()
	   guard let urlString = signModel?.urlServlet else {
		  appStatus.errorModalState = .globalError
		  appStatus.showErrorModal = true
		  return
	   }

	   downloadUseCase.downloadDataFromURL(urlString: urlString) { result in
		  DispatchQueue.main.async {
			 switch result {
			 case .success(let data):
				self.downloadedData = data
				self.showDocumentSavingPicker = true

			 case .failure(let error):
				print("Failed to download data: \(error.localizedDescription)")
				self.appStatus.errorModalState = .globalError
				self.appStatus.errorModalDescription = error.localizedDescription
				self.appStatus.showErrorModal = true
			 }
		  }
	   }
    }
}
