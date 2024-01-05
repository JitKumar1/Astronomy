//
//  Endpoint.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation


struct Endpoint: APIEndpoint, Hashable {
    
    //MARK: - Properties
    
    let key: String
    
}

extension Endpoint {
    
    var host: String {
        "api.nasa.gov"
    }
    
    var path: String {
        "/\(Bundle.main.path(key:key))"
    }
    
    func append(parameters theParameters: APIQueryItems = .noQueryItems) -> APIQueryItems {
        var parameters = APIQueryItems(arrayLiteral: APIQueryItem(name: "api_key", value: "5LquIng3MJwMKoodIStkbl18Ba2ZUusx4wE9P5xo"))
        if theParameters.count > 0 {
            parameters.append(contentsOf: theParameters)
        }
        return parameters
    }
}

extension Endpoint {
    
    static let planetaryList = Endpoint(key: "planetaryList")
}
