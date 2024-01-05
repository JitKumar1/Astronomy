//
//  PlanetaryItemView.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import SDWebImageSwiftUI
import SwiftUI

struct PlanetaryItemView: View {
    
    ///
    /// the Planetary Model
    ///
    let planetary: PlanetaryDomainModel
    
    ///
    /// show loader while video url loading
    ///
    @State private var isLoading : Bool = false
    
    var body: some View {
        VStack(spacing: 6) {
            mediaLayout
                .frame(height: 155)
                .frame(maxWidth: .infinity)
                .aspectRatio(0.96, contentMode: .fill)
                .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 9, topTrailing: 9)))
            
            labelLayout
        }
        .frame(width: gridViewSize().width ,height: gridViewSize().height)
        .clipped()
        .background(
            RoundedRectangle(cornerRadius: 9,
                             style: .continuous)
            .fill(.thickMaterial)
            .shadow(radius: 4)
        )
        
    }
    
    @ViewBuilder
    private var labelLayout: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(planetary.title.replacingOccurrences(of: "\n", with: ""))
                .foregroundStyle(.primary)
                .font(.headline)
                .lineLimit(2)
                .accessibilityIdentifier("titleText")
              
            
            Text((planetary.date), style: .relative)
                .foregroundStyle(.secondary)
                .font(.body)
                .lineLimit(1)
                .padding(.bottom, 10)
                .accessibilityIdentifier("dateText")
            
        }
        .padding([.top,.horizontal], 10)
        
    }
    
    @ViewBuilder
    private var mediaLayout: some View {
        if planetary.mediaType == .video {
            PlayerView(url: planetary.mediaURL)
                .accessibilityIdentifier("videoPlayer")
            
        } else {
            WebImage(url: planetary.mediaURL)
                .placeholder(
                    Image(systemName: "photo.fill")
                        .resizable()
                )
                .resizable()
                .indicator(.activity)
                .transition(.fade)
                .accessibilityIdentifier("imageView")
               
        }
        
    }
}

//#Preview {
//    PlanetaryItemView(planetary: <#Planetary#>)
//}
