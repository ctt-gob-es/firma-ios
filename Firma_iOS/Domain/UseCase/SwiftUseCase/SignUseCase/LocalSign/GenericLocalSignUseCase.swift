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
    
    private let defaultSignAlgorithm = "SHA256"
    
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
    
    func validateData() -> Bool {
	   return true
    }
    
    func getSignAlghorithm() {
        
    }
    
    func configure() {
	   sign()
    }
}
