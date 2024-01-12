//
//  PlanetaryModel.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 12/01/24.
//

import Foundation

protocol PresentationModel: Hashable { }

struct PlanetaryModel: PresentationModel {
    
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
