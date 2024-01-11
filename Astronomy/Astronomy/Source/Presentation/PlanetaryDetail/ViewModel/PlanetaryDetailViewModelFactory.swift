//
//  PlanetaryDetailViewModelFactory.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 08/01/24.
//

import Foundation

enum PlanetaryDetailViewModelFactory {
    
    static func createViewModel(_ planetary: PlanetaryProtocol) -> PlanetaryDetailViewModel {
        let useCase = PlanetaryDetailUserCaseFactory.createUseCase(planetary)
        let viewModel = PlanetaryDetailViewModel(useCase: useCase)
        return viewModel
    }
}
