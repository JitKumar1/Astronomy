//
//  HTTPMethod.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

///
/// Type representing HTTP methods. Raw `String` value is stored and compared case-sensitively, so
/// `HTTPMethod.get != HTTPMethod(rawValue: "get")`.
///
struct HTTPMethod: RawRepresentable, Equatable, Hashable {
    
    //MARK: - Constants
    
    /// indicates the httpMethod `DELETE` method.
     static let delete = HTTPMethod(rawValue: "DELETE")
    
    ///  indicates the httpMethod `GET` method.
     static let get = HTTPMethod(rawValue: "GET")
    
    ///  indicates the httpMethod `POST` method.
     static let post = HTTPMethod(rawValue: "POST")
    
    ///  indicates the httpMethod `PUT` method.
     static let put = HTTPMethod(rawValue: "PUT")
    
    //MARK: - Properties
    
     let rawValue: String
    
     init(rawValue: String) {
        self.rawValue = rawValue
    }
}
