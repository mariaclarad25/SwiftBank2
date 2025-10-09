//
//  RouterHandler.swift
//  SwiftBank
//
//  Created by Maria Clara Dias on 08/10/25.
//

import Foundation

import Foundation

enum DeeplinkURL: String {
    case loan = "loan"
    case pix = "pix"
    case error = "error"
}

struct RouterHandler {
    
    func find(from url: URL) async -> Route? {
        
        guard let host = url.host() else { return nil }
        
        //print(url.queryParameters)
        
        switch DeeplinkURL(rawValue: host) {
        case .loan:
            
            let queryParameters = url.queryParameters
            
            let id = queryParameters?["id"] as? String ?? ""
            let amount = queryParameters?["amount"] as? String ?? ""
            
            return .loan(id: id, amount: amount)
        case .pix:
            return .pix
        case .error:
            return .error
        default:
            return nil
        }
    }
}

extension Route: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
    
    static func == (lhs: Route, rsh: Route) -> Bool {
        switch (lhs, rsh) {
        case (.loan, .loan):
            return true
        case (.pix, .pix):
            return true
        default: 
            return false
        }
    }
}
