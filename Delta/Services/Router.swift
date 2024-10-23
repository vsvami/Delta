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
    case accountCreate
    case accountGroupCreate
    case seeAll
    case transfer
    case incomes
    case incomeSettings(income: Income)
    case expenseSettings(expense: Expense)
    case incomeCreate
    case expenseCreate
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
    var path = NavigationPath()
    
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
        case .expenseSettings(let expense):
            ExpenseSettingsView(expense: expense)
        case .accountCreate:
            AccountSettingsView()
        case .accountGroupCreate:
            AccountGroupSettingsView()
        case .incomeCreate:
            IncomeSettingsView()
        case .expenseCreate:
            ExpenseSettingsView()
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
