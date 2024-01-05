//
//  ConstantsTests.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import XCTest

final class ConstantsTests: AstronomyTestCase {
    
    func testConstants() {
        XCTAssertEqual(Constants.noNetworkTitle, "No Internet Connection")
        XCTAssertEqual(Constants.serverErrorTitle, "Server Error")
        XCTAssertEqual(Constants.noNetworkMessage, "We are having difficulties connecting you to the internet. Please check your network connection and try again")
        
    }
    
}
