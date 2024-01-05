//
//  NavigationTests.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import XCTest

final class NavigationTests: AstronomyTestCase {

    func testNavigation() {
        let navigation = Navigation()
        navigation.push(.planetaryList)
        navigation.push(.planetaryDetail(.mockEmptyData()))
       
        XCTAssertNotEqual(navigation.path.count, .zero, "navigation Path")
        
        navigation.pop()
        navigation.popToRoot()
    }
}
