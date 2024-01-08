//
//  PlanetaryListServiceFactory.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 08/01/24.
//

import Foundation

enum PlanetaryListServiceFactory {
    
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
