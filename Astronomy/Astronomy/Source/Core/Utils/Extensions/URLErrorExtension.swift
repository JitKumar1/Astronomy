//
//  URLErrorExtension.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

extension URLError {
    
    ///
    /// Create URL Error with error code and message
    /// - Parameters:
    ///   - code: the URL Error Code Int Value
    ///   - message:  speficify the url error message
    ///
    init(code: Int, message: String = "") {
        let theMessage = URLError.networkInterrupt(code) ? Constants.noNetworkMessage : message.isEmpty ? HTTPURLResponse.localizedString(forStatusCode: code) : message
        self.init( Code(rawValue: code), userInfo: [NSLocalizedDescriptionKey: theMessage])
    }
    
    ///
    /// Check Network Interrupted speficied the error code `cannotConnectToHost`, `cannotFindHost`, `networkConnectionLost`, `notConnectedToInternet`, `dataNotAllowed`, `internationalRoamingOff`
    /// - Parameter errorCode: the server error code
    /// - Returns: Bool value return true while network interrupted otherwise false
    ///
    static func networkInterrupt(_ errorCode: Int) -> Bool {
        let code = URLError.Code(rawValue: errorCode)
        switch code {
        case .cannotConnectToHost,
                .cannotFindHost,
                .networkConnectionLost,
                .notConnectedToInternet,
                .dataNotAllowed,
                .internationalRoamingOff:
            return true
        default:
            return false
        }
    }
}
