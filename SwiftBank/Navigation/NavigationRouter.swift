//
//  NavigationRouter.swift
//  SwiftBank
//
//  Created by Maria Clara Dias on 08/10/25.
//

import Foundation

final class NavigationRouter: ObservableObject {
    
    // MARK: - Attributes
    
    @Published var router = [Route]()
    
    static let shered = NavigationRouter()
    
    private init() { }
    
    // MARK: - Class methods
    
    func push(to screen: Route) {
        guard !router.contains(screen) else {
            return
        }
        router.append(screen)
    }
}
