//
//  PlanetaryListUITests.swift
//  AstronomyUITests
//
//  Created by Jitendra Kumar on 05/01/24.
//

import XCTest

final class PlanetaryListUITests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUp() {
         app = XCUIApplication()
        app.launchEnvironment = ["Environment": "Testing"]
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func testPlanetaryListUIElements() throws {
        // UI tests must launch the application that they test.
        let grid = app.otherElements["planetaryGridView"]
        XCTAssertTrue(grid.waitForExistence(timeout: 5), "The planetary lazygrid should be visible")
        
        let predicate = NSPredicate(format: "identifier CONTAINS 'PlanetaryItem_'")
        let gridItems = grid.buttons.containing(predicate)
        XCTAssertEqual(gridItems.count, 2, "There should be 2 items on the screen")
        XCTAssertTrue(gridItems.staticTexts["Pick a Galaxy, Any Galaxy"].exists)
        XCTAssertTrue(gridItems.staticTexts["Our Story in One Minute"].exists)
    }
    
}
