//
//  MockPlanetaryListService.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation
import PromiseKit

final class MockPlanetaryListService: PlanetaryListServiceInterface {
    
    func fetchPlanetaryList() -> Promise<[PlanetaryDataModel]> {
        Bundle.decoder([PlanetaryDataModel].self, forResource: "Planetaries")
    }
}

final class MockPlanetaryListErrorService: PlanetaryListServiceInterface {
    func fetchPlanetaryList() -> Promise<[PlanetaryDataModel]> {
        Bundle.decoder([PlanetaryDataModel].self, forResource: "Planetary")
    }
}
