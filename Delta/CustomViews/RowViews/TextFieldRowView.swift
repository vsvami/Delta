//
//  SettingsRowView.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 9/26/24.
//

import SwiftUI

struct TextFieldRowView<T>: View {
    @Binding var inputValue: String
    
    let source: T
    let title: String
    let keyboardType: UIKeyboardType
    let placeholder: String
    
    var body: some View {
        HStack {
            if source is Account {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField(placeholder, text: $inputValue)
                    .textFieldStyle(.plain)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(keyboardType)
            }
            
            if source is GroupOfAccounts {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField(placeholder, text: $inputValue)
                    .textFieldStyle(.plain)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(keyboardType)
            }
            
            if source is IncomeExpense {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField(placeholder, text: $inputValue)
                    .textFieldStyle(.plain)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(keyboardType)
            }
        
            
            if source is SubCategory {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField(placeholder, text: $inputValue)
                    .textFieldStyle(.plain)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(keyboardType)
            }
        }
        .padding(.vertical, 8)
        .frame(height: 37)
    }
}

struct PickerRowView<T>: View {
    @Binding var currency: Currency
    
    let source: T
    let title: String
    
    var body: some View {
        HStack {
            if source is Account{
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Picker("", selection: $currency) {
                    ForEach(Currency.allCases) { currency in
                        Text(currency.rawValue).tag(currency)
                    }
                }
                .pickerStyle(.menu)
                .labelsHidden()
                .accentColor(.appBlack)
            }
            
            if source is GroupOfAccounts {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Picker("", selection: $currency) {
                    ForEach(Currency.allCases) { currency in
                        Text(currency.rawValue).tag(currency)
                    }
                }
                .pickerStyle(.menu)
                .labelsHidden()
                .accentColor(.appBlack)
            }
            
            if source is IncomeExpense {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Picker("", selection: $currency) {
                    ForEach(Currency.allCases) { currency in
                        Text(currency.rawValue).tag(currency)
                    }
                }
                .pickerStyle(.menu)
                .labelsHidden()
                .accentColor(.appBlack)
            }
        }
    }
}


struct DateRowView<T>: View {
    @Binding var date: Date
    
    let source: T
    let title: String
    
    var body: some View {
        HStack {
            if source is SubCategory {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                DatePicker("", selection: $date, displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .labelsHidden()
                    .accentColor(.appBlack)
            }
        }
    }
}

struct NotificationRowView<T>: View {
    @Binding var notificationIsOn: Bool
    
    let source: T
    let title: String
    
    var body: some View {
        HStack {
            if source is SubCategory {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Toggle("", isOn: $notificationIsOn)
            }
        }
    }
}


//#Preview {
//    SettingsRowView(
//        inputValue: .constant("Cash"),
//        currency: .constant(.usd),
//        source: DataStore.shared.accounts.first,
//        title: "Account Name",
//        type: .picker,
//        keyboardType: .numberPad,
//        placeholder: "Alpha"
//    )
//}

//#Preview {
//    DateRowView(
//        date: .constant(.now),
//        source: SubCategory(
//            id: UUID(),
//            title: "Avance",
//            currency: .usd,
//            categoryType: .income,
//            amount: 3000
//        ),
//        title: "Choose date"
//    )
//}

#Preview {
    NotificationRowView(
        notificationIsOn: .constant(true),
        source: SubCategory(
            id: UUID(),
            title: "Avance",
            currency: .usd,
            categoryType: .income,
            amount: 3000
        ),
        title: "Notifications"
    )
}
