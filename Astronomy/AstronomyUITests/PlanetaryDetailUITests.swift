//
//  PlanetaryDetailUITests.swift
//  AstronomyUITests
//
//  Created by Jitendra Kumar on 05/01/24.
//

import XCTest

final class PlanetaryDetailUITests: XCTestCase {

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
    
    func testPlanetaryDetailElements() throws {
        
        let grid = app.otherElements["planetaryGridView"]
        XCTAssertTrue(grid.waitForExistence(timeout: 5), "The planetary lazygrid should be visible")
        
        let predicate = NSPredicate(format: "identifier CONTAINS 'PlanetaryItem_'")
        let gridItems = grid.buttons.containing(predicate)
        gridItems.firstMatch.tap()
        
        let imageView = app.images["imageView"]
        let titleText = app.staticTexts["titleText"]
        let dateText = app.staticTexts["dateText"]
        let explanationText = app.staticTexts["explanationText"]
        
        
        XCTAssert(imageView.exists, "imageView")
        XCTAssert(titleText.exists, "titleText")
        XCTAssert(dateText.exists, "dateText")
        XCTAssert(explanationText.exists, "explanationText")
    }
    

}
