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
                account: account
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
                size: CGSize(width: Constants.widthFive, height: Constants.heightFive)
            )
        }
    }
}

struct AccountSettingsBlock: View {
    @Binding var name: String
    @Binding var currency: Currency
    @Binding var balance: String
    
    let account: Account
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.appBackgroundMini)
                .padding(.horizontal, 16)
            
            List {
                SettingsRowView(
                    inputValue: $name,
                    currency: $currency,
                    source: account,
                    title: "Account name",
                    type: .textfield
                )
                
                SettingsRowView(
                    inputValue: $name,
                    currency: $currency,
                    source: account,
                    title: "Currency",
                    type: .picker
                )
                
                SettingsRowView(
                    inputValue: $name,
                    currency: $currency,
                    source: account,
                    title: "Account balance",
                    type: .textfield
                )
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, 16)
            .background(Color.clear)
            .listStyle(.plain)
            .frame(minHeight: 176)
        }
        
    }
}

#Preview {
    AccountSettingsBlock(name: .constant("Cash"), currency: .constant(.usd), balance: .constant("3000"), account: DataStore.shared.accounts.first!)
}
