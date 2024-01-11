//
//  PlanetaryDomainModel.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

protocol PlanetaryProtocol {
    
    /// A Planetary Title
    var title: String { set get }
    
    /// A Planetary Description
    var explanation: String { set get }
    
    /// The date of the APOD image to retrieve
    var date: Date { set get }
    
    /// A Planetary HD Image URL
    var hdMediaURL: URL? { set get }
    
    /// A Planetary  Image  / video URL
    var mediaURL: URL? { set get }
    
    /// A Planetary  Media Type
    var mediaType: MediaType { set get }
}

struct PlanetaryDomainModel: DomainModel, PlanetaryProtocol {
    
    /// A Planetary Title
    var title: String
    
    /// A Planetary Description
    var explanation: String
    
    /// The date of the APOD image to retrieve
    var date: Date
    
    /// A Planetary HD Image URL
    var hdMediaURL: URL?
    
    /// A Planetary  Image  / video URL
    var mediaURL: URL?
    
    /// A Planetary  Media Type
    var mediaType: MediaType
}
