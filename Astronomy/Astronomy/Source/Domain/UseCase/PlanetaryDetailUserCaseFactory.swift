//
//  PlanetaryDetailUserCaseFactory.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 11/01/24.
//

import Foundation

enum PlanetaryDetailUserCaseFactory {

    static func createUseCase(_ input: PlanetaryProtocol) -> PlanetaryDetailUserCaseProtocol {
        PlanetaryDetailUserCase(input: input)
    }
}
