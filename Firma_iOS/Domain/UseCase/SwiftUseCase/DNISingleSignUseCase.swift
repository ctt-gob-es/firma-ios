//
//  SingleSignUseCase.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 24/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class DNISingleSignUseCase : SingleSignUseCase, DNIeResult {
    var pkcs1: Data? = nil
    private var certificateData: String? = nil
    private var wrapper: SwiftDNIeWrapper?
    private var completionCallback: ((Result<Bool, Error>) -> Void)?
    
    init(can: String, pin: String, signModel: SignModel, certificateUtils: CertificateUtils?) {
	   super.init(signModel: signModel, certificateUtils: certificateUtils)
	   wrapper = SwiftDNIeWrapper(can: can, pin: pin)
    }
    
    override func singleSign(completion: @escaping (Result<Bool, Error>) -> Void) {
	   guard let signModel else {
		  handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_datos_firmar", bundle: Bundle.main, comment: "")]), completion: completion)
		  return
	   }
	   self.completionCallback = completion
	   wrapper?.getDNIe(completion: self)
    }
    
    func getDNIeNFCSuccess(dnie: EsGobJmulticardCardDnieDnieNfc) {
	   presign(signModel: signModel!)
    }
    
    func getDNIeError() {
	   handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_datos_firmar", bundle: Bundle.main, comment: "")]), completion: self.completionCallback!)
    }
    
    private func presign(signModel: SignModel) {
	   guard let operation = signModel.operation,
		    let datosInUse = signModel.datosInUse,
		    let signFormat = signModel.signFormat,
		    let signAlgoInUse = signModel.signAlgoInUse,
		    let certificateData = certificateData else {
		  handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_datos_firmar", bundle: Bundle.main, comment: "")]), completion: self.completionCallback!)
		  return
	   }
	   
	   if CADESSignUtils.isValidAlgorithm(signAlgoInUse) {
		  preSign(
			 operation: operation,
			 datosInUse: datosInUse,
			 signFormat: signFormat,
			 signAlgoInUse: signAlgoInUse,
			 certificateData: certificateData,
			 extraParams: signModel.extraParams,
			 triphasicServerURL: signModel.triphasicServerURL,
			 rtServlet: signModel.rtServlet,
			 completion: { result in
				self.handlePresingResult(signModel: signModel, result: result, completion: self.completionCallback!)
			 })
	   } else {
		  handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_algoritmo_no_soportado", bundle: Bundle.main, comment: "")]), completion: self.completionCallback!)
	   }
    }
    
    private func handlePresingResult(signModel: SignModel, result: Result<String, Error>, completion: @escaping (Result<Bool, Error>) -> Void) {
	   switch result {
		  case .success(let serverResponse):
			 guard let pkcs1 = pkcs1 else {
				if serverResponse.contains(ERR_PASSWORD_PROTECTED) || serverResponse.contains(ERR_BAD_PASSWORD) {
				    handleRetryWithPassword(completion: completion)
				} else {
				    if let range = serverResponse.range(of: ":", options: .backwards) {
					   let result = serverResponse[range.upperBound...]
					   handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: result]), completion: completion)
				    } else {
					   handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_proceso_firma", bundle: Bundle.main, comment: "")]), completion: completion)
				    }
				}
				return
			 }
			 postsign(signModel: signModel, encodedData: pkcs1, completion: completion)
			 
		  case .failure(let error):
			 handleSignError(error: error, completion: completion)
	   }
    }
    
    private func postsign(signModel: SignModel, encodedData: Data, completion: @escaping (Result<Bool, Error>) -> Void) {
	   guard let operation = signModel.operation,
		    let datosInUse = signModel.datosInUse,
		    let signFormat = signModel.signFormat,
		    let signAlgoInUse = signModel.signAlgoInUse,
		    let certificateData = certificateData else {
		  handleSignError(error: NSError(domain: "Error", code: -1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("error_datos_firmar", bundle: Bundle.main, comment: "")]), completion: completion)
		  return
	   }
	   postSign(
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
			 self.handlePostSignResult(
				signModel: signModel,
				result: result,
				completion: completion
			 )
		  })
    }
    
    override func postSign(
	   operation: String,
	   dict: [String: String],
	   datosInUse: String,
	   signFormat: String,
	   signAlgoInUse: String,
	   base64UrlSafeCertificateData: String,
	   extraParams: String?,
	   encodedData: Data,
	   triphasicServerURL: String?,
	   rtServlet: String?,
	   completion: @escaping (Result<Data, Error>) -> Void
    ) {
	   postSignRest.postSign(
		  operation: operation,
		  dict: dict,
		  datosInUse: datosInUse,
		  signFormat: signFormat,
		  signAlgoInUse: signAlgoInUse,
		  base64UrlSafeCertificateData: base64UrlSafeCertificateData,
		  extraParams: extraParams,
		  encodedData: encodedData,
		  triphasicServerURL: triphasicServerURL,
		  rtServlet: rtServlet,
		  completion: completion
	   )
    }
}
