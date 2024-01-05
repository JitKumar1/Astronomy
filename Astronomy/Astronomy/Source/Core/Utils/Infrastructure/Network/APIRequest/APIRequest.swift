//
//  APIRequest.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

protocol APIRequest {
 
    ///
    /// The request's HTTP Method
    ///
    var method: HTTPMethod { get }
    
    ///
    /// The request's API Endpoint.
    ///
    var endpoint : Endpoint { get }

    ///
    /// the Request parameters: [APIQueryItems]
    ///
    var parameters : APIQueryItems { get }
    
    ///
    /// The request's content Type `default` `JSON`
    ///
    var mimeType : HTTPMIMEType { get }
    
    ///
    /// The request's additional Header
    ///
    var headers: HTTPHeaders { get }
}

extension APIRequest {

    ///
    /// The request's HTTP Method `default = GET`
    ///
    var method: HTTPMethod {
        .get
    }
    
    ///
    /// the default mimetype `HTTPMIMEType = .json`
    ///
    var mimeType : HTTPMIMEType {
        .json
    }
    
    ///
    /// the obtains request  Headers  `HTTPHeaders = default  +  additional headers`
    ///
    var headers: HTTPHeaders {
         HTTPHeaders(arrayLiteral: .accept(mimeType: mimeType), .contentType(mimeType))
    }
    
    ///
    /// the Request parameters: [APIQueryItems] `noQueryParameters`
    ///
    var parameters : APIQueryItems {
        .noQueryItems
    }
}

extension APIRequest {
    
    var apiQuery: APIQuery {
        APIQuery(endpoint: endpoint)
    }
    
    var urlRequest: URLRequest? {
        var theRequest =  apiQuery.urlRequest(parameters: parameters)
        theRequest?.allHTTPHeaderFields = headers.dictionary
        theRequest?.httpMethod = method.rawValue
        return theRequest
    }
}
