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
    
    let income: IncomeExpense
    
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
                CertainIncomesView()
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
                SettingsRowView(
                    inputValue: $incomeTitle,
                    currency: $currency,
                    source: income,
                    title: "Income title",
                    type: .textfield, 
                    keyboardType: .default, 
                    placeholder: income.title
                )
                
                SettingsRowView(
                    inputValue: $incomeTitle,
                    currency: $currency,
                    source: income,
                    title: "Currency",
                    type: .picker,
                    keyboardType: .default, 
                    placeholder: income.title
                )
                
                SettingsRowView(
                    inputValue: $amount,
                    currency: $currency,
                    source: income,
                    title: "Amount",
                    type: .textfield, 
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
    var body: some View {
        List {
            
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
        )
    )
}
