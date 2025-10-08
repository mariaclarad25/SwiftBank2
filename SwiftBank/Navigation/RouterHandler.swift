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
}

struct RouterHandler {
    
    func find(from url: URL) async -> Route? {
        
        guard let host = url.host() else { return nil }
        
        switch DeeplinkURL(rawValue: host) {
        case .loan:
            return .loan
        case .pix:
            return .pix
        default:
            return nil
        }
    }
}
