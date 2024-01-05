//
//  URLErrorTests.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import XCTest

final class URLErrorTests: AstronomyTestCase {

    func testNetworkIntrrupedError() throws {
        let theRawErrorCode  = try XCTUnwrap(URLError.mockNetworkIntrrupedErrorCodes.randomElement())
        let isInterrupt = URLError.networkInterrupt(theRawErrorCode)
        let error = URLError(code: theRawErrorCode)
        XCTAssertTrue(isInterrupt, "Network Interrupt")
        XCTAssertNotNil(error, "error")
        XCTAssertEqual(error.localizedDescription, Constants.noNetworkMessage, "Error message")
    }
    
    func testServerError() throws {
        let theRawErrorCode  = try XCTUnwrap(URLError.mockOtherErrorCodes.randomElement())
        let isInterrupt = URLError.networkInterrupt(theRawErrorCode)
        let error = URLError(code: theRawErrorCode)
        XCTAssertFalse(isInterrupt, "Network Interrupt")
        XCTAssertNotNil(error, "error")
        XCTAssertNotEqual(error.localizedDescription, Constants.noNetworkMessage, "Error message")
    }
    
    func testErrorConstants() {
        XCTAssertEqual(Constants.noNetworkTitle, "No Internet Connection")
        XCTAssertEqual(Constants.serverErrorTitle, "Server Error")
        XCTAssertEqual(Constants.noNetworkMessage, "We are having difficulties connecting you to the internet. Please check your network connection and try again")
        
    }

}
