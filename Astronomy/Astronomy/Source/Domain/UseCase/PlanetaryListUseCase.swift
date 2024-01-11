//
//  PlanetaryListUseCase.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation
import PromiseKit

protocol PlanetaryListUseCaseProtocol {
    func fetchPlanetaryList() -> Promise<[PlanetaryDomainModel]>
}

final class PlanetaryListUseCase: PlanetaryListUseCaseProtocol {
    
    /// planetary list data repository
   private(set) var repository: PlanetaryListRepositoryProtocol
    
    //MARK: - Instance
    
    ///
    /// Create Planetary list user case specified the planetary list data repository
    /// - Parameter repository:  the planetary list data repository
    ///
    init(repository: PlanetaryListRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchPlanetaryList() -> Promise<[PlanetaryDomainModel]> {
        repository.fetchPlanetaryList()
    }
}
