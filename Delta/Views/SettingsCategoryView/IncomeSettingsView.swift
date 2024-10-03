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
                CertainIncomesView(
                    incomeTitle: $incomeTitle,
                    currency: $currency,
                    amount: $amount,
                    selectedIcon: $selectedIcon,
                    income: income
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

struct CertainIncomeSettingsView: View {
    @Binding var incomeTitle: String
    @Binding var currency: Currency
    @Binding var amount: String
    @Binding var selectedIcon: Icon
    
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
        } header: {
            Text("Add certain income")
                .font(.bodyText1())
                .padding(.leading, -18)
                .foregroundStyle(AppGradient.appBlack.value)
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
