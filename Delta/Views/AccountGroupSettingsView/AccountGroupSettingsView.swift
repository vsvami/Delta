//
//  AccountGroupSettingsView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 20.07.24.
//

import SwiftUI
import UISystem

struct AccountGroupSettingsView: View {
    @EnvironmentObject var router: Router
    
    @State private var name: String
    @State private var currency: Currency
    @State private var balance: String
    @State private var selectedIcon: Icon
    @State private var selectedColor: AppGradient
    @State private var accounts: [Category] = []
    
    let groupOfAccounts: GroupOfAccounts
    let dataManager = DataManager.shared
    
    init(groupOfAccounts: GroupOfAccounts) {
        self.groupOfAccounts = groupOfAccounts
        _name = State(initialValue: groupOfAccounts.title)
        _currency = State(initialValue: groupOfAccounts.currency)
        _balance = State(initialValue: String(groupOfAccounts.amount))
        _selectedIcon = State(initialValue: Icon.getIcon(from: groupOfAccounts.image) ?? .dollar)
        _selectedColor = State(initialValue: AppGradient.getColor(from: groupOfAccounts.color) ?? .blueGradient)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                AccountLargeCardView(
                    title: name,
                    currency: currency,
                    amount: balance,
                    image: selectedIcon.name,
                    color: selectedColor.name,
                    size: CGSize(width: Constants.largeAccountCardWidth, height: Constants.largeAccountCardHeight)
                )
                .padding()
                
                Text("Accounts")
                    .font(.heading1())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                
                CategoriesScrollView(categories: accounts)
                
                Text("Accounts group settings")
                    .font(.heading1())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                
                AccountGroupSettingsBlockView(
                    name: $name,
                    currency: $currency,
                    selectedIcon: $selectedIcon,
                    selectedColor: $selectedColor,
                    groupOfAccounts: groupOfAccounts
                )
                
                RoundedButtonView(title: "Delete group", action: {})
                    .padding()
            }
            .shadow()
            .navigationTitle(groupOfAccounts.title)
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        //сохраняем изменения
                    }
                }
            }
        }
        .background(.appBackground)
        .onTapGesture {
            hideKeyboard()
        }
        .onAppear {
            accounts = dataManager.getAccounts()
        }
    }
}

#Preview {
    AccountGroupSettingsView(
        groupOfAccounts: GroupOfAccounts(
            id: UUID(),
            title: "Alfa bank",
            currency: .usd,
            image: "dollarsign.circle",
            color: AppGradient.blueGradient.name,
            accounts: DataStore.shared.accounts,
            categoryType: .account
        )
    )
}
