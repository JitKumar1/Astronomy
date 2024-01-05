//
//  HTTPMIMEType.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

struct HTTPMIMEType: OptionSet {
    
     let rawValue: Int
    
     init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

extension HTTPMIMEType {
    
    /// Indicates the JSON MIME type.
    static let json = HTTPMIMEType(rawValue: 1 << 0)
  
    
    
    /// The format required for the HTTP header Mime type value
    var value: String {
        var mimes:[String] = []
        
        if contains(.json) {
            mimes.append("application/json")
        }
       
        return mimes.joined(separator: "; ")
    }
}
