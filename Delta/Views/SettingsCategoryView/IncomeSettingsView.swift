//
//  IncomeSettingsView.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 10/3/24.
//

import SwiftUI
import UISystem

struct IncomeSettingsView: View {
    @State private var selection: RepeatingType = .random
    @State private var incomeTitle: String = ""
    @State private var currency: Currency = .usd
    @State private var amount: String = ""
    @State private var selectedIcon: Icon = .award
    
    @State private var certainIncomeTitle: String = ""
    @State private var date: Date = Date()
    @State private var notificationIsOn: Bool = false
    @State private var isAutotransaction: Bool = false
    
    let income: IncomeExpense
    let certainIncome: SubCategory
    
    var body: some View {
        VStack {
            CustomSegmentedControlView(selection: $selection)
                .padding(.horizontal, 20)
            
            switch selection {
            case .random:
                RandomIncomesView(
                    incomeTitle: $incomeTitle,
                    currency: $currency,
                    amount: $amount, 
                    selectedIcon: $selectedIcon,
                    income: income
                )
                .padding(.top, -10)
            case .certain:
                CertainIncomesView(
                    incomeTitle: $incomeTitle,
                    currency: $currency,
                    selectedIcon: $selectedIcon,
                    certainIncomeTitle: $certainIncomeTitle,
                    amount: $amount,
                    date: $date,
                    notificationIsOn: $notificationIsOn,
                    isAutotransaction: $isAutotransaction,
                    income: income,
                    certainIncome: certainIncome
                )
                .padding(.top, -10)
            }
        }
        .navigationTitle(income.title)
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

struct RandomIncomesView: View {
    @Binding var incomeTitle: String
    @Binding var currency: Currency
    @Binding var amount: String
    @Binding var selectedIcon: Icon
    
    let income: IncomeExpense
    
    var body: some View {
        List {
            Section {
                TextFieldRowView(
                    inputValue: $incomeTitle,
                    source: income,
                    title: "Income title",
                    keyboardType: .default, 
                    placeholder: income.title
                )
                
                PickerRowView(
                    currency: $currency,
                    source: income,
                    title: "Currency"
                )
                
                TextFieldRowView(
                    inputValue: $amount,
                    source: income,
                    title: "Amount",
                    keyboardType: .decimalPad, 
                    placeholder: String(income.amount)
                )
            }
            
            ChosingItemView(
                selectedItem: $selectedIcon,
                items: Icon.allCases,
                title: "Icon",
                size: CGSize(width: Constants.widthSix, height: Constants.heightFour)
            )
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
            .padding(.vertical, 8)
        }
        .buttonStyle(BorderlessButtonStyle())
        .listSectionSpacing(.compact)
    }
}

struct CertainIncomesView: View {
    @Binding var incomeTitle: String
    @Binding var currency: Currency
    @Binding var selectedIcon: Icon
    
    @Binding var certainIncomeTitle: String
    @Binding var amount: String
    @Binding var date: Date
    @Binding var notificationIsOn: Bool
    @Binding var isAutotransaction: Bool
    
    let income: IncomeExpense
    let certainIncome: SubCategory
    
    var body: some View {
        List {
            Section {
                TextFieldRowView(
                    inputValue: $incomeTitle,
                    source: income,
                    title: "Income title",
                    keyboardType: .default,
                    placeholder: income.title
                )
                
                PickerRowView(
                    currency: $currency,
                    source: income,
                    title: "Currency"
                )
            }
            
            ChosingItemView(
                selectedItem: $selectedIcon,
                items: Icon.allCases,
                title: "Icon",
                size: CGSize(width: Constants.widthSix, height: Constants.heightFour)
            )
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
            .padding(.vertical, 8)
            
            CertainIncomeSettingsView(
                incomeTitle: $certainIncomeTitle,
                amount: $amount,
                date: $date,
                notificationIsOn: $notificationIsOn,
                isAutotransaction: $isAutotransaction,
                certainIncome: certainIncome
            )
        }
        .buttonStyle(BorderlessButtonStyle())
        .listSectionSpacing(.compact)
    }
}

struct CertainIncomeSettingsView: View {
    @Binding var incomeTitle: String
    @Binding var amount: String
    @Binding var date: Date
    @Binding var notificationIsOn: Bool
    @Binding var isAutotransaction: Bool
    
    let certainIncome: SubCategory
    
    var body: some View {
        Section {
            TextFieldRowView(
                inputValue: $incomeTitle,
                source: certainIncome,
                title: "Income title",
                keyboardType: .default,
                placeholder: certainIncome.title
            )
            
            TextFieldRowView(
                inputValue: $amount,
                source: certainIncome,
                title: "Amount",
                keyboardType: .decimalPad,
                placeholder: String(certainIncome.amount)
            )
            
            DateRowView(
                date: $date,
                source: certainIncome,
                title: "Choose date"
            )
            
            NotificationRowView(
                notificationIsOn: $notificationIsOn,
                source: certainIncome,
                title: "Notifications"
            )
            
            NotificationRowView(
                notificationIsOn: $isAutotransaction,
                source: certainIncome,
                title: "Autotransaction"
            )
        } header: {
            Text("Add certain income")
                .font(.bodyText1())
                .padding(.leading, -18)
        }
    }
}

#Preview {
    IncomeSettingsView(
        income: IncomeExpense(
            image: "",
            repeatingType: .random,
            subCategories: [],
            transactions: [],
            id: UUID(),
            title: "Award",
            currency: .usd,
            categoryType: .income
        ),
        certainIncome: SubCategory(
            id: UUID(),
            title: "Award 1",
            currency: .usd,
            categoryType: .income,
            amount: 2000
        )
    )
}
