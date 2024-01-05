//
//  ServiceRepository.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation
import PromiseKit

protocol PlanetaryListServiceInterface {
    
    ///
    /// Fetch Panetary List Data
    /// - Returns: A List of Planetary If request sucess other wise throws exception error
    ///
    func fetchPlanetaryList() -> Promise<[PlanetaryDataModel]>
}
