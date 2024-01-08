//
//  PlanetaryListService.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation
import PromiseKit

final class PlanetaryListService: PlanetaryListServiceProtocol {
    
    //MARK: - Properties
    
    /// the nework session manager
    var manager: NetworkManagerProtocol
    
    /// the service Reqeust
    var request: APIRequest
    
    /// 
    /// Create Planetary List Service
    /// - Parameters:
    ///   - reqeust: The planetary list Reqeust
    ///   - manager:  the Planetary list  service Manager
    ///
    init(reqeust: APIRequest, _ manager: NetworkManagerProtocol) {
        self.manager = manager
        self.request = reqeust
    }
    
    func fetchPlanetaryList() -> Promise<[PlanetaryDataModel]> {
        return manager.perform(request: request, [PlanetaryDataModel].self)
    }
    
}
