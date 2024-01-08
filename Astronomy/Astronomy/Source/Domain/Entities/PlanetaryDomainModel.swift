//
//  PlanetaryDomainModel.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation

protocol PlanetaryDomainModelInterface {
    
    /// A Planetary Title
    var title: String { get set }
    
    /// A Planetary Description
    var explanation: String { get set }
    
    /// The date of the APOD image to retrieve
    var date: Date { get set }
    
    /// A Planetary HD Image URL
    var hdMediaURL: URL? { get set }
    
    /// A Planetary  Image  / video URL
    var mediaURL: URL? { get set }
    
    /// A Planetary  Media Type
    var mediaType: MediaType { get set }
}

struct PlanetaryDomainModel: DomainModel, PlanetaryDomainModelInterface {
    
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
