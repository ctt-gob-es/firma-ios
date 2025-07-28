//
//  SendCertificateUseCase.swift
//  Autofirma
//
//  Created by Luis Nicieza on 17/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class SendCertificateUseCase {
    
    func execute (
       base64Certificate: String,
       signModel: SignModel,
       completion: @escaping (AppError?) -> Void) {
        
           guard let cipherCertificate = CipherUtils.cipherCertificateSend(certificateData: base64Certificate, cipherKey: signModel.cipherKey!) else {
               sendError(signModel: signModel, error: AppError.signingCipherCertificateError, completion: completion)
               return
           }
           
           IntermediateServerRest().uploadData(dataUpload: cipherCertificate, stServlet: signModel.urlServlet!, docId: signModel.docId!) { result in
               switch result {
               case .success():
                   completion(nil)
               case .failure(let appError):
                   self.sendError(signModel: signModel, error: appError, completion: completion)
               }
           }
    }
           
    private func sendError(signModel: SignModel, error: AppError, completion: @escaping (AppError?) -> Void) {
        IntermediateServerRest().storeDataError(error: error, stServlet: signModel.urlServlet!, docId: signModel.docId!, completion: { _ in
            // Tanto si pudimos guardar en el servidor intermedio como no, devolvemos el error original
            completion(error)
        })
    }
}
