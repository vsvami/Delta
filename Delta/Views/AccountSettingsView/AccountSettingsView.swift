//
//  AccountSettingsView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 20.07.24.
//

import SwiftUI
import UISystem

struct AccountSettingsView: View {
    @Environment(Router.self) private var router
    
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
            .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            
            Section {
                TextFieldRowView(
                    inputValue: $name,
                    title: "Account name",
                    keyboardType: .default, 
                    placeholder: account.title
                )
                
                PickerRowView(
                    currency: $currency,
                    title: "Currency"
                )
                
                TextFieldRowView(
                    inputValue: $balance,
                    title: "Account balance",
                    keyboardType: .decimalPad, 
                    placeholder: String(account.amount)
                )
            } header: {
                Text("Account settings")
                    .font(.subheading1())
                    .padding(.leading, -18)
                    .foregroundStyle(AppGradient.appBlack.value)
            }
            
            Section {
                HStack(spacing: 16) {
                    IconPickerView(
                        selectedItem: $selectedIcon,
                        items: Icon.allCases,
                        title: "Icon",
                        size: CGSize(width: Constants.widthHalfScreen, height: Constants.heightFour)
                    )
                    
                    ColorPickerView(
                        selectedItem: $selectedColor,
                        items: AppGradient.allCases,
                        title: "Color",
                        size: CGSize(width: Constants.widthHalfScreen, height: Constants.heightFour)
                    )
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
            }
            .padding(.vertical, 8)
            
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
            .padding(.bottom, 8)
            
            Section {
                ShowHistoryView(
                    title: "History",
                    buttonTitle: "Show",
                    action: {
                        // router.navigateTo(.history)
                    },
                    size: CGSize(width: Constants.widthFive, height: Constants.heightFive)
                )
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
            }
            
            RoundedButtonView(title: "Delete account", action: {})
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
                .padding(.top, 8)
        }
        .buttonStyle(BorderlessButtonStyle())
        .listSectionSpacing(.compact)
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
    .environment(Router())
}
