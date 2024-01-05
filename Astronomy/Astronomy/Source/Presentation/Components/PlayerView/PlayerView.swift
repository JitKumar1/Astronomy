//
//  PlayerView.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import SwiftUI

struct PlayerView: View {
    var url: URL?
    @State private var isLoading: Bool = true
    var body: some View {
        ZStack {
            SwiftUIWebView(url: url, isScrollEnabled: false, isLoading: $isLoading)
                .edgesIgnoringSafeArea(.all)
            if isLoading {
                ProgressView()
            }
        }
    }
}

#Preview {
    PlayerView(url: URL(string: "https://www.youtube.com/embed/ZSt9tm3RoUU?rel=0"))
}
