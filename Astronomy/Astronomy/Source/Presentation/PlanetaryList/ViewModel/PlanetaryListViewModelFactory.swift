//
//  PlanetaryListViewModelFactory.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 08/01/24.
//

import Foundation

final class PlanetaryListViewModelFactory {
    
    @MainActor
    static func createViewModel() -> PlanetaryListViewModel {
        let useCase = PlanetaryListUseCaseFactory.createUseCase()
        let viewModel =  PlanetaryListViewModel(useCase: useCase)
        return viewModel
    }
}
