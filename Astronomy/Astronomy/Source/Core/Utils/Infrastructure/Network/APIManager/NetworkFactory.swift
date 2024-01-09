//
//  NetworkFactory.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

enum NetworkFactory {
    
    /// create Network manger  instance
    static var manager: NetworkManagerProtocol = {
        NetworkManager(configuration: .default)
    }()
}
