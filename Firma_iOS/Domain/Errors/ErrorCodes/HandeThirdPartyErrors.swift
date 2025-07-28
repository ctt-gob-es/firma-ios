//
//  HandeThirdPartyErrors.swift
//  Autofirma
//
//  Created by Luis Nicieza on 19/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

struct HandeThirdPartyErrors {
    
    static func getServerPresignError(codigo: String) -> AppError {
        switch codigo {
        case "ERR-1":
            return AppError.threePhaseServerPresignErr1
        case "ERR-2":
            return AppError.threePhaseServerPresignErr2
        case "ERR-3":
            return AppError.threePhaseServerPresignErr3
        case "ERR-4":
            return AppError.threePhaseServerPresignErr4
        case "ERR-5":
            return AppError.threePhaseServerPresignErr5
        case "ERR-6":
            return AppError.threePhaseServerPresignErr6
        case "ERR-7":
            return AppError.threePhaseServerPresignErr7
        case "ERR-8":
            return AppError.threePhaseServerPresignErr8
        case "ERR-9":
            return AppError.threePhaseServerPresignErr9
        case "ERR-10":
            return AppError.threePhaseServerPresignErr10
        case "ERR-11":
            return AppError.threePhaseServerPresignErr11
        case "ERR-12":
            return AppError.threePhaseServerPresignErr12
        case "ERR-13":
            return AppError.threePhaseServerPresignErr13
        case "ERR-14":
            return AppError.threePhaseServerPresignErr14
        case "ERR-15":
            return AppError.threePhaseServerPresignErr15
        case "ERR-16":
            return AppError.threePhaseServerPresignErr16
        case "ERR-17":
            return AppError.threePhaseServerPresignErr17
        case "ERR-18":
            return AppError.threePhaseServerPresignErr18
        case "ERR-19":
            return AppError.threePhaseServerPresignErr19
        case "ERR-20":
            return AppError.threePhaseServerPresignErr20
        case "ERR-21":
            return AppError.threePhaseServerPresignErr21
        default:
            return AppError.generalSoftwareError
        }
    }
    
    static func getServerPostSignError(codigo: String) -> AppError {
        switch codigo {
        case "ERR-1":
            return AppError.threePhaseServerPostsignErr1
        case "ERR-2":
            return AppError.threePhaseServerPostsignErr2
        case "ERR-3":
            return AppError.threePhaseServerPostsignErr3
        case "ERR-4":
            return AppError.threePhaseServerPostsignErr4
        case "ERR-5":
            return AppError.threePhaseServerPostsignErr5
        case "ERR-6":
            return AppError.threePhaseServerPostsignErr6
        case "ERR-7":
            return AppError.threePhaseServerPostsignErr7
        case "ERR-8":
            return AppError.threePhaseServerPostsignErr8
        case "ERR-9":
            return AppError.threePhaseServerPostsignErr9
        case "ERR-10":
            return AppError.threePhaseServerPostsignErr10
        case "ERR-11":
            return AppError.threePhaseServerPostsignErr11
        case "ERR-12":
            return AppError.threePhaseServerPostsignErr12
        case "ERR-13":
            return AppError.threePhaseServerPostsignErr13
        case "ERR-14":
            return AppError.threePhaseServerPostsignErr14
        case "ERR-15":
            return AppError.threePhaseServerPostsignErr15
        case "ERR-16":
            return AppError.threePhaseServerPostsignErr16
        case "ERR-17":
            return AppError.threePhaseServerPostsignErr17
        case "ERR-18":
            return AppError.threePhaseServerPostsignErr18
        case "ERR-19":
            return AppError.threePhaseServerPostsignErr19
        case "ERR-20":
            return AppError.threePhaseServerPostsignErr20
        case "ERR-21":
            return AppError.threePhaseServerPostsignErr21
        default:
            return AppError.generalSoftwareError
        }
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
    
    static func getLocalSignError(codigo: Int) -> AppError {
	   switch codigo {
	   case 1:
		  return AppError.unknownSignatureError
	   case 2:
		  return AppError.unknownSevereError
	   case 3:
		  return AppError.userOperationCanceled
	   case 4:
		  return AppError.inputOutputError
	   case 5:
		  return AppError.pdfIsPasswordProtected
	   case 6:
		  return AppError.pdfBadPassword
	   case 7:
		  return AppError.pdfInvalidFormat
	   case 8:
		  return AppError.pdfInvalidPageSelection
	   case 9:
		  return AppError.pdfInvalidRubricPosition
	   case 10:
		  return AppError.pdfFormModified
	   case 11:
		  return AppError.pdfSuspectedPSA
	   case 12:
		  return AppError.pdfUnregisteredSignatures
	   case 13:
		  return AppError.pdfCertifiedDocument
        case 1001:
           return AppError.localSignPresignError
        case 1002:
           return AppError.localSignAlgorithmError
        case 1003:
           return AppError.localSignSignatureError
        case 1004:
           return AppError.localSignPresignNotFoundError
        case 1005:
           return AppError.localSignPostsignError
	   default:
		  return AppError.generalSoftwareError
	   }
    }
    
    static func shouldRetry(error: AppError) -> Bool{
	   let retryableErrors: Set<AppError> = [
		  .pdfBadPassword,
		  .pdfIsPasswordProtected
	   ]
	   return retryableErrors.contains(error)
    }
}
