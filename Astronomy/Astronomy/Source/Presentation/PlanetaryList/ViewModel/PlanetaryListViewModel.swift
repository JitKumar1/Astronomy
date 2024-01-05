//
//  PlanetaryListViewModel.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import Combine
import Foundation

@MainActor
final class PlanetaryListViewModel: ObservableObject {
    
    
    //MARK: - Properties
    
   @Published var isLoading: Bool = false
    
    /// the array of Planetary Item
    @Published var planetaries: [PlanetaryDomainModel] = []
    
    /// the Planetary Resonse error Message
    @Published var errorMessage: String = ""
    
    /// the Planetary list Data User case
    let useCase: PlanetaryListUseCaseInterface
    
    
    // MARK: - Instance
    
    ///
    /// Create  a Planetary View Model specified the Planetary List Use Case
    /// - Parameter useCase: the Planetary Data Use case
    ///
    init(useCase: PlanetaryListUseCaseInterface) {
        self.useCase = useCase
    }
    
}

extension PlanetaryListViewModel {
    
    /// has Planetary list Empty data
    var isEmpty: Bool {
        planetaries.isEmpty
    }
    
    /// Fetch the Planetary List Item
    func fetchPlanetaryList() {
        isLoading = true
        useCase
            .fetchPlanetaryList()
            .done{ [weak self] list in
                self?.planetaries = list
                self?.errorMessage = ""
                
            }.catch { [weak self] error in
                self?.errorMessage = error.localizedDescription
                
            } .finally {  [weak self] in
                self?.isLoading = false
            }
    }
}

