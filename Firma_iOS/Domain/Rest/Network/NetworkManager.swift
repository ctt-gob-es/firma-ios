//
//  NetworkManager.swift
//  Autofirma
//
//  Created by Luis Nicieza on 17/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class NetworkManager {
    
    // Singleton
    static let shared = NetworkManager()
    
    private init() {}
    
    // Método para obtener un URLSession con delegado personalizado
    func getSession() -> URLSession {
        return getSessionSSLDisabled()
    }
    
    private func getSessionSSLDisabled() -> URLSession {
        let configuration = URLSessionConfiguration.default
        let delegate = SSLBypassDelegate()
        let session = URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
        return session
    }
    
    private func getSessionSSLEnabled() -> URLSession {
        return URLSession.shared
    }
}
