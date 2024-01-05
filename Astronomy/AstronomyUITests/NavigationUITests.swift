//
//  NavigationUITests.swift
//  AstronomyUITests
//
//  Created by Jitendra Kumar on 05/01/24.
//

import XCTest

final class NavigationUITests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app = XCUIApplication()
        app.launchEnvironment = ["Environment": "Testing"]
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
    }

    func testNavigationUI() throws {
        // UI tests must launch the application that they test.
        let navigationView = app.otherElements["RootNavigationView"]
        XCTAssert(navigationView.exists, "RootNavigationView Exist")
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
