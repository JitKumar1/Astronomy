//
//  PlanetaryDetailUseCase.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

protocol PlanetaryDetailUseCaseInterface {
    
    var dataRepository: PlanetaryDomainModelInterface { get set }
}
final class PlanetaryDetailUseCase: PlanetaryDetailUseCaseInterface {
    
    var dataRepository: PlanetaryDomainModelInterface
    
    init(repository: PlanetaryDomainModelInterface) {
        self.dataRepository = repository
    }
    
}
