//
//  Navigator.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import SwiftUI

protocol Routable: Hashable, Identifiable {
    var id: String { get }
}

enum Route: Routable {
     
    case planetaryList
    case planetaryDetail(PlanetaryDomainModel)
    
    var id: String {
        switch self {
        case .planetaryList:
            return "planetaryList"
        case .planetaryDetail:
            return "planetaryDetail"
        }
    }
}

protocol Navigator: ObservableObject {
    associatedtype RoutePage: Routable
    
    /// the navigation global Path
    var path: NavigationPath { get set }
    
    /// 
    ///  push the screen specified the Router Page
    /// - Parameter page: the router page name
    ///
    func push(_ page: RoutePage)
    
    /// pop to current screen
    func pop()
    
    /// pop to root Screen
    func popToRoot()
    
}
