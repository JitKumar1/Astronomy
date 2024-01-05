//
//  NavigatorTests.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import XCTest

final class NavigatorTests: AstronomyTestCase {

    func testNavigationRouterPage() {
        XCTAssertEqual(Route.planetaryList.id, "planetaryList", "planetaryList Screen Route Idenfier")
        XCTAssertEqual(Route.planetaryDetail(PlanetaryDomainModel.mockData(mediaType: .image)).id, "planetaryDetail", "planetaryList Screen Route Idenfier")
    }

}
