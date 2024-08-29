//
//  TabBarView.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 8/29/24.
//

import SwiftUI
import UISystem

struct TabBarView: View {
    @State private var selectedTab = TabRoute.main
    
    init() {
        setupTabBarAppearance()
    }
    
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

extension TabBarView {
    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .appBackground
        
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        
        // Цвет для выделенного таба
        appearance.stackedLayoutAppearance.selected.iconColor = .appBlack
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.appBlack]
        
        // Цвет для невыбранных табов
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.lightGray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.lightGray]
        
        UITabBar.appearance().standardAppearance = appearance
        
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

#Preview {
    TabBarView()
}

