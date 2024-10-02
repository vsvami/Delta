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
    
    @State private var name: String
    @State private var currency: Currency
    @State private var balance: String
    @State private var selectedIcon: Icon
    @State private var selectedColor: AppGradient
    @State private var selectedUser: Person
    @State private var selectedGroup: GroupOfAccounts = DataStore.shared.groupsOfAccounts.first!
    
    let account: Account
    let dataStore = DataStore.shared
    
    init(account: Account) {
        self.account = account
        _name = State(initialValue: account.title)
        _currency = State(initialValue: account.currency)
        _balance = State(initialValue: String(account.amount))
        _selectedIcon = State(initialValue: Icon.getIcon(from: account.image) ?? .dollar)
        _selectedColor = State(initialValue: AppGradient.getColor(from: account.color) ?? .blueGradient)
        _selectedUser = State(initialValue: account.users.first ?? DataStore.shared.people.first!)
        
    }
    
    var body: some View {
        List {
            AccountLargeCardView(
                title: name,
                currency: currency,
                amount: balance,
                image: selectedIcon.name,
                color: selectedColor.name,
                size: CGSize(width: Constants.widthThree, height: Constants.heightSix)
            )
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            Section {
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
            } header: {
                Text("Account settings")
            }
            
            Section {
                HStack(spacing: 16) {
                    ChosingItemView(
                        selectedItem: $selectedIcon,
                        items: Icon.allCases,
                        title: "Icon",
                        size: CGSize(width: Constants.widthHalfScreen, height: Constants.heightFour)
                    )
                    
                    ChosingItemView(
                        selectedItem: $selectedColor,
                        items: AppGradient.allCases,
                        title: "Color",
                        size: CGSize(width: Constants.widthHalfScreen, height: Constants.heightFour)
                    )
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
            }
            
            Section {
                HStack(spacing: 16) {
                    ItemPickerView(
                        selectedItem: $selectedGroup,
                        items: dataStore.groupsOfAccounts,
                        title: "Group of Accounts",
                        size: CGSize(width: Constants.widthHalfScreen, height: Constants.heightFive)
                    )
                    
                    ItemPickerView(
                        selectedItem: $selectedUser,
                        items: dataStore.people,
                        title: "User",
                        size: CGSize(width: Constants.widthHalfScreen, height: Constants.heightFive)
                    )
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
            }
            
            Section {
                ShowHistoryView(
                    title: "History",
                    buttonTitle: "Show",
                    action: {
                        // router.navigateTo(.history)
                    },
                    size: CGSize(width: Constants.widthFive, height: Constants.heightFive)
                )
                .listRowBackground(Color.clear)
            }
            
            RoundedButtonView(title: "Delete account", action: {})
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
        }
        
        /*ScrollView {
            VStack {
                AccountLargeCardView(
                    title: name,
                    currency: currency,
                    amount: balance,
                    image: selectedIcon.name,
                    color: selectedColor.name,
                    size: CGSize(width: Constants.widthThree, height: Constants.heightSix)
                )
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
            .shadow()
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
        }*/
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
