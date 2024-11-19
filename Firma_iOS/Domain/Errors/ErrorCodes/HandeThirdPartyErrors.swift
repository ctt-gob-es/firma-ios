//
//  HandeThirdPartyErrors.swift
//  Autofirma
//
//  Created by Luis Nicieza on 19/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

struct HandeThirdPartyErrors {
    
    static func getServerError(codigo: String) -> AppError {
        return AppError.generalSoftwareError
    }
    
    static func getDNIEError(codigo: Int) -> AppError {
        switch codigo {
        case 1:
            return AppError.invalidCard
        case 2:
            return AppError.burnedCard
        case 3:
            return AppError.connectionError
        case 4:
            return AppError.notInitialized
        case 5:
            return AppError.operationError
        case 6:
            return AppError.badPin
        case 7:
            return AppError.lockedCard
        case 8:
            return AppError.pinError
        case 9:
            return AppError.badCan
        case 10:
            return AppError.severeError
        case 11:
            return AppError.noCertAvailable
        default:
            return AppError.generalSoftwareError
        }
        
    }
}
