//
//  PlanetaryListRepository.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation
import PromiseKit

final class PlanetaryListRepository: PlanetaryListRepositoryProtocol {
    
    /// the Planetary List Service
    private(set) var service: PlanetaryListServiceProtocol
    
    ///
    /// Create Planetary List Data Provider Service specified the Planetary List Service
    /// - Parameter service: planetary List Service
    ///
    init(service: PlanetaryListServiceProtocol) {
        self.service = service
    }
    
    ///
    /// Fetch Panetary List Data
    /// - Returns: A List of Planetary If request sucess other wise throws exception error
    ///
    func fetchPlanetaryList() -> Promise<[PlanetaryDomainModel]> {
        return service
            .fetchPlanetaryList()
            .map {PlanetaryListMapper.toModel($0)}
    }
    
}
