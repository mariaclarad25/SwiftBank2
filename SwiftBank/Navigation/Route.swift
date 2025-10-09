//
//  Route.swift
//  SwiftBank
//
//  Created by Maria Clara Dias on 08/10/25.
//

import SwiftUI
import SBLoan

enum Route {
    case loan(id: String, amount: String)
    case pix
    case error
}

extension Route: View {
    
    var body: some View {
        switch self {
        case .loan(let id, let amount):
            SBLoanView(amount)
        case .pix:
            PixView()
        case.error:
            GenericErrorView()
        }
    }
}
