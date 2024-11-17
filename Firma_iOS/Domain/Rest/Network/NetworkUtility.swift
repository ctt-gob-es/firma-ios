//
//  NetworkUtility.swift
//  Autofirma
//
//  Created by Luis Nicieza on 17/11/24.
//  Copyright © 2024 Solid GEAR. All rights reserved.
//

import Foundation

class NetworkUtility {
    static let shared = NetworkUtility()
    
    private init() {}
    
    // Método POST reutilizable
    func postRequest(url: String, parameters: [String: String], completion: @escaping (Result<Data, Error>) -> Void) {
        guard let request = createPostRequest(url: url, parameters: parameters) else {
            completion(.failure(NSError(domain: "InvalidRequest", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL or parameters."])))
            return
        }
        
        let session = NetworkManager.shared.getSession()
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                let statusError = NSError(domain: "HTTPError", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "HTTP Error: \(httpResponse.statusCode)"])
                completion(.failure(statusError))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "NoData", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received."])))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
    
    // Método para crear la solicitud POST
    func createPostRequest(url: String, parameters: [String: String]) -> URLRequest? {
        guard let requestUrl = URL(string: url) else { return nil }
        
        let bodyString = parameters.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
        guard let bodyData = bodyString.data(using: .utf8) else { return nil }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("\(bodyData.count)", forHTTPHeaderField: "Content-Length")
        request.setValue("text/plain,text/html,application/xhtml+xml,application/xml", forHTTPHeaderField: "Accept") // No es necesaria
        request.setValue("Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)", forHTTPHeaderField: "User-Agent") // No es necesaria

        request.httpBody = bodyData
        
        return request
    }
}
