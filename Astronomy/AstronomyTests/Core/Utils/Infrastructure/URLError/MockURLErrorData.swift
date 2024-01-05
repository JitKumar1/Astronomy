//
//  MockURLErrorData.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import Foundation

#if  DEBUG
extension URLError {
    
   static var mockNetworkIntrrupedErrorCodes : [Int] {
        return [URLError.Code.cannotConnectToHost.rawValue,
                URLError.Code.cannotFindHost.rawValue,
                URLError.Code.networkConnectionLost.rawValue,
                URLError.Code.notConnectedToInternet.rawValue,
                URLError.Code.dataNotAllowed.rawValue,
                URLError.Code.internationalRoamingOff.rawValue]
    }
    
    static var mockOtherErrorCodes : [Int] {
        return [URLError.Code.badURL.rawValue,
                URLError.Code.badServerResponse.rawValue,
        ]
    }
    
}

#endif
