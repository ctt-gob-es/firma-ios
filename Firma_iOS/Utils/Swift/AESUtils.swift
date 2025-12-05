//
//  AESUtils.swift
//  Autofirma
//
//  Created by Luis Nicieza on 3/12/25.
//  Copyright © 2025 Solid GEAR. All rights reserved.
//
import Foundation
import CommonCrypto

class AESUtils {

    enum AESError: Error {
        case invalidInput
        case keyError
        case ivError
        case dataError
        case cryptError(status: CCCryptorStatus)
    }

    // MARK: - Cifrar texto plano y devolver Base64
    static func encrypt(data: Data, key: String, iv: String) throws -> String {
        let encryptedData = try crypt(data: data, key: key, iv: iv, operation: CCOperation(kCCEncrypt))
        
        // Lo codificamos en base64 con urlSafe
        return Base64Utils.encode(encryptedData, urlSafe: true);
    }

    // MARK: - Descifrar Base64 y devolver texto plano
    static func decrypt(data: Data, key: String, iv: String) throws -> Data {
        // El data no sllega en Base64 urlSafe, hay que decodificarlo para poder desencriptar
        
        let stringData = String(data: data, encoding: .utf8);
        guard let dataDecoded = Base64Utils.decode(stringData, urlSafe:true) else {
            throw AESError.dataError
        }
        
        let decryptedData = try crypt(data: dataDecoded, key: key, iv: iv, operation: CCOperation(kCCDecrypt))
        
        // Intentamos convertir a string los datos desencriptados, si no se puede lanzamos error
        let datosInUse = String(data: decryptedData, encoding: .utf8)
        guard let _ = datosInUse else {
            throw AESError.dataError
        }
        
        return decryptedData
    }

    // MARK: - Función interna común
    private static func crypt(data: Data, key: String, iv: String, operation: CCOperation) throws -> Data {
        
        let stringData = String(data: data, encoding: .utf8)
        
        // 1. Obtener los datos binarios DECODIFICANDO el formato Base64
        guard let keyData = Data(base64Encoded: key), keyData.count == kCCKeySizeAES256 else {
            // Ahora el error se lanza si la decodificación falla O si el tamaño binario no es 32 bytes.
            throw AESError.keyError
        }
        
        guard let ivData = Data(base64Encoded: iv), ivData.count == kCCBlockSizeAES128 else {
            // Ahora el error se lanza si la decodificación falla O si el tamaño binario no es 16 bytes.
            throw AESError.ivError
        }
        
        // 2. Determinar el tamaño de buffer de salida.
        // Se calcula: Tamaño de la entrada + tamaño de bloque - 1, redondeado al múltiplo más cercano del tamaño de bloque
        let dataLength = size_t(data.count)
        let outputLength = size_t(dataLength + kCCBlockSizeAES128)
        var outputBuffer = [UInt8](repeating: 0, count: outputLength)

        var bytesDecrypted: size_t = 0
        let status = data.withUnsafeBytes { dataPointer in
            keyData.withUnsafeBytes { keyPointer in
                ivData.withUnsafeBytes { ivPointer in
                    CCCrypt(
                        operation,
                        CCAlgorithm(kCCAlgorithmAES),
                        // Modo CBC con PKCS7Padding
                        CCOptions(kCCOptionPKCS7Padding),
                        //CCOptions(0),
                        keyPointer.baseAddress,
                        kCCKeySizeAES256,
                        ivPointer.baseAddress,
                        dataPointer.baseAddress,
                        dataLength,
                        &outputBuffer,
                        outputLength,
                        &bytesDecrypted
                    )
                }
            }
        }

        guard status == kCCSuccess else {
            throw AESError.cryptError(status: status)
        }

        // 3. Devolver los datos resultantes con la longitud correcta
        return Data(outputBuffer.prefix(bytesDecrypted))
    }
    
}
