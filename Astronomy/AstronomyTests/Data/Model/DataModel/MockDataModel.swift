//
//  MockDataModel.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 06/01/24.
//

import Foundation

#if DEBUG
extension DataModel {
    
    //MARK: Testing Utilities

    ///
    /// Obtains a data representation of a raw API response.
    ///
    /// The data will contain UTF-8 encoded bytes of the JSON response text.
    ///
    /// - returns: A `Data` containing the response.  Will be empty if data couldn't be generated.
    ///
    func asData_TestingOnly() -> Data {
        JSON.encode(for: self) ?? Data(count: .zero)
    }
}

#endif
