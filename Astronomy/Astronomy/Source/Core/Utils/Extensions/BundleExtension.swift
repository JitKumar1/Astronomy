//
//  BundleExtension.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

import PromiseKit

extension Bundle {
    ///
    /// Request  Endpoint Plist  Dictionery
    ///
    func plist(forResource name: String = "Endpoints", ofType ext: String? = "plist") -> NSDictionary {
        guard let path = path(forResource: name, ofType: ext), let dictionary = NSDictionary(contentsOfFile: path) else {
            return [:]
        }
        return dictionary
    }
    
    ///
    ///  obtain Request path based Endpoint type
    /// - Parameters:
    ///   - endpoint: Endpoint Type
    /// - Returns: request Path
    ///
    func path(key: String, forResource name : String = "Endpoints") -> String {
        guard let value = plist(forResource: name).value(forKey:key) as? String else {
            debugPrint("Endpoints.plist Or \(key) key nameis not available in app bundle ")
            return ""
        }
        return value
    }
}

extension Bundle {
    
    static func decoder<Model: Codable>(_ model: Model.Type,
                                        forResource name: String,
                                        withExtension ext: String? = "json") -> Promise<Model> {
        return Promise { seal in
            guard let url = Bundle.main.url(forResource: name, withExtension: ext) else {
                return seal.reject(URLError(.badURL))
            }
            do {
                let data = try Data(contentsOf: url)
                let response = try JSON.decode(model, from: data)
                return seal.fulfill(response)
            } catch {
                return seal.reject(error)
            }
        }
        
    }
}
