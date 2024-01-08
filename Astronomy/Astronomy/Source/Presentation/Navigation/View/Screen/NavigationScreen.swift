//
//  NavigationScreen.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import SwiftUI

struct NavigationScreen: View {
    @StateObject private var navigate = Navigation()
    
    var body: some View {
        NavigationStack(path: $navigate.path) {
            build(page: .planetaryList)
                .navigationDestination(for: Route.self) { page in
                    build(page: page)
                }
        }
        .accessibility(identifier: "RootNavigationView")
        .environment(\.navigate, navigate)
    }
    
    @ViewBuilder
    private func build(page: Route) -> some View {
        switch page {
        case .planetaryList:
            PlanetaryListScreen(viewModel: PlanetaryListViewModelFactory.createViewModel())
        case .planetaryDetail(let planetary):
            PlanetaryDetailScreen(viewModel: PlanetaryDetailViewModelFactory.createViewModel(planetary))
        }
    }
}

#Preview {
    NavigationScreen()
}
