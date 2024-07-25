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
    @State var buttonEnabled: Bool = false
    @State var urlReceived: URL?
    @State private var isLoading: Bool = false
    @State private var cancellables = Set<AnyCancellable>()
    @State var entity: AOEntity?
    @State var receiveDataUseCase: ReceiveDataUseCase?
    @State var sendCertificateUseCase: SendCertificateUseCase?
    @State var signUseCase: SingleSignUseCase?
    @State var certificateUtils: CertificateUtils?
    @State var signModel: SignModel?
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
				updateSelectedCertificate(value.subject)
			 }
		  }
	   })
	   .onAppear {
		  if let urlReceived = urlReceived {
			 appStatus.isLoading = true
			 receiveDataUseCase = ReceiveDataUseCase(appStatus: appStatus)
			 signUseCase = SingleSignUseCase()
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
			 if self.signModel?.operation == OPERATION_SELECT_CERTIFICATE {
				buttonTitle = NSLocalizedString("send", bundle: Bundle.main, comment: "")
			 } else if signModel?.operation == OPERATION_SIGN {
				buttonTitle = NSLocalizedString("home_certificates_sign_button_title", bundle: Bundle.main, comment: "")
			 }
			 
		  case .failure(let error):
			 handleSignError(error: error)
	   }
    }
    
    func handleButtonAction() {
	   appStatus.isLoading = true
	   
	   if signModel?.operation == OPERATION_SELECT_CERTIFICATE {
		  guard let certificateData = certificateUtils?.base64UrlSafeCertificateData,
			   let urlServlet = signModel?.urlServlet,
			   let cipherKey = signModel?.cipherKey,
			   let docId = signModel?.docId else {
			 handleSignError(error:NSError(domain: "Error",code: -1,userInfo: [NSLocalizedDescriptionKey:NSLocalizedString("error_process_select_certificate",bundle: Bundle.main,comment: "")])
			 )
			 return
		  }
		  
		  self.sendCertificateUseCase = SendCertificateUseCase(
			 urlServlet: urlServlet,
			 cipherKey: cipherKey,
			 docId: docId,
			 base64UrlSafeCertificateData: certificateData
		  )
		  
		  //TODO: Get the data from the certificate
		  sendCertificate(dataSign: certificateData)
	   } else if signModel?.operation == OPERATION_SIGN {
		  sign()
	   }
    }
    
    func sign() {
	   guard let signModel else {
		  handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_datos_firmar", bundle: Bundle.main, comment: "")]))
		  return
	   }
	   
	   presign(signModel: signModel)
    }
    
    func sendCertificate(dataSign: String) {
	   sendCertificateUseCase?.sendCertificate(dataSign: dataSign, completion: { result in
		  switch result {
			 case .success(let storeDataServerResponse):
				if let response = String(data: storeDataServerResponse, encoding: .utf8) {
				    if response == OK {
					   DispatchQueue.main.async {
						  appStatus.isLoading = false
						  viewMode = .home
						  appStatus.successModalState = .successSign
						  appStatus.showSuccessModal = true
					   }
				    } else {
					   handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_proceso_firma", bundle: Bundle.main, comment: "")]))
				    }
				}
			 case .failure(let error):
				handleSignError(error: error)
		  }
	   })
    }
    
    func presign(signModel: SignModel) {
	   guard let operation = signModel.operation,
		    let datosInUse = signModel.datosInUse,
		    let signFormat = signModel.signFormat,
		    let signAlgoInUse = signModel.signAlgoInUse,
		    let certificateData = certificateUtils?.base64UrlSafeCertificateData else {
		  handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_datos_firmar", bundle: Bundle.main, comment: "")]))
		  return
	   }
	   
	   signUseCase?.preSign(
		  operation: operation,
		  datosInUse: datosInUse,
		  signFormat: signFormat,
		  signAlgoInUse: signAlgoInUse,
		  certificateData: certificateData,
		  extraParams: signModel.extraParams,
		  triphasicServerURL: signModel.triphasicServerURL,
		  rtServlet: signModel.rtServlet,
		  completion: { result in
			 handlePresingResult(signModel: signModel, result: result)
		  })
    }
    
    func handlePresingResult(signModel: SignModel, result: Result<String, Error>) {
	   guard let signFormat = signModel.signFormat,
		    let signAlgoInUse = signModel.signAlgoInUse else {
		  handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_datos_firmar", bundle: Bundle.main, comment: "")]))
		  return
	   }
	   
	   switch result{
		  case .success(let serverResponse):
			 guard let privateKey = certificateUtils?.privateKey,
				  let encodedData = signUseCase?.generatePKCS1(
				    dataReceivedb64: serverResponse,
				    privateKey: privateKey,
				    signAlgoInUse: signAlgoInUse,
				    signFormat: signFormat
				  ) else {
				handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: serverResponse]))
				return
			 }
			 postsign(signModel: signModel, encodedData: encodedData)
			 
		  case .failure(let error):
			 handleSignError(error: error)
	   }
    }
    
    func postsign(signModel: SignModel, encodedData: Data) {
	   guard let operation = signModel.operation,
		    let datosInUse = signModel.datosInUse,
		    let signFormat = signModel.signFormat,
		    let signAlgoInUse = signModel.signAlgoInUse,
		    let certificateData = certificateUtils?.base64UrlSafeCertificateData else {
		  handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_datos_firmar", bundle: Bundle.main, comment: "")]))
		  return
	   }
	   signUseCase?.postSign(
		  operation: operation,
		  dict: ["": ""],
		  datosInUse: datosInUse,
		  signFormat: signFormat,
		  signAlgoInUse: signAlgoInUse,
		  base64UrlSafeCertificateData: certificateData,
		  extraParams: signModel.extraParams,
		  encodedData: encodedData,
		  triphasicServerURL: signModel.triphasicServerURL,
		  rtServlet: signModel.rtServlet,
		  completion: { result in
			 handlePostSignResult(
				signModel: signModel,
				result: result
			 )
		  })
    }
    
    func handlePostSignResult(signModel: SignModel,  result: Result<Data, Error>) {
	   guard let urlServlet = signModel.urlServlet,
		    let cipherKey = signModel.cipherKey,
		    let docId = signModel.docId,
		    let certificateData = certificateUtils?.base64UrlSafeCertificateData else {
		  handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_datos_firmar", bundle: Bundle.main, comment: "")]))
		  return
	   }
	   switch result {
		  case .success(let postSignResult):
			 if let responseString = String(data: postSignResult, encoding: .utf8) {
				if responseString.contains("OK") {
				    if let range = responseString.range(of: "=") {
					   let parte2 = String(responseString[range.upperBound...])
					   
					   self.sendCertificateUseCase = SendCertificateUseCase(
						  urlServlet: urlServlet,
						  cipherKey: cipherKey,
						  docId: docId,
						  base64UrlSafeCertificateData: certificateData
					   )
					   
					   sendCertificate(dataSign: parte2)
				    } else {
					   handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_proceso_firma", bundle: Bundle.main, comment: "")]))
				    }
				} else {
				    handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_proceso_firma", bundle: Bundle.main, comment: "")]))
				}
			 } else {
				handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_proceso_firma", bundle: Bundle.main, comment: "")]))
			 }
			 
		  case .failure(let error):
			 handleSignError(error: error)
	   }
    }
    
    func handleSignError(error: Error){
	   print("Error occurred: \(error.localizedDescription)")
	   appStatus.errorPublisher.send(error.localizedDescription)
	   
	   signUseCase?.reportErrorAsync(
		  urlServlet: signModel?.urlServlet,
		  docId: signModel?.docId,
		  error: ErrorHandlerUtils.getErrorModalDescriptionFromError(error: error),
		  completion: { result in
			 DispatchQueue.main.async {
				appStatus.isLoading = false
				appStatus.errorModalDescription = error.localizedDescription
				appStatus.errorModalState = .globalError
				appStatus.showErrorModal = true
			 }
			 //TODO: Depending on the error, show the modal description accordingly
			 switch result {
				case .success(let errorFromServer):
				    if let response = String(data: errorFromServer, encoding: .utf8) {
					   print("Server response from reportError: " + response)
				    }
				case .failure(let error):
				    print(error.localizedDescription)
			 }
		  })
    }
    
    func loadCertificateAndRetrieveValues(
	   certName: String,
	   password: String,
	   fromDocument: Bool,
	   completion: @escaping (String?, SecKey?) -> Void
    ) {
	   DispatchQueue.global(qos: .background).async {
		  certificateUtils?.selectedCertificateName = certName
		  let status = certificateUtils?.loadCertKeyChain(withName: certName, password: password, fromDocument: fromDocument)
		  
		  guard status == errSecSuccess else {
			 print("Failed to load certificate with status: \(status ?? -1)")
			 DispatchQueue.main.async {
				completion(nil, nil)
			 }
			 return
		  }
		  
		  let base64UrlSafeCertificateData = certificateUtils?.base64UrlSafeCertificateData
		  let privateKey = certificateUtils?.privateKey
		  
		  DispatchQueue.main.async {
			 completion(base64UrlSafeCertificateData, privateKey)
		  }
	   }
    }
    
    func updateSelectedCertificate(_ selectedCertificateSubject: String) {
	   self.certificateUtils = CertificateUtils()
	   
	   if ((certificateUtils?.searchIdentity(byName: selectedCertificateSubject)) != nil) {
		  let userDefaults = UserDefaults.standard
		  userDefaults.set([kAOUserDefaultsKeyAlias: selectedCertificateSubject], forKey: kAOUserDefaultsKeyCurrentCertificate)
		  userDefaults.synchronize()
		  certificateUtils?.selectedCertificateName = selectedCertificateSubject
		  buttonEnabled = true
	   }
    }
}
