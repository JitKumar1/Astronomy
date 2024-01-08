//
//  PlanetaryDetailViewModel.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Combine
import Foundation

final class PlanetaryDetailViewModel: ObservableObject {
    
    // MARK: - Propeties
    
    /// the planetary domain model
    @Published var planetary: PlanetaryDomainModel
    
    //MARK: - Instance
    
    ///
    /// Create Planetary Detail View Model specified the Planetary Domain Model
    /// - Parameter model:  the Planetary domain model
    ///
    init(_ model: PlanetaryDomainModel) {
        planetary = model
    }
}

extension PlanetaryDetailViewModel {
    
    /// A Planetary Title
    var title: String {
        planetary.title
    }
    
    /// A Planetary Description
    var explanation: String {
        planetary.explanation
    }
    
    /// The date of the APOD image to retrieve
    var date: Date {
        planetary.date
    }
    
    /// A Planetary HD Image URL
    var hdMediaURL: URL? {
        planetary.hdMediaURL
    }
    
    /// A Planetary  Image  / video URL
    var mediaURL: URL? {
        planetary.mediaURL
    }
    
    /// A Planetary  Media Type
    var mediaType: MediaType {
        planetary.mediaType
    }
    
}
