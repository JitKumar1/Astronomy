//
//  PlanetaryListUseCaseFactory.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

enum PlanetaryListUseCaseFactory {
    
    static func createUseCase() -> PlanetaryListUseCaseInterface {
        let repo = PlanetaryListRepositoryFactory.createRepository()
        return PlanetaryListUseCase(repository: repo)
    }
}
