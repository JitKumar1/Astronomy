//
//  NavigationTests.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import XCTest

final class NavigationTests: AstronomyTestCase {

    func testNavigation() {
        let theRawDomainModel = PlanetaryDomainModel.mockEmptyData()
        let planetary = PresentationPlanetaryMapper.toModel(theRawDomainModel)
        let navigation = Navigation()
        navigation.push(.planetaryList)
        navigation.push(.planetaryDetail(planetary))
       
        XCTAssertNotEqual(navigation.path.count, .zero, "navigation Path")
        
        navigation.pop()
        navigation.popToRoot()
    }
}
