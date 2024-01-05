//
//  Navigation.swift
//  Astronomy
//
//  Created by Jitendra Kumar on 05/01/24.
//

import SwiftUI

final class Navigation: Navigator {
    typealias RoutePage = Route
    @Published var path = NavigationPath()
}

extension Navigation {
    
    func push(_ page: Route) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
}
private struct NavigationEnvironmentKey: EnvironmentKey {
    static let defaultValue: Navigation = Navigation()
}

extension EnvironmentValues {
    var navigate: Navigation {
        get { self[NavigationEnvironmentKey.self] }
        set { self[NavigationEnvironmentKey.self] = newValue }
    }
}
