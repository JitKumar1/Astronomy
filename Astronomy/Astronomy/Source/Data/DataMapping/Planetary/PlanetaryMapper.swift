//
//  PlanetaryListMapper.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

final class PlanetaryListMapper: Mappable {
    
    func toDomain(_ input: [PlanetaryDataModel]) -> [PlanetaryDomainModel] {
        input.map { $0.toDomain()}
    }
}

extension PlanetaryDataModel {
    func toDomain() -> PlanetaryDomainModel {
        PlanetaryDomainModel(title: title,
                             explanation: explanation,
                             date: date ~ .fullDateOnly,
                             hdMediaURL: URL(string: hdMediaURL ?? ""),
                             mediaURL: URL(string: mediaURL),
                             mediaType: mediaType)
    }
}
