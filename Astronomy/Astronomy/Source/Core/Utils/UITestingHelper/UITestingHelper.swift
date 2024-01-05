//
//  UITestingHelper.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

enum UITestingHelper {
    
    static var isTestingOnly: Bool {
        guard  let environment = ProcessInfo.processInfo.environment["Environment"], environment == "Testing" else {
            return false
        }
        return true
    }
}
