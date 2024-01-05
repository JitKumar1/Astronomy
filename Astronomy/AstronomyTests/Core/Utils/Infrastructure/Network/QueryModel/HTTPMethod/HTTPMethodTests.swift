//
//  HTTPMethodTests.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import XCTest

final class HTTPMethodTests: AstronomyTestCase {

    ///
    /// Tests Case for `With Attributes`
    ///
    func test_HTTPMethod_WithAttribute() throws {
        let theRawMethods = HTTPMethod.makeRandomMethodTestingOnly()
        let getMethod = try XCTUnwrap(theRawMethods.first(where: {$0 == .get}))
        let postMethod = try XCTUnwrap(theRawMethods.first(where: {$0 == .post}))
        let putMethod = try XCTUnwrap(theRawMethods.first(where: {$0 == .put}))
        let deleteMethod = try XCTUnwrap(theRawMethods.first(where: {$0 == .delete}))
                
        XCTAssertEqual(getMethod.rawValue, "GET", "HTTPMethod Get method")
        XCTAssertEqual(postMethod.rawValue, "POST", "HTTPMethod POST method")
        XCTAssertEqual(putMethod.rawValue, "PUT", "HTTPMethod PUT method")
        XCTAssertEqual(deleteMethod.rawValue, "DELETE", "HTTPMethod DELETE method")
    }
    
    ///
    /// Tests Case for `With out Attributes`
    ///
    func test_HTTPMethod_WithEmpty() throws {
        let theRawMethods = HTTPMethod.makeRandomMethodEmptyTestingOnly()
        XCTAssertTrue(theRawMethods.isEmpty, "API Method List is Empty")
      
    }

}
