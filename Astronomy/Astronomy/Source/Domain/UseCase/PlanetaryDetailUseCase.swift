//
//  PlanetaryDetailUseCase.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

protocol PlanetaryDetailUseCaseInterface {
    
    var repository: PlanetaryDomainModelInterface { get set }
}

final class PlanetaryDetailUseCase: PlanetaryDetailUseCaseInterface {
    
    var repository: PlanetaryDomainModelInterface
    
    init(repository: PlanetaryDomainModelInterface) {
        self.repository = repository
    }
    
}
