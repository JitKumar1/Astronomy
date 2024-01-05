//
//  APIEndpoint.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

protocol APIEndpoint: Hashable {
    
    ///
    /// the Request path of url
    ///
    var path: String { get }
    
    ///
    /// the request  host name
    ///
    var host: String { get }
    
    ///
    ///  make request parameter with additional parameters
    /// - Parameters:
    ///   - theParameters: additional parmeters are additional list of parameters for sending parmeter with  default request parameters, additional parameters are  optional
    /// - Returns: list request parameters
    ///
    func append(parameters theParameters: APIQueryItems) -> APIQueryItems
}
