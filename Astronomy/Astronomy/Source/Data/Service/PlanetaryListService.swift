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
    ///   - serviceManager:  the Planetary list  service Manager
    ///   - reqeust: The planetary list Reqeust
    ///
    init(serviceManager: NetworkManagerProtocol, reqeust: APIRequest) {
        self.manager = serviceManager
        self.request = reqeust
    }
    
    func fetchPlanetaryList() -> Promise<[PlanetaryDataModel]> {
        return manager.perform(request: request, [PlanetaryDataModel].self)
    }
    
}
