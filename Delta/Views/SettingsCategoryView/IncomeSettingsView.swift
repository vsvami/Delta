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
    
    var body: some View {
        VStack {
            CustomSegmentedControlView(selection: $selection)
        }
    }
}

struct RandomIncomesView {
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
                    type: .textfield
                )
                
                SettingsRowView(
                    inputValue: $incomeTitle,
                    currency: $currency,
                    source: income,
                    title: "Currency",
                    type: .textfield
                )
                
                SettingsRowView(
                    inputValue: $amount,
                    currency: $currency,
                    source: income,
                    title: "Amount",
                    type: .textfield
                )
            }
        }
    }
}

struct CertainIncomesView {
    var body: some View {
        List {
            
        }
    }
}

#Preview {
    IncomeSettingsView()
}
