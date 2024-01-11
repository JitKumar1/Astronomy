//
//  PlanetaryDetailViewModel.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Combine
import Foundation

final class PlanetaryDetailViewModel: ObservableObject {
    
    // MARK: - Properties
    
    /// the planetary domain model
    @Published private var planetary: PlanetaryDomainModel?
    
    /// the planetary detail use case
    private var useCase: PlanetaryDetailUserCaseProtocol
    
    //MARK: - Instance
    
    ///
    /// Create planetary detail ViewModel specified the  planetary detail use case
    /// - Parameter useCase: the planetary detail use case
    ///
    init(useCase: PlanetaryDetailUserCaseProtocol) {
        self.useCase = useCase
    }
    
    ///
    /// Fetch Panetary Detail Data
    /// - Returns: A Planetary Detail data
    ///
    func fetchPlanetary() {
       planetary = useCase.fetchPlanetary()
    }
}

extension PlanetaryDetailViewModel {
    
    /// A Planetary Title
    var title: String {
        planetary?.title ?? ""
    }
    
    /// A Planetary Description
    var explanation: String {
        planetary?.explanation ?? ""
    }
    
    /// The date of the APOD image to retrieve
    var date: Date {
        planetary?.date ?? .today
    }
    
    /// A Planetary HD Image URL
    var hdMediaURL: URL? {
        planetary?.hdMediaURL
    }
    
    /// A Planetary  Image  / video URL
    var mediaURL: URL? {
        planetary?.mediaURL
    }
    
    /// A Planetary  Media Type
    var mediaType: MediaType {
        planetary?.mediaType ?? .unknow
    }
    
}
