//
//  NetworkService.swift
//  User Post
//
//  Created by ariltw on 27/09/20.
//

import Foundation
import Network

class NetworkService {
    
    /// Check if device is connected to internet or not
    /// - Returns: Boolean
    static func isInternetAvailable() -> Bool {
        let monitor = NWPathMonitor()
        var status: Bool = false
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                status = true
            } else {
                status = true
            }
        }
        
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
        return status
    }
    
    
    /// Do network request
    /// - Parameters:
    ///   - url: API URL
    ///   - result: Result data type for data and error
    func requestNetwork(to url: String, result: @escaping (Result<Data, BaseError>) -> Void) {
        let session = URLSession.shared
        let url = URL(string: url)!
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            
            // validate network status
            if !NetworkService.isInternetAvailable() {
                result(.failure(BaseError(message: "Internet is not available. Please try again!")))
            }
            
            // response error
            if error != nil {
                result(.failure(BaseError(message: "Internal Server Error")))
                return
            }
            
            result(.success(data!))
        })
        task.resume()
    }
}
