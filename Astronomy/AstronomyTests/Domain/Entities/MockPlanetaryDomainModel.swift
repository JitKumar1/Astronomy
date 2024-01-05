//
//  MockPlanetaryDomainModel.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 06/01/24.
//

import Foundation

extension PlanetaryDomainModel {
    
    ///
    /// Testing Only - Makes a random Planetary with Data.
    ///
    /// - returns: A `Planetary` representing a random model.
    ///
    static func mockData(_ dataModel: PlanetaryDataModel) -> PlanetaryDomainModel {
        dataModel.toDomain()
    }
    
    ///
    /// Testing Only - Makes a random Planetary with Data.
    ///
    /// - returns: A `Planetary` representing a random model.
    ///
    static func mockData(mediaType: MediaType) -> PlanetaryDomainModel {
        PlanetaryDataModel.mockData(mediaType: mediaType).toDomain()
    }
    
    ///
    /// Testing Only - Makes a random Planetary with Emty Data.
    ///
    /// - returns: A `Planetary` representing a random model.
    ///
    static func mockEmptyData() -> PlanetaryDomainModel {
        PlanetaryDataModel.mockEmptyData().toDomain()
    }
}
