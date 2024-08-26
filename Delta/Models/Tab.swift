//
//  Tab.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 28.07.24.
//

import SwiftUI

enum Tab: String {
    case main = "Maim"
    case analytics = "Analytics"
    case shoppingList = "Shopping list"
    case settings = "Settings"
    
    @ViewBuilder
    var tabContent: some View {
        switch self {
        case .main:
            Image(systemName: "house")
            Text(self.rawValue)
        case .analytics:
            Image(systemName: "chart.pie")
            Text(self.rawValue)
        case .shoppingList:
            Image(systemName: "list.bullet")
            Text(self.rawValue)
        case .settings:
            Image(systemName: "gearshape")
            Text(self.rawValue)
        }
    }
}
