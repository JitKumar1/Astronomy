//
//  PlanetaryDetailScreen.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import SDWebImageSwiftUI
import SwiftUI

struct PlanetaryDetailScreen: View {
    
    /// the detail view model
    @StateObject private var detailViewModel: PlanetaryDetailViewModel
    
    // MARK: - Instance
    
    init(viewModel: PlanetaryDetailViewModel) {
        _detailViewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 10) {
            scrollViewLayout
        }
        .navigationTitle(detailViewModel.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder @MainActor
    private var scrollViewLayout: some View {
        ScrollView(.vertical, showsIndicators: false) {
            mediaLayout
                .background(.primary)
            
            VStack(alignment: .leading, spacing: 10) {
                titleLayout
                dateLayout
                explanationLayout
            }
            .padding()
        }
        .onAppear {
            detailViewModel.fetchPlanetary()
        }
    }
    
    @ViewBuilder @MainActor
    private var mediaLayout: some View {
        if detailViewModel.mediaType == .video {
            PlayerView(url: detailViewModel.mediaURL)
                .frame(height: 250)
                .accessibilityIdentifier("videoPlayer")
            
        } else if detailViewModel.mediaType == .image {
            WebImage(url: detailViewModel.mediaURL)
                .placeholder(
                    Image(systemName: "photo.fill")
                        .resizable()
                )
                .resizable()
                .indicator(.activity)
                .transition(.fade)
                .frame(height: 250)
                .scaledToFill()
                .accessibilityIdentifier("imageView")
            
        }
        
    }
    
    @ViewBuilder @MainActor
    private var titleLayout: some View {
        Text(detailViewModel.title)
            .foregroundStyle(.primary)
            .font(.title2)
            .fontWeight(.semibold)
            .accessibilityIdentifier("titleText")
    }
    
    @ViewBuilder @MainActor
    private var dateLayout: some View {
        Text(detailViewModel.date, style: .relative)
            .foregroundStyle(.secondary)
            .font(.body)
            .fontWeight(.semibold)
            .accessibilityIdentifier("dateText")
    }
    
    @ViewBuilder @MainActor
    private var explanationLayout: some View {
        Text(detailViewModel.explanation)
            .foregroundStyle(.primary)
            .font(.body)
            .accessibilityIdentifier("explanationText")
    }
}
