//
//  PlanetaryListUseCase.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation
import PromiseKit

protocol PlanetaryListUseCaseInterface {
    func fetchPlanetaryList() -> Promise<[PlanetaryDomainModel]>
}

final class PlanetaryListUseCase: PlanetaryListUseCaseInterface {
    
    var repository: PlanetaryListInterface
    
    init(repository: PlanetaryListInterface) {
        self.repository = repository
    }
    
    func fetchPlanetaryList() -> Promise<[PlanetaryDomainModel]> {
        repository.fetchPlanetaryList()
    }
}
