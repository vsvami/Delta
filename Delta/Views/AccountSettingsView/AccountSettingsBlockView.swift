//
//  AccountSettingsBlockView.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 9/13/24.
//

import SwiftUI
import UISystem

struct AccountSettingsBlockView: View {
    @Binding var name: String
    @Binding var currency: Currency
    @Binding var balance: String
    @Binding var selectedIcon: Icon
    @Binding var selectedColor: AppGradient
    @Binding var selectedGroup: GroupOfAccounts
    @Binding var selectedUser: Person
    
    let account: Account
    let dataStore = DataStore.shared
    
    var body: some View {
        VStack {
            AccountSettingsBlock(
                name: $name,
                currency: $currency,
                balance: $balance,
                account: account,
                size: CGSize(width: Constants.accountSettingsWidth, height: Constants.accountSettingsHeight)
            )
            .padding(.top, 2)
            .padding(.bottom, 8)
            
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
            .padding(.bottom, 8)
            
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
            .padding(.bottom, 8)
            
            ShowHistoryView(
                title: "History",
                buttonTitle: "Show",
                action: {
                    // router.navigateTo(.history)
                },
                size: CGSize(width: Constants.accountSettingsWidth, height: Constants.accountPickerHeight)
            )
        }
    }
}

struct AccountSettingsBlock: View {
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
