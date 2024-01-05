//
//  PlanetaryDetailViewModel.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Combine
import Foundation

final class PlanetaryDetailViewModel: ObservableObject {
    
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
    
    let useCase: PlanetaryDetailUseCaseInterface
    
    init(useCase: PlanetaryDetailUseCaseInterface) {
        self.title = useCase.dataRepository.title
        self.explanation = useCase.dataRepository.explanation
        self.date = useCase.dataRepository.date
        self.hdMediaURL = useCase.dataRepository.hdMediaURL
        self.mediaURL = useCase.dataRepository.mediaURL
        self.mediaType = useCase.dataRepository.mediaType
        self.useCase = useCase
    }
}
