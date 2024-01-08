//
//  NetworkFactory.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

final class NetworkFactory {
   
    static func createtNetworkManager() -> NetworkManagerProtocol {
        NetworkManager(configuration: .default)
    }
}
