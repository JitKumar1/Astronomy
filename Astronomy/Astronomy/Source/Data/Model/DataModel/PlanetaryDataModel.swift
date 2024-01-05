//
//  PlanetaryDataModel.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Foundation
 
struct PlanetaryDataModel: DataModel {
    
    /// A Planetary Title
    var title: String
    
    /// A Planetary Description
    var explanation: String
    
    /// The date of the APOD image to retrieve
    var date: String
    
    /// A Planetary HD Image URL String
    var hdMediaURL: String?
    
    /// A Planetary  Image  / video URL String
    var mediaURL: String
    
    /// A Planetary  Media Type
    var mediaType: MediaType
 
    enum CodingKeys: String, CodingKey {
        case title, date, explanation
        case hdMediaURL = "hdurl"
        case mediaURL = "url"
        case mediaType = "media_type"
        
    }
    
}

enum MediaType: String, DataModel, CaseIterable {
    case image = "image"
    case video = "video"
    case unknow
}

