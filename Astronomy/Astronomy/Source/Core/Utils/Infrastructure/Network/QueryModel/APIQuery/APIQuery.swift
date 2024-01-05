//
//  APIQuery.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

///
/// Type that describes a REST API.
///
struct APIQuery: Hashable {
    
    //MARK: - Constant
    
    ///
    /// The secure  scheme subcomponent of the URL.
    ///
    static let urlScheme = "https"
    
    //MARK: Properties
    
    ///
    /// REST API host.
    ///
    let host: String
    
    ///
    /// Path to the API.
    ///
    let path: String
    
    ///
    /// The scheme subcomponent of the URL.
    ///
    var scheme: String = urlScheme
    
    
    //MARK: - Instance
    
    ///
    /// the create `APIQuery`
    /// - Parameters:
    ///   - aHost: the host name of URL
    ///   - aPath: the Request path of url
    ///   - anAdditional: the additional Path of URL
    ///
    init(host aHost: String,
         path aPath: String,
         scheme aScheme : String = urlScheme,
         additionalPath anAdditional: String = "") {
        host = aHost.trimmingCharacters(in: .whitespacesAndNewlines)
        path = (anAdditional.isEmpty ? aPath : aPath + anAdditional).trimmingCharacters(in: .whitespacesAndNewlines)
    }

    ///
    /// the create `APIQuery`
    /// - Parameters:
    ///   - endpoint: the Endpoint of URL
    ///   - anAdditional: the additional Path of URL
    ///
    init<Endpoint: APIEndpoint>(endpoint: Endpoint,
                                additionalPath anAdditional: String = "") {
        let hostType: String = endpoint.host
        let path: String = endpoint.path
        self.init(host: hostType, path: path, additionalPath: anAdditional)
    }
}

extension APIQuery {
    
    ///
    /// the obtain the URLRequest base on API Query Item
    /// - Parameter aParameters: the API Query Item
    /// - Returns: the url request
    ///
    func urlRequest(parameters aParameters: APIQueryItems) -> URLRequest? {
        guard let theUrl = url(parameters: aParameters) else { return nil }
        return URLRequest(url: theUrl)
    }
    
    ///
    /// the obtain the URL base on API Query Item
    /// - Parameter aParameters: the List of  API Query Item
    /// - Returns: the url
    ///
    func url(parameters aParameters: APIQueryItems) -> URL? {
        var theNormalizedPath = path
        var theAPIQueryItem = [APIQueryItem]()
        let theNonConsumedParameters = aParameters.filter { !$0.isAssignedToPlaceholder }
        for theParameter in theNonConsumedParameters {
            let thePlaceholder = theParameter.placeholder
            
            if theNormalizedPath.contains(thePlaceholder) {
                theNormalizedPath = theNormalizedPath.replacingOccurrences(of: thePlaceholder, with: theParameter.value)
            } else {
                theAPIQueryItem.append(theParameter)
            }
        }
        
        let theQueryItems = theAPIQueryItem.map { $0.queryItem}
        let theNormalizedQueryItems = theQueryItems.isEmpty ? nil : theQueryItems
        let aUrl = urlQuery(withHost: host, path: theNormalizedPath, queryItems: theNormalizedQueryItems)
        return aUrl
        
    }
    
    //MARK: - URLs
    
    ///
    /// Obtains a URL built from the given components.
    ///
    /// - parameter aHost: A host.
    /// - parameter aPath: A path.
    /// - parameter aQueryItemsArray: Any query items.
    ///
    /// - returns: A `URL`.
    ///
    ///
    func urlQuery(withHost aHost: String,
                  path aPath: String,
                  queryItems aQueryItemsArray: [URLQueryItem]?) -> URL? {
        var theURLComponents = URLComponents()
        theURLComponents.scheme = scheme
        theURLComponents.host = aHost
        theURLComponents.path = aPath
        theURLComponents.queryItems = aQueryItemsArray
        return theURLComponents.url
    }
    
}
