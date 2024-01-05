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
    
    var path: NavigationPath { get set }
    
    func push(_ page: RoutePage)
    
    func pop()
    
    func popToRoot()
    
}
