//
//  MockPlanetaryDataModel.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 06/01/24.
//

import Foundation

extension PlanetaryDataModel {
    ///
    /// Testing Only - Makes a random Planetary.
    ///
    /// - returns: A `Planetary` representing a random model.
    ///
    static func makeMockData(title: String, explanation: String, date: String, hdMediaURL: String?, mediaURL: String, mediaType: MediaType) -> PlanetaryDataModel {
        PlanetaryDataModel(title: title, explanation: explanation, date: date, hdMediaURL: hdMediaURL, mediaURL: mediaURL, mediaType: mediaType)
    }
    
    ///
    /// Testing Only - Makes a random Planetary with Data.
    ///
    /// - returns: A `Planetary` representing a random model.
    ///
    static func mockData(mediaType: MediaType = .image) -> PlanetaryDataModel {
        let title =  "Moon Mare and Montes"
        let explanation = "Tomorrow's picture: Cosmic Cloud  < | Archive | Index | Search | Calendar | Glossary | Education | About APOD | >  Authors & editors: Robert Nemiroff (MTU) & Jerry Bonnell (USRA) NASA Technical Rep.: Jay Norris. Specific rights apply. A service of: LHEA at NASA/GSFC & Michigan Tech. U."
        let date = "2000-12-28"
        
        let mediaURL = mediaType == .video ?  "https://www.youtube.com/embed/ZSt9tm3RoUU?rel=0" :  "https://apod.nasa.gov/apod/image/0012/moon3rd_armstrong.jpg"
        let hdMediaURL =  mediaType == .video ? nil : "https://apod.nasa.gov/apod/image/0012/moon3rd_armstrong_big.jpg"
        return makeMockData(title: title, explanation: explanation, date: date, hdMediaURL: hdMediaURL, mediaURL: mediaURL, mediaType: mediaType)
    }
    
    ///
    /// Testing Only - Makes a random Planetary with Emty Data.
    ///
    /// - returns: A `Planetary` representing a random model.
    ///
    static func mockEmptyData() -> PlanetaryDataModel {
        return makeMockData(title: "", explanation: "", date: "", hdMediaURL: nil, mediaURL: "", mediaType: .unknow)
    }
}
