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
						  appStatus.isLoading = true
						  if signModel?.operation == OPERATION_SELECT_CERTIFICATE{
							 sendCertificateUseCase?.sendCertificate(dataSign: "", completion: { result in
								switch result {
								    case .success(let response):
									   print(response)
								    case .failure(let error):
									   appStatus.errorPublisher.send(error.localizedDescription)
								}
							 })
						  } else if signModel?.operation == OPERATION_SIGN {
							 signUseCase?.preSign(
								operation: signModel?.operation ?? "",
								datosInUse: signModel?.datosInUse ?? "",
								signFormat: signModel?.signFormat ?? "",
								signAlgoInUse: signModel?.signAlgoInUse ?? "",
								certificateData: certificateUtils?.base64UrlSafeCertificateData ?? "",
								extraParams: signModel?.extraParams,
								triphasicServerURL: signModel?.triphasicServerURL,
								rtServlet: signModel?.rtServlet,
								completion: { result in
								    DispatchQueue.main.async {
									   appStatus.isLoading = false
								    }
								    switch result{
									   case .success(let serverResponse):
										  guard let signAlgoInUse = signModel?.signAlgoInUse,
											   let privateKey = certificateUtils?.privateKey,
											   let encodedData = signUseCase?.generatePKCS1(
												dataReceivedb64: serverResponse,
												privateKey: privateKey,
												signAlgoInUse: signAlgoInUse,
												signFormat: signModel?.signFormat
											   ) else {
											 signUseCase?.reportErrorAsync(
												urlServlet: signModel?.urlServlet,
												docId: signModel?.docId,
												error: "",
												completion: { result in
												    DispatchQueue.main.async {
													   appStatus.errorModalState = .globalError
													   appStatus.showErrorModal = true
												    }
												})
											 return
										  }
										  DispatchQueue.main.async {
											 appStatus.isLoading = true
										  }
										  signUseCase?.postSign(
											 operation: signModel?.operation ?? "",
											 dict: ["": ""],
											 datosInUse: signModel?.datosInUse ?? "",
											 signFormat: signModel?.signFormat ?? "",
											 signAlgoInUse: signModel?.signAlgoInUse ?? "",
											 base64UrlSafeCertificateData: certificateUtils?.base64UrlSafeCertificateData ?? "",
											 extraParams: signModel?.extraParams,
											 encodedData: encodedData,
											 triphasicServerURL: signModel?.triphasicServerURL,
											 rtServlet: signModel?.rtServlet,
											 completion: { result in
												DispatchQueue.main.async {
												    appStatus.isLoading = false
												}
												switch result {
												    case .success(let postSignResult):
													   if let responseString = String(data: postSignResult, encoding: .utf8) {
														  if responseString.contains("OK") {
															 if let range = responseString.range(of: "=") {
																let parte2 = String(responseString[range.upperBound...])
																
																guard let urlServlet = signModel?.urlServlet, let cipherKey = signModel?.cipherKey, let docId = signModel?.docId, let base64UrlSafeCertificateData = certificateUtils?.base64UrlSafeCertificateData else {
																    return
																}
																self.sendCertificateUseCase = SendCertificateUseCase(
																    urlServlet: urlServlet,
																    cipherKey: cipherKey,
																    docId: docId,
																    base64UrlSafeCertificateData: base64UrlSafeCertificateData
																)
																DispatchQueue.main.async {
																    appStatus.isLoading = true
																}
																sendCertificateUseCase?.sendCertificate(dataSign: parte2, completion: { result in
																    appStatus.isLoading = false
																    switch result {
																	   case .success(let storeDataServerResponse):
																		  if let response = String(data: storeDataServerResponse, encoding: .utf8) {
																			 print(response)
																		  }
																		  DispatchQueue.main.async {
																			 viewMode = .home
																			 appStatus.successModalState = .successSign
																			 appStatus.showSuccessModal = true
																		  }
																	   case .failure(let error):
																		  signUseCase?.reportErrorAsync(
																			 urlServlet: signModel?.urlServlet,
																			 docId: signModel?.docId,
																			 error: error.localizedDescription,
																			 completion: { result in
																				DispatchQueue.main.async {
																				    appStatus.errorModalState = .globalError
																				    appStatus.showErrorModal = true
																				}
																			 })
																    }
																})
															 } else {
																signUseCase?.reportErrorAsync(
																    urlServlet: signModel?.urlServlet,
																    docId: signModel?.docId,
																    error: "",
																    completion: { result in
																	   DispatchQueue.main.async {
																		  appStatus.errorModalState = .globalError
																		  appStatus.showErrorModal = true
																	   }
																    })
															 }
														  } else {
															 signUseCase?.reportErrorAsync(
																urlServlet: signModel?.urlServlet,
																docId: signModel?.docId,
																error: "",
																completion: { result in
																    DispatchQueue.main.async {
																	   appStatus.errorModalState = .globalError
																	   appStatus.showErrorModal = true
																    }
																})
														  }
													   } else {
														  signUseCase?.reportErrorAsync(
															 urlServlet: signModel?.urlServlet,
															 docId: signModel?.docId,
															 error: "",
															 completion: { result in
																DispatchQueue.main.async {
																    appStatus.errorModalState = .globalError
																    appStatus.showErrorModal = true
																}
															 })
													   }
													   
												    case .failure(let error):
													   signUseCase?.reportErrorAsync(
														  urlServlet: signModel?.urlServlet,
														  docId: signModel?.docId,
														  error: error.localizedDescription,
														  completion: { result in
															 DispatchQueue.main.async {
																appStatus.errorModalState = .globalError
																appStatus.showErrorModal = true
															 }
														  })
												}
											 })
									   case .failure(let error):
										  signUseCase?.reportErrorAsync(
											 urlServlet: signModel?.urlServlet,
											 docId: signModel?.docId,
											 error: error.localizedDescription,
											 completion: { result in
												DispatchQueue.main.async {
												    appStatus.errorModalState = .globalError
												    appStatus.showErrorModal = true
												}
											 })
								    }
								})
						  }
					   }
				    }) {
					   AccessibleText(content: NSLocalizedString("home_certificates_sign_button_title", bundle: Bundle.main, comment: ""))
				    }
				    .buttonStyle(CustomButtonStyle(isEnabled: buttonEnabled))
				}
			 }
		  }
	   }
	   .onChange(of: appStatus.selectedCertificate, perform: { value in
		  buttonEnabled = true
		  
		  if let value = value{
			 updateSelectedCertificate(value.subject)
		  }
	   })
	   .onAppear {
		  if let urlReceived = urlReceived {
			 appStatus.isLoading = true
			 receiveDataUseCase = ReceiveDataUseCase(appStatus: appStatus)
			 signUseCase = SingleSignUseCase()
			 
			 receiveDataUseCase?.parseUrl(urlReceived.absoluteString) { result in
				appStatus.isLoading = false
				switch result {
				    case .success(let result):
					   self.entity = result.0
					   self.signModel = SignModel(dictionary: result.1)
					   
				    case .failure(let error):
					   print("Error occurred: \(error.localizedDescription)")
					   appStatus.errorPublisher.send(error.localizedDescription)
					   handleSignError(error: error)
				}
			 }
		  }
	   }
    }
    
    func handleSignError(error: Error){
	   //TODO: Depending on the error, show the modal
	   appStatus.errorModalState = .globalError
	   appStatus.showErrorModal.toggle()
    }
    
    func loadCertificateAndRetrieveValues(certName: String, password: String, fromDocument: Bool, completion: @escaping (String?, SecKey?) -> Void) {
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
	   }
    }
}
