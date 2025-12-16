//
//  CipherData.swift
//  Autofirma
//
//  Created by Luis Nicieza on 3/12/25.
//  Copyright © 2025 Solid GEAR. All rights reserved.
//
struct CipherData: Codable {
    let algo: String
    let key: String
    let iv: String
    
    /// Inicializador failable que crea un CipherData a partir de una cadena Base64 URL-Safe opcional.
    ///
    /// Se encarga de:
    /// 1. Verificar si la cadena de entrada existe.
    /// 2. Decodificar la cadena Base64 a Data binario.
    /// 3. Deserializar el Data binario a un objeto CipherData (JSONDecoder).
    ///
    /// - Parameters:
    ///   - base64String: La cadena que contiene el JSON codificado en Base64 URL-Safe.
    init?(base64String: String?) {
        
        // 1. Verificar si la cadena de entrada existe y no está vacía
        guard let base64String = base64String, !base64String.isEmpty else {
            return nil // Devolver nil si el String es nil o vacío.
        }
        
        // 2. Decodificar Base64 URL-Safe a Data binario
        // NOTA: Asumo que Base64Utils.decode() devuelve Data?
        guard let jsonData = Base64Utils.decode(base64String, urlSafe: true) else {
            return nil // Fallar si la decodificación Base64 no es válida.
        }
        
        // 3. Deserializar el Data binario a JSON
        do {
            let decodedObject = try JSONDecoder().decode(CipherData.self, from: jsonData)
            
            // Si la decodificación tiene éxito, asignamos las propiedades.
            // Para evitar recursividad, usamos las propiedades del objeto decodificado, no 'self.init'.
            self.algo = decodedObject.algo
            self.key = decodedObject.key
            self.iv = decodedObject.iv
            
        } catch {
            // Si la decodificación JSON falla, devolvemos nil.
            print("Error decoding CipherData JSON: \(error)")
            return nil
        }
    }
}
