//
//  DNIEBatchSignUseCase.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 25/10/24.
//  © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class DNIeBatchSignUseCase: GenericBatchSignUseCase, DNIeResult {
    
    // MARK: - Properties
    
    var wrapper: SwiftDNIeWrapper?
    private var dnieWrapper: EsGobJmulticardIosDnieWrapper?
    private var certificateData: String?
    
    // MARK: - Initialization
    
    init(can: String, pin: String) {
	   super.init()
	   wrapper = SwiftDNIeWrapper(can: can, pin: pin)
    }
    
    // MARK: - Error Handling
    
    private func handleErrorDnieWrapper(errorCode: Int) {
        if let completionHandler = self.completionHandler {
            completionHandler(.failure(ErrorCodes.getServerError(codigo: String(errorCode)).info))
        }
    }
    
    // MARK: - Overridden Methods
    
    override func preloadCertificateData() {
	   wrapper?.getDNIe(completion: self)
    }
    
    // MARK: - DNIeResult Protocol Conformance
    
    func getDNIeNFCSuccess(wrapper: EsGobJmulticardIosDnieWrapper) {
	   self.dnieWrapper = wrapper
	   
	   let certJ509 = wrapper.getCertificateWith(PrivateConstants.certFromDNIe)
	   if let certJ509 = certJ509 {
		  self.certificateData = EsGobAfirmaCoreMiscBase64_encodeWithByteArray_withBoolean_(certJ509.getEncoded(), true)
	   } else {
		  handleErrorDnieWrapper(errorCode: 11)
		  return
	   }
	   presign()
    }
    
    func getDNIeError(errorCode: Int, errorMessage: String) {
	   handleErrorDnieWrapper(errorCode: errorCode)
    }
    
    // MARK: - Signing Method
    
    override func sign(pre: String, algorithm: String, pk1Decoded: Bool) -> String {
	   guard let dataToSign = Base64Utils.decode(pre, urlSafe: true) else {
		  return ""
	   }
	   
	   guard let privateKeyReference = dnieWrapper?.getPrivateKey(with: PrivateConstants.certFromDNIe),
		    let dataSigned = dnieWrapper?.sign(with: IOSByteArray(nsData: dataToSign), with: algorithm, with: privateKeyReference) else {
		  handleErrorDnieWrapper(errorCode: Int(dnieWrapper?.getErrorCode() ?? 10))
		  return ""
	   }
	   
	   if pk1Decoded {
		  return decodePK1Signature(dataSigned.toNSData())
	   }
	   
	   return Base64Utils.encode(dataSigned.toNSData())
    }
    
    override func getCertificateData() -> String {
		  self.certificateData ?? "error_no_certificate_data"
    }
}
