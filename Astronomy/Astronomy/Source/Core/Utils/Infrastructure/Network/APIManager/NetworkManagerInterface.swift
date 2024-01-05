//
//  NetworkManagerInterface.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation
import PromiseKit

protocol NetworkManagerInterface {
    
    ///
    ///  perform  Raw task request
    /// - Parameters:
    ///   - request:  the api request type protocol
    ///   - model: JSON Decoder model
    /// - Returns:  The Promise publishes `APICodable` when the task completes, or terminates if the task fails with an error.
    ///
    func perform<T: Codable, Request: APIRequest>(request: Request, _ model: T.Type) -> Promise<T>
}
