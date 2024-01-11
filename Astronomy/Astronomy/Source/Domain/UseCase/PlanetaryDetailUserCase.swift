//
//  PlanetaryDetailUserCase.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 11/01/24.
//

import Foundation

protocol PlanetaryDetailUserCaseProtocol {
    
    func fetchPlanetary() -> PlanetaryDomainModel
}

final class PlanetaryDetailUserCase: PlanetaryDetailUserCaseProtocol {
    
    /// planetary  data repository
    private var input: PlanetaryProtocol
    
    // MARK: - Instance
    
    /// create detail use case specified the detail  data
    /// - Parameter input: the detail input data
    init(input: PlanetaryProtocol) {
        self.input = input
    }
    
    ///
    /// Fetch Panetary Detail Data
    /// - Returns: A Planetary Detail data
    ///
    func fetchPlanetary() -> PlanetaryDomainModel {
        PlanetaryDetailMapper.toDomain(input)
    }
}
