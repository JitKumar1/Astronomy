//
//  ViewExtension.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import SwiftUI

extension View {
    
    func gridViewSize(margin: CGFloat = 24.0) -> CGSize {
        CGSize(width: (UIScreen.main.bounds.width / (UIDevice.current.userInterfaceIdiom == .pad ? 4 : 2) - margin) ,height: 250)
    }
    
    @ViewBuilder
    func UnavailableView(for message: String) -> some View {
        if !message.isEmpty  {
            let isNoNetwork = Constants.noNetworkMessage.localizedCaseInsensitiveCompare(message) == .orderedSame
            ContentUnavailableView(
                isNoNetwork ? Constants.noNetworkTitle : Constants.serverErrorTitle,
                systemImage: isNoNetwork ? "wifi.exclamationmark" : "magnifyingglass",
                description: Text(LocalizedStringKey(message))
            )
            .accessibility(identifier:"unavailableView")
        }
        
    }
}

