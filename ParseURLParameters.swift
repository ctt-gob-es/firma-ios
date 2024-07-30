//
//  OPParameters.swift
//  Cliente @firma
//
//  Created by Desarrollo Abamobile on 30/7/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

struct ParseURLParameters {
    var startURL: String?
    var stServletCert: String?
    var idDocCert: String?
    var fileIdCert: String?
    var rtServletCert: String?
    var cipherKeyCert: String?
    var receivedDataCert: Data?
    var receivedStringCert: String?
    var reportErrorCert: Bool = false
    var retrievingDataFromServletCert: Bool = false
    var numberOfRetries = 0
}
