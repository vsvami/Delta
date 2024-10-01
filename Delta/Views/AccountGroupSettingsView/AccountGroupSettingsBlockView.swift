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
                groupOfAccounts: groupOfAccounts
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
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.appBackgroundMini)
                .padding(.horizontal, 16)
            
            List {
                SettingsRowView(
                    inputValue: $name,
                    currency: $currency,
                    source: groupOfAccounts,
                    title: "Account name",
                    type: .textfield
                )
                
                SettingsRowView(
                    inputValue: $name,
                    currency: $currency,
                    source: groupOfAccounts,
                    title: "Currency",
                    type: .picker
                )
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, 16)
            .background(Color.clear)
            .listStyle(.plain)
            .frame(minHeight: 116)
        }
    }
}

