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
    
    /// A Planetary Title
    @Published var title: String
    
    /// A Planetary Description
    @Published  var explanation: String
    
    /// The date of the APOD image to retrieve
    @Published  var date: Date
    
    /// A Planetary HD Image URL
    @Published  var hdMediaURL: URL?
    
    /// A Planetary  Image  / video URL
    @Published  var mediaURL: URL?
    
    /// A Planetary  Media Type
    @Published  var mediaType: MediaType
    
    /// A Planetary  Detail User  Case
    let useCase: PlanetaryDetailUseCaseInterface
    
    //MARK: - Instance
    
    ///
    /// Create Planetary Detail View Model specified the Planetary Detail User Case
    /// - Parameter useCase:  the Planetary Detail User Case
    ///
    init(useCase: PlanetaryDetailUseCaseInterface) {
        self.useCase = useCase
        self.title = useCase.repository.title
        self.explanation = useCase.repository.explanation
        self.date = useCase.repository.date
        self.hdMediaURL = useCase.repository.hdMediaURL
        self.mediaURL = useCase.repository.mediaURL
        self.mediaType = useCase.repository.mediaType
    }
}
