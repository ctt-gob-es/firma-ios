//
//  HandleNFCErrors.swift
//  Autofirma
//
//  Created by Luis Nicieza on 24/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation
import CoreNFC

struct HandleNFCErrors {
    
    static func getNFCError(nfcReaderError: NFCReaderError) -> AppError {
        switch nfcReaderError.code {
        case .readerTransceiveErrorTagConnectionLost:
            return AppError.nfcReaderTransceiveErrorTagConnectionLost
        case .readerTransceiveErrorRetryExceeded:
            return AppError.nfcReaderTransceiveErrorRetryExceeded
        case .readerTransceiveErrorTagNotConnected:
            return AppError.nfcReaderTransceiveErrorTagNotConnected
        case .readerSessionInvalidationErrorUserCanceled:
            return AppError.nfcReaderSessionInvalidationErrorUserCanceled
        case .readerSessionInvalidationErrorSessionTimeout:
            return AppError.nfcReaderSessionInvalidationErrorSessionTimeout
        case .readerSessionInvalidationErrorSystemIsBusy:
            return AppError.nfcReaderSessionInvalidationErrorSystemIsBusy
        case .readerSessionInvalidationErrorFirstNDEFTagRead:
            return AppError.nfcReaderSessionInvalidationErrorFirstNDEFTagRead
        case .ndefReaderSessionErrorZeroLengthMessage:
            return AppError.nfcNdefReaderSessionErrorZeroLengthMessage
        case .readerErrorRadioDisabled:
            return AppError.nfcReaderErrorRadioDisabled
            
        case .readerErrorUnsupportedFeature:
            return AppError.nfcReaderErrorUnsupportedFeature
        case .readerErrorSecurityViolation:
            return AppError.nfcReaderErrorSecurityViolation
        case .readerErrorInvalidParameter:
            return AppError.nfcReaderErrorInvalidParameter
        case .readerErrorInvalidParameterLength:
            return AppError.nfcReaderErrorInvalidParameterLength
        case .readerErrorParameterOutOfBound:
            return AppError.nfcReaderErrorParameterOutOfBound
        case .readerTransceiveErrorTagResponseError:
            return AppError.nfcReaderTransceiveErrorTagResponseError
        case .readerTransceiveErrorSessionInvalidated:
            return AppError.nfcReaderTransceiveErrorSessionInvalidated
        case .readerTransceiveErrorPacketTooLong:
            return AppError.nfcReaderTransceiveErrorPacketTooLong
        case .tagCommandConfigurationErrorInvalidParameters:
            return AppError.nfcTagCommandConfigurationErrorInvalidParameters
        case .ndefReaderSessionErrorTagNotWritable:
            return AppError.nfcNdefReaderSessionErrorTagNotWritable
        case .ndefReaderSessionErrorTagUpdateFailure:
            return AppError.nfcNdefReaderSessionErrorTagUpdateFailure
        case .ndefReaderSessionErrorTagSizeTooSmall:
            return AppError.nfcNdefReaderSessionErrorTagSizeTooSmall
                
        case .readerSessionInvalidationErrorSessionTerminatedUnexpectedly:
            return AppError.nfcReaderSessionInvalidationErrorSessionTerminatedUnexpectedly
                
        default:
            return AppError.nfcUnknowError
            
        }
    }
}
