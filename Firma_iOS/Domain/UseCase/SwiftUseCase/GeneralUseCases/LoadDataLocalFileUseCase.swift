//
//  LoadDataLocalFileUseCase.swift
//  Autofirma
//
//  Created by Luis Nicieza on 18/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class LoadDataLocalFileUseCase {
    
    func execute(urlFile: [URL]?, signModel: SignModel?, completion: @escaping (Result<(String, String), AppError>) -> Void) {
        guard let urlFile = urlFile else {
            // Error la url no es válida
            sendError(error: AppError.signingLoadLocalFile, signModel: signModel, completion: completion)
            return
        }
        
        FileUtils.convertURLFileToData(urls: urlFile) { result in
            switch result {
            case .success(let fileData):
                let dataFile = Base64Utils.encode(fileData.data,urlSafe: true)
                if let dataFile = dataFile {
                    completion(.success((fileData.fileName, dataFile)))
                }
            case .failure(_):
                self.sendError(error: AppError.signingLoadLocalFile, signModel: signModel, completion: completion)
            }
        }
    }
    
    private func sendError(error: AppError, signModel: SignModel?, completion: @escaping (Result<(String, String), AppError>) -> Void) {
        guard let urlServlet = signModel?.urlServlet,
             let docId = signModel?.docId else {
            completion(.failure(error))
            return
        }
        
        IntermediateServerRest().storeDataError(error: error, stServlet: urlServlet, docId: docId, completion: { _ in
            // Tanto si pudimos guardar en el servidor intermedio como no, devolvemos el error original
            completion(.failure(error))
        })
    }
    
}
