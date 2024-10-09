//
//  Routing.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 8/29/24.
//

import SwiftUI

enum Route: Hashable {
    case onboarding
    case login
    case main
    case profileSettings
    case appDesignSettings
    case accountSettings(account: Account)
    case accountGroupSettings(group: GroupOfAccounts)
    case categorySettings
    case seeAll
    case transfer
    case incomes
    case incomeSettings
}

enum TabRoute: Hashable {
    case main
    case analytic
    case shoppingList
    case settings
}

@MainActor
@Observable
final class Router {
    var startScreen: Route = .main
    var selectedTabRoute: Tab = .shoppingList
    
    var path = NavigationPath()
    
    @ViewBuilder func tabView(for route: Tab) -> some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                Spacer()
                switch selectedTabRoute {
                case .main:
                    MainView()
                case .analytic:
                    AnalyticsView()
                case .shoppingList:
                    ShoppingListView()
                case .settings:
                    SettingsView()
                }
                Spacer()
            }
            
            CustomTabBar()
        }
        .background(Color.appBackground)
        .ignoresSafeArea(edges: .bottom)
    }
    
    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .onboarding:
            OnboardingView()
        case .login:
            LoginView()
        case .main:
            tabView(for: selectedTabRoute)
        case .profileSettings:
            ProfileSettingsView()
        case .appDesignSettings:
            AppDesignSettingsView()
        case .accountSettings(let account):
            AccountSettingsView(account: account)
        case .accountGroupSettings(let group):
            AccountGroupSettingsView(groupOfAccounts: group)
        case .categorySettings:
            SettingsCategoryView()
        case .seeAll:
            SeeAllView()
        case .transfer:
            TransferView()
        case .incomes:
            IncomesView()
        case .incomeSettings:
            IncomeSettingsView()
        }
        
    }
    
    func navigateTo(_ appRoute: Route) {
        path.append(appRoute)
    }
    
    func navigateBack() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
