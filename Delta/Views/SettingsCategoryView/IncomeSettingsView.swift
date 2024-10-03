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
    
    let income: IncomeExpense
    
    var body: some View {
        VStack {
            CustomSegmentedControlView(selection: $selection)
            
            switch selection {
            case .random:
                RandomIncomesView(
                    incomeTitle: $incomeTitle,
                    currency: $currency,
                    amount: $amount,
                    income: income
                )
            case .certain:
                CertainIncomesView()
            }
        }
    }
}

struct RandomIncomesView: View {
    @Binding var incomeTitle: String
    @Binding var currency: Currency
    @Binding var amount: String
    
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
        }
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
