//
//  AccountGroupSettingsBlockView.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 9/20/24.
//

import SwiftUI
import UISystem

struct AccountGroupSettingsBlockView: View {
    @Binding var name: String
    @Binding var currency: Currency
    @Binding var selectedIcon: Icon
    @Binding var selectedColor: AppGradient
    
    let groupOfAccounts: GroupOfAccounts
    
    var body: some View {
        VStack {
            AccountGroupSettingsBlock(
                name: $name,
                currency: $currency,
                groupOfAccounts: groupOfAccounts,
                size: CGSize(width: Constants.accountSettingsWidth, height: Constants.accountGroupSettingsHeight)
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
        }
    }
}

struct AccountGroupSettingsBlock: View {
    @Binding var name: String
    @Binding var currency: Currency
    
    let groupOfAccounts: GroupOfAccounts
    let size: CGSize
    
    var body: some View {
        VStack {
            HStack {
                Text("Group name")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField(groupOfAccounts.title, text: $name)
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
                Picker(groupOfAccounts.currency.name, selection: $currency) {
                    ForEach(Currency.allCases) { currency in
                        Text(currency.rawValue).tag(currency)
                    }
                }
                .pickerStyle(.menu)
                .accentColor(.appBlack)
                .padding(.trailing, -12)
            }
        }
        .padding(.horizontal, 16)
        .componentBackground(
            color: AppGradient.appBackgroundMini.name,
            size: CGSize(width: size.width, height: size.height)
        )
        
    }
}

