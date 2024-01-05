//
//  HTTPMethodMock.swift
//  AstronomyTests
//
//  Created by Jitendra Kumar on 06/01/24.
//

import Foundation

extension HTTPMethod {
    ///
    /// Testing Only - Makes a random `[HTTPMethod]`
    ///
    /// - Returns: `[HTTPMethod]` representing a random  list of HTTPMethod .
    ///
    static func makeRandomMethodTestingOnly() -> [HTTPMethod] {
        return [.delete, .get, .post, .put]
    }
    
    ///
    /// Testing Only - Makes a random `[HTTPMethod]`
    ///
    /// - Returns: `[HTTPMethod]` representing a random Empty  list of HTTPMethod .
    ///
    static func makeRandomMethodEmptyTestingOnly() -> [HTTPMethod] {
        return []
    }
}
