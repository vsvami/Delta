//
//  AccountSettingsView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 20.07.24.
//

import SwiftUI
import UISystem

struct AccountSettingsView: View {
    @EnvironmentObject var router: Router
    
    @State private var name: String = ""
    @State private var currency: Currency = .usd
    @State private var balance: String = ""
    @State private var selectedIcon: Icon = .dollar
    @State private var selectedColor: AppGradient = .blueGradient
    @State private var selectedGroup: GroupOfAccounts = DataStore.shared.groupsOfAccounts.first!
    @State private var selectedUser: Person = DataStore.shared.people.first!
    
    let account: Account
    let dataStore = DataStore.shared
    
    var body: some View {
        ScrollView {
            VStack {
                AccountLargeCardView(
                    title: account.title,
                    currency: account.currency,
                    amount: account.amount,
                    image: account.image,
                    color: account.color,
                    size: CGSize(width: Constants.largeAccountCardWidth, height: Constants.largeAccountCardHeight)
                )
                .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
                .padding()
                
                Text("Account settings")
                    .font(.heading1())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                
                AccountSettingsBlockView(
                    name: $name,
                    currency: $currency,
                    balance: $balance,
                    selectedIcon: $selectedIcon,
                    selectedColor: $selectedColor,
                    selectedGroup: $selectedGroup,
                    selectedUser: $selectedUser,
                    account: account
                )
                
                RoundedButtonView(title: "Delete account", action: {})
                    .padding()
                
                Spacer()
            }
            .navigationTitle(account.title)
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
    }
}

#Preview {
    AccountSettingsView(
        account: Account(
            id: UUID(),
            title: "Alfa bank",
            currency: .rub,
            image: "dollarsign.circle",
            color: AppGradient.redGradient.name,
            users: [],
            transactions: [],
            categoryType: .account
        )
    )
}
