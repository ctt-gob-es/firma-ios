//
//  CypherUtils.swift
//  Autofirma
//
//  Created by Luis Nicieza on 17/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

enum CipherUtils {
    
    /// Cifra un String URL Safe  para enviar al servidor intermedio
    ///
    /// Si llega el parámetro cipher realiza el cifrado con AES, en caso contrario comprueba si llega el parámetro cipherKey y realiza el cifrado con DES.
    ///
    /// - Parameter dataString: El valor a cigfrar
    /// - Parameter cipher: El valor del parámetro cipher recibido en la url con los datos para AES
    /// - Parameter cipherKey: El valor del parámetro key recibido en la url con la clave para el cifrado DES
    /// - Returns: El valor cifrado.
    static func cipherDataSend(dataString: String, cipher: String?, cipherKey: String?)  -> String? {
        // Los datos a enviar son urlSafe. Hacemos el decode teniendo esto en cuenta
        guard let dataDecode = Base64Utils.decode(dataString, urlSafe: true) else {
            return nil;
        }
        
        return cipherData(data: dataDecode, cipher: cipher, cipherKey: cipherKey)
    }
    
    /// Cifra un string sin url safe para enviar al servidor intermedio..
    ///
    /// Si llega el parámetro cipher realiza el cifrado con AES, en caso contrario comprueba si llega el parámetro cipherKey y realiza el cifrado con DES.
    ///
    /// - Parameter dataString: El valor a cigfrar
    /// - Parameter cipher: El valor del parámetro cipher recibido en la url con los datos para AES
    /// - Parameter cipherKey: El valor del parámetro key recibido en la url con la clave para el cifrado DES
    /// - Returns: El valor cifrado.
    static func cipherCertificateSend(certificateData: String, cipher: String?, cipherKey: String?) -> String? {
        // Los datos del certificado no son urlSafe
        guard let dataDecode = Base64Utils.decode(certificateData, urlSafe: false) else {
            return nil;
        }
        
        return cipherData(data: dataDecode, cipher: cipher, cipherKey: cipherKey)
    }
    
    /// Cifra el data  a enviar al servidor intermedio..
    ///
    /// Si llega el parámetro cipher realiza el cifrado con AES, en caso contrario comprueba si llega el parámetro cipherKey y realiza el cifrado con DES.
    ///
    /// - Parameter dataString: El valor a cigfrar
    /// - Parameter cipher: El valor del parámetro cipher recibido en la url con los datos para AES
    /// - Parameter cipherKey: El valor del parámetro key recibido en la url con la clave para el cifrado DES
    /// - Returns: El valor cifrado.
    static func cipherData(data: Data, cipher: String?, cipherKey: String?) -> String? {
        if let cipher = CipherData(base64String: cipher) {
            do {
                return try AESUtils.encrypt(data: data, key: cipher.key, iv: cipher.iv)
            } catch {
                //No hacemos nada e intentamos probar con DES
                let er = error
            }
        }
        
        if let cipherKey = cipherKey {
            return DesCypher.cypherData(data, sk: cipherKey.data(using: .utf8)!)
        }
        
        return nil;
    }
}
