//
//  TabBarView.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 8/29/24.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = TabRoute.main
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MainView()
                .tabItem {
                    Label("Главная", systemImage: "house")
                }
                .tag(TabRoute.main)
            
            
            AnalyticsView()
                .tabItem {
                    Label("Аналитика", systemImage: "chart.pie")
                }
                .tag(TabRoute.analytic)
            
            ShoppingListView()
                .tabItem {
                    Label("Список покупок", systemImage: "list.bullet")
                }
                .tag(TabRoute.shoppingList)
            
            SettingsView()
                .tabItem {
                    Label("Настройки", systemImage: "gearshape")
                }
                .tag(TabRoute.settings)
        }
    }
}

#Preview {
    TabBarView()
}

