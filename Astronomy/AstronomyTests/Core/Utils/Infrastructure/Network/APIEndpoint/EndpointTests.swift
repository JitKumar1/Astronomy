//
//  EndpointTests.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import XCTest

final class EndpointTests: AstronomyTestCase {

    func testEndPointPathSuccess() {
       let rawDictonary = Bundle.main.plist(forResource: "Endpoints", ofType: "plist")
        XCTAssertTrue(rawDictonary.count > .zero, "Get API Endpoint objects")
        let rawEndpont  = Bundle.main.path(key: "planetaryList")
        let planetaryEndpoint = Endpoint(key: "planetaryList")
        XCTAssertEqual("/\(rawEndpont)", planetaryEndpoint.path, "planetary List Endpoint path")
        XCTAssertEqual(planetaryEndpoint.host,  "api.nasa.gov", "planetary List Endpoint host")
    }

    func testEndPointPathError() {
        let rawDictonary = Bundle.main.plist(forResource: "Endpoint", ofType: "plist")
        XCTAssertEqual(rawDictonary.count, .zero , "Get API Endpoint objects not found")
        let rawEndpont  =  Bundle.main.path(key: "planetaryList", forResource: "Endpoint")
        XCTAssertTrue(rawEndpont.isEmpty, "Invalid Endpoint")
    }

}
