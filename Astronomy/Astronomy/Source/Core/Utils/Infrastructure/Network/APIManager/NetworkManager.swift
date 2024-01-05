//
//  NetworkManager.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation
import PromiseKit

final class NetworkManager {
    
    /// a netowk session with the specified session configuration.
    private(set) var configuration: URLSessionConfiguration
 
    /// a netowk session with the specified session configuration.
    private(set) lazy var session: URLSession = {
        return URLSession(configuration: configuration)
    }()

    // MARK: - Initialization
    
    ///
    /// Creates a netowk session with the specified session configuration
    /// - Parameters:
    ///   - configuration: a netowk session with the specified session configuration.
    ///
    init(configuration: URLSessionConfiguration = .default) {
        self.configuration = configuration
    }

}

extension NetworkManager : NetworkManagerInterface {
    
    func perform<T: Codable, Request: APIRequest>(request: Request, _ model: T.Type) -> Promise<T> {
        return Promise { seal in
            guard let urlRequest = request.urlRequest else {
                return seal.reject(URLError(.badURL))
            }
            session.dataTask(with: urlRequest) { data, urlResponse, error in
                if let error {
                    let theError = URLError(code: (error as NSError).code, message: error.localizedDescription)
                    return seal.reject(theError)
                } else if let data {
                    guard let httpResponse = urlResponse as? HTTPURLResponse else {
                        return seal.reject(URLError(.badServerResponse))
                    }
                    if case 200..<300 = httpResponse.statusCode {
                        do {
                            let result = try JSON.decode(model, from: data)
                            return  seal.fulfill(result)
                        } catch {
                            return seal.reject(error)
                        }
                    } else {
                        let error = URLError(code: httpResponse.statusCode)
                        return seal.reject(error)
                    }
                }
                
            }.resume()
            
        }
    }
}
