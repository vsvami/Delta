//
//  SettingsRowView.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 9/26/24.
//

import SwiftUI

enum InputType {
    case textfield
    case picker
}

struct SettingsRowView<T>: View {
    @Binding var inputValue: String
    @Binding var currency: Currency
    
    let source: T
    let title: String
    let type: InputType
    let keyboardType: UIKeyboardType
    
    var body: some View {
        HStack {
            if let source = source as? Account, type == .textfield {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField(source.title, text: $inputValue)
                    .textFieldStyle(.plain)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(keyboardType)
            }
            
            if let source = source as? Account, type == .picker {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Picker(source.currency.name, selection: $currency) {
                    ForEach(Currency.allCases) { currency in
                        Text(currency.rawValue).tag(currency)
                    }
                }
                .pickerStyle(.menu)
                .labelsHidden()
                .accentColor(.appBlack)
            }
            
            if let source = source as? GroupOfAccounts, type == .textfield {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField(source.title, text: $inputValue)
                    .textFieldStyle(.plain)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(keyboardType)
            }
            
            if let source = source as? GroupOfAccounts, type == .picker {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Picker(source.currency.name, selection: $currency) {
                    ForEach(Currency.allCases) { currency in
                        Text(currency.rawValue).tag(currency)
                    }
                }
                .pickerStyle(.menu)
                .labelsHidden()
                .accentColor(.appBlack)
            }
        }
        .padding(.vertical, 8)
        .frame(height: 37)
    }
}

#Preview {
    SettingsRowView(inputValue: .constant("Cash"), currency: .constant(.usd), source: DataStore.shared.accounts.first, title: "Account Name", type: .picker, keyboardType: .numberPad)
}
