//
//  AccountSettingsView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 20.07.24.
//

import SwiftUI
import UISystem

struct AccountSettingsView: View {
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
            
            AccountSettingsBlock1(
                name: $name,
                currency: $currency,
                balance: $balance,
                account: account,
                size: CGSize(width: Constants.accountSettingsWidth, height: Constants.accountSettingsHeight)
            )
            .padding(.top, 8)
            .padding(.bottom, 16)
            
            HStack {
                ChosingItemView(
                    selectedItem: $selectedIcon,
                    items: Icon.allCases,
                    title: "Icon",
                    size: CGSize(width: Constants.itemCardWidth, height: Constants.itemCardHeight)
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                
                ChosingItemView(
                    selectedItem: $selectedColor,
                    items: AppGradient.allCases,
                    title: "Color",
                    size: CGSize(width: Constants.itemCardWidth, height: Constants.itemCardHeight)
                )
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 16)
            }
            .padding(.bottom, 16)
            
            HStack {
                ItemPickerView(
                    selectedItem: $selectedGroup,
                    items: dataStore.groupsOfAccounts,
                    title: "Group of Accounts",
                    size: CGSize(width: Constants.accountPickerWidth, height: Constants.accountPickerHeight)
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                
                ItemPickerView(
                    selectedItem: $selectedUser,
                    items: dataStore.people,
                    title: "User",
                    size: CGSize(width: Constants.accountPickerWidth, height: Constants.accountPickerHeight)
                )
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 16)
            }
            
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
        .background(.appBackground)
    }
}

struct AccountSettingsBlock1: View {
    @Binding var name: String
    @Binding var currency: Currency
    @Binding var balance: String
    
    let account: Account
    let size: CGSize
    
    var body: some View {
        
        VStack {
            setRowView(title: "Account name", placeholder: account.title, value: $name)
                .padding(.vertical, 8)
            
            Divider()
                .padding(.trailing, -16)
            
            HStack {
                Text("Currency")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Picker(account.currency.name, selection: $currency) {
                    ForEach(Currency.allCases) { currency in
                        Text(currency.rawValue).tag(currency)
                    }
                }
                .pickerStyle(.menu)
                .accentColor(.appBlack)
                .padding(.trailing, -12)
            }
            
            Divider()
                .padding(.trailing, -16)
            
            setRowView(title: "Account balance", placeholder: String(account.amount), value: $balance)
                .padding(.vertical, 8)
        }
        .padding(.horizontal, 16)
        .componentBackground(
            color: AppGradient.appBackgroundMini.name,
            size: CGSize(width: size.width, height: size.height)
        )
        
    }
    
    
    private func setRowView(title: String, placeholder: String, value: Binding<String>) -> some View {
        HStack {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField(placeholder, text: value)
                .textFieldStyle(.plain)
                .multilineTextAlignment(.trailing)
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
