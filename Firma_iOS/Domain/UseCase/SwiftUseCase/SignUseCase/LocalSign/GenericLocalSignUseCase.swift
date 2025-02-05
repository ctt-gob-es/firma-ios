//
//  GenericLocalSignUseCase.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 31/1/25.
//  Copyright © 2025 Solid GEAR. All rights reserved.
//

import Foundation

class GenericLocalSignUseCase : NSObject {
    var signModel: SignModel
    
    init(signModel: SignModel) {
	   self.signModel = signModel
    }
    var completionCallback: ((Result<Bool, AppError>) -> Void)?
    
    func executeSign(completion: @escaping (Result<Bool, AppError>) -> Void) {
	   self.completionCallback = completion
	   if validateData() {
		  configure()
	   }
    }
    
    func sign() {
	   fatalError("This method must be overrided")
    }
    
    func preSign() {
	   fatalError("This method must be overrided")
    }
    
    func postSign() {
	   fatalError("This method must be overrided")
    }
    
    func getCertificateData() -> String? {
	   fatalError("This method must be overrided")
    }
    
    private func validateData() -> Bool {
	   return true
    }
    
    func configure() {
	   sign()
    }
}
