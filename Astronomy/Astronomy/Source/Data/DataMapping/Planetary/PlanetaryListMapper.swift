//
//  PlanetaryListMapper.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

enum PlanetaryListMapper: Mappable {
    
    typealias Input = [PlanetaryDataModel]
    typealias Output = [PlanetaryDomainModel]
    
    static func toModel(_ input: Input) -> Output {
        return input.map { PlanetaryMapper.toModel($0) }
    }
}
