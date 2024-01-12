//
//  PresentationPlanetaryListMapper.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 12/01/24.
//

import Foundation

enum PresentationPlanetaryListMapper: Mappable {
    typealias Input = [PlanetaryDomainModel]
    typealias Output = [PlanetaryModel]
    static func toModel(_ input: Input) -> Output {
        input.map {PresentationPlanetaryMapper.toModel($0) }
    }
}

enum PresentationPlanetaryMapper: Mappable {
    typealias Input = PlanetaryDomainModel
    typealias Output = PlanetaryModel
    
    static func toModel(_ input: Input) -> Output {
        PlanetaryModel(title: input.title, explanation: input.explanation, date: input.date, hdMediaURL: input.hdMediaURL, mediaURL: input.mediaURL, mediaType: input.mediaType)
    }
}
