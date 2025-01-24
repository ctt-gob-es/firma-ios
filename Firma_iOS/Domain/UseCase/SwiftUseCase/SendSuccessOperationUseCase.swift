//
//  SendSuccessOperationUseCase.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 7/1/25.
//  Copyright © 2025 Solid GEAR. All rights reserved.
//

import Foundation

class SendSuccessOperationUseCase {
    func execute(signModel: SignModel?) {
	   if let signModel = signModel {
		  IntermediateServerRest().uploadData(dataUpload: "OK", stServlet: signModel.urlServlet!, docId: signModel.docId!) { result in
			 // Da igual si se ha podido guardar o no el error. No se gestiona el error porque es asincrono y transparente al usuario
		  }
	   }
    }
}
