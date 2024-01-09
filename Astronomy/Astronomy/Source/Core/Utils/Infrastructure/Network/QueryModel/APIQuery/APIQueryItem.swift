//
//  APIQueryItem.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

typealias APIQueryItems = [APIQueryItem]

struct APIQueryItem: Hashable {
    
    //MARK: -  Properties
    
    ///
    /// Parameter's name.
    ///
    let name : String
    
    ///
    /// Parameter's original value which could be a host manager placeholder.
    ///
    private let internalValue : String
    
    ///
    /// Parameter's value.
    ///
    var value : String {
        internalValue
    }
    
    ///
    /// Whether or not the parameter has been assigned to a placeholder.
    ///
    var isPlaceholder : Bool
    
    ///
    /// Obtains a string representing a placeholder for this `APIQueryItem`.
    ///
    var placeholder : String {
        
        "{\(name)}"
    }
    
    ///
    /// Obtains a query item for this `APIQueryItem`.
    ///
    var queryItem : URLQueryItem {
        
        URLQueryItem(name: name, value: value)
    }
    
    //MARK: - Instance
    
    ///
    /// Initializes an `APIQueryItem`.
    ///
    /// - parameter aName: Parameter's name.
    /// - parameter aValue: Parameter's value.
    ///
    init(name aName: String,
         value aValue: String,
         isPlaceholder isAssigned : Bool = false) {
        name = aName
        internalValue = aValue
        isPlaceholder = isAssigned
    }
}
