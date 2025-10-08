//
//  SwiftBankApp.swift
//  SwiftBank
//
//  Created by Alura on 27/12/23.
//

import SwiftUI

@main
struct SwiftBankApp: App {
    
    @ObservedObject private var routerManager = NavigationRouter()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(routerManager)
                .onOpenURL(perform: { url in
                    handleDeepLink(from: url)
                })
        }
    }
}

extension SwiftBankApp {
    func handleDeepLink(from url: URL) {
        let routerHandler = RouterHandler()
        Task{
            if let route = await routerHandler.find(from: url) {
                routerManager.push(to: route)
            }
        }
    }
}
