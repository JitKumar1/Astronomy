//
//  JSON.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

enum JSON {

    ///
    /// Obtains JSON data from the given `Encodable` instance.
    /// - Parameter model: The JSON Encodable Generic Data Model
    /// - Returns: A `Data` containing the JSON representation. Or, `nil` if the given instance cannot be encoded.
    ///
    static func encode<T>(for model: T) -> Data? where T : Encodable {
        try? JSONEncoder().encode(model)
    }

    ///
    /// Obtains JSON  Decodable Data Model  from the given `Data` instance.
    /// - Parameters:
    ///   - model: The JSON Decodable Generic Data Model
    ///   - data:  The JSON Data .
    /// - Returns:  A `Decodable`  the JSON Model representation.
    ///
    static func decode<T>(_ model: T.Type, from data: Data) throws ->  T where T : Decodable {
        try JSONDecoder().decode(model, from: data)
    }
}
