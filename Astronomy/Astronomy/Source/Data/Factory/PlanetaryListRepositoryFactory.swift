//
//  PlanetaryListDataProviderFactory.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

enum PlanetaryListRepositoryFactory {
    
    static func createRepository() -> PlanetaryListRepositoryProtocol {
        let service = PlanetaryListServiceFactory.createService()
        return PlanetaryListRepository(service: service)
    }
}
