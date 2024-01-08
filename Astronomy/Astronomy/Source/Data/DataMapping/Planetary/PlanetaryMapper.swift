//
//  PlanetaryMapper.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 08/01/24.
//

import Foundation

enum PlanetaryMapper: Mappable {
    
    typealias Input = PlanetaryDataModel
    typealias Output = PlanetaryDomainModel
    
    static func toDomain(_ input: Input) -> Output {
        PlanetaryDomainModel(title: input.title,
                             explanation: input.explanation,
                             date: input.date ~ .fullDateOnly,
                             hdMediaURL: URL(string: input.hdMediaURL ?? ""),
                             mediaURL: URL(string: input.mediaURL),
                             mediaType: input.mediaType)
    }
}
