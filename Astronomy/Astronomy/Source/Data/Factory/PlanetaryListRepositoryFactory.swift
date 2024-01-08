//
//  PlanetaryListDataProviderFactory.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

enum PlanetaryListRepositoryFactory {
    
    static func createRepository() -> PlanetaryListRepositoryProtocol {
        PlanetaryListRepository(service: createService())
    }
    
    static func createService() -> PlanetaryListServiceProtocol {
        if UITestingHelper.isTestingOnly {
            return MockPlanetaryListService()
        } else {
            let sessionManager = NetworkFactory.createtNetworkManager()
            let startDate = Date.today.date(daysFromToday:30) ~ .fullDateOnly
            let endDate =  Date.today.date(daysFromToday:1) ~ .fullDateOnly
            let request = PlanetaryListRequest(startDate: startDate, endDate: endDate, isThumb: true)
            return PlanetaryListService(reqeust: request, sessionManager)
        }
    }
}
