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
        return getSession(withTimeout: nil, withSSLDisabled: true)
    }
    
    func getSession(withTimeout timeout: Int) -> URLSession {
        return getSession(withTimeout: timeout, withSSLDisabled: true)
    }
    
    private func getSession(withTimeout timeout: Int?, withSSLDisabled sslDisabled: Bool) -> URLSession {
        let config = getConfiguration(withTimeout: timeout)
        
        if (sslDisabled) {
            let delegate = SSLBypassDelegate()
            return URLSession(configuration: config, delegate: delegate, delegateQueue: nil)
        } else {
            return URLSession(configuration: config)
        }
    }
    
    private func getConfiguration(withTimeout timeout: Int?) -> URLSessionConfiguration {
        let config = URLSessionConfiguration.default
        
        if let timeout = timeout {
            let timeoutInterval = TimeInterval(timeout)
            config.timeoutIntervalForRequest = timeoutInterval
            config.timeoutIntervalForResource = timeoutInterval
        }
        return config
    }
}
