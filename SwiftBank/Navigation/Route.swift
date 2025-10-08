//
//  Route.swift
//  SwiftBank
//
//  Created by Maria Clara Dias on 08/10/25.
//

import SwiftUI
import SBLoan

enum Route {
    case loan
    case pix
}

extension Route: View {
    
    var body: some View {
        switch self {
        case .loan:
            SBLoanView()
        case .pix:
            PixView()
        }
    }
    
}
