//
//  PlanetaryDetailMapper.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 11/01/24.
//

import Foundation

enum PlanetaryDetailMapper: Mappable {

    typealias Input = PlanetaryProtocol
    typealias Output = PlanetaryDomainModel
    
    static func toDomain(_ input: Input) -> PlanetaryDomainModel {
        PlanetaryDomainModel(title: input.title, explanation: input.explanation, date: input.date, hdMediaURL: input.hdMediaURL, mediaURL: input.mediaURL, mediaType: input.mediaType)
    }
}
