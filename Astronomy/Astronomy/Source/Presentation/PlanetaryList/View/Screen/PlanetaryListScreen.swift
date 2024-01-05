//
//  PlanetaryListScreen.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import SwiftUI

struct PlanetaryListScreen: View {
    
    // MARK: - Properties
    
    /// Planetary List ViewModel
    @StateObject private var viewModel: PlanetaryListViewModel
    
    /// Gloabel Navigation Router
    @Environment(\.navigate) private var navigate: Navigation
    
    /// the network monitoring  model
    // @StateObject private var networkMonitor = NetworkMonitor.shared
    
    // MARK: - Instance
    
    init(useCase: PlanetaryListUseCaseInterface) {
        _viewModel = StateObject(wrappedValue: PlanetaryListViewModel(useCase: PlanetaryListUseCaseFactory.createUseCase()))
    }
    
    var body: some View {
        VStack {
            contentLayout
                .task {
                    if viewModel.isEmpty {
                        viewModel.fetchPlanetaryList()
                    }
                }
        }
        .navigationTitle("Planetary")
    }
    
    @ViewBuilder @MainActor
    private var contentLayout: some View {
        listLayout
            .padding(.horizontal, 10)
            .overlay(alignment: .center) {
                if viewModel.isLoading {
                    ProgressView()
                }
                else if !viewModel.errorMessage.isEmpty {
                    UnavailableView(for: viewModel.errorMessage)
                }
            }
    }
    
    @ViewBuilder @MainActor
    private var listLayout: some View {
        let columns = Array(repeating: GridItem(.flexible()), count: UIDevice.current.userInterfaceIdiom == .pad ? 4 : 2)
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(Array(viewModel.planetaries.enumerated()), id: \.1.title) { (index, item) in
                    Button {
                        navigate.push(.planetaryDetail(item))
                    } label: {
                        PlanetaryItemView(planetary: item)
                            .accessibilityIdentifier("PlanetaryItem_\(index)")
                    }
                    .tint(.primary)
                }
                
            }
            .accessibilityIdentifier("planetaryGridView")
            
        }
    }
    
}

#Preview {
    PlanetaryListScreen(useCase: PlanetaryListUseCaseFactory.createUseCase())
}
