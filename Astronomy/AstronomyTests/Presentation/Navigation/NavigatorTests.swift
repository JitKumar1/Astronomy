//
//  NavigatorTests.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import XCTest

final class NavigatorTests: AstronomyTestCase {

    func testNavigationRouterPage() {
        let theRawDomainModel = PlanetaryDomainModel.mockData(mediaType: .image)
        let planetary = PresentationPlanetaryMapper.toModel(theRawDomainModel)
        XCTAssertEqual(Route.planetaryList.id, "planetaryList", "planetaryList Screen Route Idenfier")
        XCTAssertEqual(Route.planetaryDetail(planetary).id, "planetaryDetail", "planetaryList Screen Route Idenfier")
    }

}
