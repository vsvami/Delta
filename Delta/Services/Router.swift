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
    case incomeSettings(income: IncomeExpense)
}

enum TabRoute: Hashable {
    case main
    case analytic
    case shoppingList
    case settings
}

@MainActor
final class Router: ObservableObject {
    @Published var startScreen: Route = .main
    @Published var path = NavigationPath()
    
    @ViewBuilder func tabView() -> some View {
        TabBarView()
    }
        
    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .onboarding:
            OnboardingView()
                .navigationBarBackButtonHidden()
        case .login:
            LoginView()
                .navigationBarBackButtonHidden()
        case .main:
            tabView()
        case .profileSettings:
            ProfileSettingsView()
                .navigationBarBackButtonHidden()
        case .appDesignSettings:
            AppDesignSettingsView()
                .navigationBarBackButtonHidden()
        case .accountSettings(let account):
            AccountSettingsView(account: account)
        case .accountGroupSettings(let group):
            AccountGroupSettingsView(groupOfAccounts: group)
        case .categorySettings:
            SettingsCategoryView()
                .navigationBarBackButtonHidden()
        case .seeAll:
            SeeAllView()
                .navigationBarBackButtonHidden()
        case .transfer:
            TransferView()
                .navigationBarBackButtonHidden()
        case .incomes:
            IncomesView()
        case .incomeSettings(let income):
            IncomeSettingsView(income: income)
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
