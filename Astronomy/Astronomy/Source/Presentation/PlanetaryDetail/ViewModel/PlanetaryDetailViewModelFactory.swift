//
//  PlanetaryDetailViewModelFactory.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 08/01/24.
//

import Foundation

enum PlanetaryDetailViewModelFactory {
  
    static func createViewModel(_ planetary: PlanetaryDomainModel) -> PlanetaryDetailViewModel {
        let viewModel = PlanetaryDetailViewModel(planetary)
        return viewModel
    }
}
