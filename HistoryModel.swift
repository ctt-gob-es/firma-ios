//
//  HistoryModel.swift
//  Autofirma
//
//  Created by Desarrollo Abamobile on 9/8/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

struct HistoryModel {
    var date: Date
    var signType: SignType
    var dataType: DataType
    var externalApp: String?
    var filename: String?
    var returnURL: String?
    var operation: String?
}

enum SignType : String {
    case local = "historical_local_sign_type"
    case external = "historical_external_sign_type"
}

enum DataType : String {
    case local = "historical_local_data_type"
    case external = "historical_external_data_type"
}
