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
    
    /// planetary list data repository
    var repository: PlanetaryListInterface
    
    //MARK: - Instance
    
    ///
    /// Create Planetary list user case specified the planetary list data repository
    /// - Parameter repository:  the planetary list data repository
    ///
    init(repository: PlanetaryListInterface) {
        self.repository = repository
    }
    
    func fetchPlanetaryList() -> Promise<[PlanetaryDomainModel]> {
        repository.fetchPlanetaryList()
    }
}
