//
//  PlanetaryListRepository.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation
import PromiseKit

final class PlanetaryListRepository: PlanetaryListInterface {
    
    /// the Planetary List Service
    var service: PlanetaryListServiceInterface
    
    ///
    /// Create Planetary List Data Provider Service specified the Planetary List Service
    /// - Parameter service: planetary List Service
    ///
    init(service: PlanetaryListServiceInterface) {
        self.service = service
    }
    
    ///
    /// Fetch Panetary List Data
    /// - Returns: A List of Planetary If request sucess other wise throws exception error
    ///
    func fetchPlanetaryList() -> Promise<[PlanetaryDomainModel]> {
        let mapper = PlanetaryListMapper()
        return service
            .fetchPlanetaryList()
            .map {mapper.toDomain($0)}
    }
    
}
