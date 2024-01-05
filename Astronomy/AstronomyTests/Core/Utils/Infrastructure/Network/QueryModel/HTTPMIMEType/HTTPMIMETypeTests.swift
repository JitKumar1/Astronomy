//
//  HTTPMIMETypeTests.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import XCTest

final class HTTPMIMETypeTests: AstronomyTestCase {

   func testMimeTypeAttributeData() {
       let rawMimeType = HTTPMIMEType.json
       let minType = HTTPMIMEType(rawValue: 1 << 0)
       XCTAssertEqual(rawMimeType.value, minType.value)
    }
}
