//
//  ReportErrorUseCase.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 30/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class SendErrorOperationUseCase {
    
    func execute (error: AppError, signModel: SignModel?) {
        if let signModel = signModel {
            IntermediateServerRest().storeDataError(error: error, stServlet: signModel.urlServlet!, docId: signModel.docId!) { result in
                // Da igual si se ha podido guardar o no el error. No se gestiona el error porque es asincrono y transparente al usuario
            }
        }
    }
}
