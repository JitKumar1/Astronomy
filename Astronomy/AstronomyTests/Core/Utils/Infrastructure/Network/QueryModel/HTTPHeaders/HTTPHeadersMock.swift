//
//  HTTPHeadersMock.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import Foundation

extension HTTPHeaders {

    ///
    /// Testing Only - Makes a random `[HTTPHeader]`
    ///
    /// - Returns: `[HTTPHeader]` representing a random  list of HTTPHeader .
    ///
    static func makeRandomHeadersTestingOnly() -> HTTPHeaders {
        return HTTPHeaders(arrayLiteral: .contentTypeJSON, .acceptJSON)
    }

    ///
    /// Testing Only - Makes a random `HTTPHeader [String: String] `
    ///
    /// - Returns: `[String: String] ` representing a random  Dictionar of HTTPHeader .
    ///
    static func makeRandomHeaderDictTestingOnly() -> [String: String] {
        let theRawHeaders = HTTPHeaders.makeRandomHeadersTestingOnly()
       return theRawHeaders.dictionary
    }
}
