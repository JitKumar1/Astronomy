//
//  Endpoint.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation


struct Endpoint: APIEndpoint, Hashable {
    
    /// the endpoint key name to optain query path from Endpoints plist
    let key: String
}

extension Endpoint {
    
    var host: String {
        "api.nasa.gov"
    }
    
    var path: String {
        "/\(Bundle.main.path(key:key))"
    }
    
    func append(parameters theParameters: APIQueryItems = []) -> APIQueryItems {
        let dummyAppKey = Bundle.main.path(key: "dummyAppKey")
        var parameters = APIQueryItems(arrayLiteral: APIQueryItem(name: "api_key", value: dummyAppKey))
        if theParameters.count > 0 {
            parameters.append(contentsOf: theParameters)
        }
        return parameters
    }
}

extension Endpoint {
    
    /// the Planetary list end point
    static let planetaryList = Endpoint(key: "planetaryList")
}
