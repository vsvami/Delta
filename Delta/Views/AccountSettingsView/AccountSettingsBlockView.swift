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
                    size: CGSize(width: Constants.widthHalfScreen, height: Constants.heightFour)
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                
                ChosingItemView(
                    selectedItem: $selectedColor,
                    items: AppGradient.allCases,
                    title: "Color",
                    size: CGSize(width: Constants.widthHalfScreen, height: Constants.heightFour)
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
                    size: CGSize(width: Constants.widthHalfScreen, height: Constants.heightFive)
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
                
                ItemPickerView(
                    selectedItem: $selectedUser,
                    items: dataStore.people,
                    title: "User",
                    size: CGSize(width: Constants.widthHalfScreen, height: Constants.heightFive)
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
                size: CGSize(width: Constants.accountSettingsWidth, height: Constants.heightFive)
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
            HStack {
                Text("Account name")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField(account.title, text: $name)
                    .textFieldStyle(.plain)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.default)
            }
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
            
            HStack {
                Text("Account balance")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField(String(account.amount), text: $balance)
                    .textFieldStyle(.plain)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            .padding(.vertical, 8)
            
        }
        .padding(.horizontal, 16)
        .componentBackground(
            color: AppGradient.appBackgroundMini.name,
            size: CGSize(width: size.width, height: size.height)
        )
        
    }
}
