//
//  CypherUtils.swift
//  Autofirma
//
//  Created by Luis Nicieza on 17/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

enum CipherUtils {
    
    static func cipherDataSend(dataString: String, cipherKey: String)  -> String? {
        guard let dataDecode = Base64Utils.decode(dataString, urlSafe: true) else {
            return nil;
        }
        return DesCypher.cypherData(dataDecode, sk: cipherKey.data(using: .utf8)!)
    }
    
    static func cipherCertificateSend(certificateData: String, cipherKey: String) -> String? {
        // Encrypt certificate
        guard let certificateEncode = Base64Utils.urlSafeEncode(certificateData) else {
            return nil;
        }
        return cipherDataSend(dataString: certificateEncode, cipherKey: cipherKey)
    }
    
}
