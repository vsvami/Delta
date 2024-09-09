//
//  MainView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 08.07.24.
//

import SwiftUI
import UISystem

struct MainView: View {
    private var dataManager = DataManager.shared // @StateObject
    let categoryTypes = CategoryType.getCategoryTypes()

    @State private var accounts: [Category] = []
    @State private var categories: [Category] = []
    
    @State private var activeTab = CategoryType.expense
    
    init() {
        _ = DataManager.shared
    }
    
    var body: some View {
        VStack {
            InfoMainView()
            Spacer()
            
            HeaderMainView(text: "Accounts", action: {})
            CategoriesScrollView(categories: accounts)
            Spacer()
            
            ButtonsScrollView(categoryTypes: categoryTypes, activeTab: $activeTab)
            Spacer()
            
            ForEach(categoryTypes, id: \.self) { category in
                if category == activeTab {
                    HeaderMainView(text: category.rawValue, action: {})
                    CategoriesScrollView(categories: dataManager.getCategories(with: category))
                        .frame(height: Constants.heightTwo)
                }
            }

        }
        .padding(.vertical)
        .background(AppGradient.appBackground.value)
        .onAppear {
            accounts = dataManager.getAccountsAndGroup()
            categories = dataManager.getCategories(with: .expense)
            
        }
    }
}

#Preview {
    MainView()
}
