//
//  PlanetaryDetailViewModelFactory.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 08/01/24.
//

import Foundation

final class PlanetaryDetailViewModelFactory {
  
    static func createViewModel(_ planetary: PlanetaryDomainModelInterface) -> PlanetaryDetailViewModel {
        let useCase = PlanetaryDetailUseCaseFactory.createUseCase(planetary)
        let viewModel = PlanetaryDetailViewModel(useCase: useCase)
        return viewModel
    }
}
