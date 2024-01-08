//
//  PlanetaryDetailUseCaseFactory.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

final class PlanetaryDetailUseCaseFactory {
    
    static func createUseCase(_ planetary: PlanetaryDomainModelInterface) -> PlanetaryDetailUseCaseInterface {
        PlanetaryDetailUseCase(repository: planetary)
    }
}
