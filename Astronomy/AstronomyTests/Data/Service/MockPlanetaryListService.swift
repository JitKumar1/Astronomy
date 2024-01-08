//
//  MockPlanetaryListService.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation
import PromiseKit

final class MockPlanetaryListService: PlanetaryListServiceProtocol {
    
    func fetchPlanetaryList() -> Promise<[PlanetaryDataModel]> {
        Bundle.decoder([PlanetaryDataModel].self, forResource: "Planetaries")
    }
}

final class MockPlanetaryListErrorService: PlanetaryListServiceProtocol {
    func fetchPlanetaryList() -> Promise<[PlanetaryDataModel]> {
        Bundle.decoder([PlanetaryDataModel].self, forResource: "Planetary")
    }
}
