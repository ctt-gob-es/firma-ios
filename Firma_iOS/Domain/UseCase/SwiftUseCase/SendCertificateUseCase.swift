//
//  SendCertificateUseCase.swift
//  Autofirma
//
//  Created by Luis Nicieza on 17/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

//
//  SendCertificateUseCase.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 24/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class SendCertificateUseCase {
    
    func execute (
       base64Certificate: String,
       signModel: SignModel,
       completion: @escaping (ErrorInfo?) -> Void) {
        
           guard let cipherCertificate = CipherUtils.cipherCertificateSend(certificateData: base64Certificate, cipherKey: signModel.cipherKey!) else {
               sendError(signModel: signModel, errorInfo: ErrorCodes.InternalSoftwareErrorCodes.signingCipherCertificateError.info, completion: completion)
               return
           }
           
           IntermediateServerRest().uploadData(dataUpload: cipherCertificate, stServlet: signModel.urlServlet!, docId: signModel.docId!) { result in
               switch result {
               case .success():
                   completion(nil)
               case .failure(let errorInfo):
                   self.sendError(signModel: signModel, errorInfo: errorInfo, completion: completion)
               }
           }
    }
           
    private func sendError(signModel: SignModel, errorInfo: ErrorInfo, completion: @escaping (ErrorInfo?) -> Void) {
        IntermediateServerRest().storeDataError(error: errorInfo, stServlet: signModel.urlServlet!, docId: signModel.docId!, completion: { _ in
            // Tanto si pudimos guardar en el servidor intermedio como no, devolvemos el error original
            completion(errorInfo)
        })
    }
}
