//
//  IncomeSettingsView.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 10/3/24.
//

import SwiftUI
import UISystem

struct IncomeSettingsView: View {
    @Environment(CategoryService.self) private var categoryService
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedType: RepeatingType = .random
    @State private var title: String = ""
    @State private var currency: Currency = .usd
    @State private var amount: String = ""
    @State private var icon: Icon = .dollar
    
    var draftIncome = IncomeExpense(
        amount: 10000,
        image: "dollar",
        repeatingType: .random,
        subCategories: [],
        transactions: [],
        id: UUID(),
        title: "",
        currency: .usd,
        categoryType: .income
    )

    var body: some View {
        VStack {
            CustomSegmentedControlView(selection: $selectedType)
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
            
            switch selectedType {
            case .random:
                RandomIncomesView(
                    title: $title,
                    currency: $currency,
                    amount: $amount,
                    icon: $icon,
                    income: draftIncome
                )
                .padding(.top, -10)
            case .certain:
                CertainIncomesView(
                    title: $title,
                    currency: $currency,
                    icon: $icon,
                    income: draftIncome
                )
                .padding(.top, -10)
            }
        }
        .navigationTitle("Income source")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    //сохраняем изменения
                    draftIncome.title = title
                    draftIncome.currency = currency
                    draftIncome.amount = Double(amount) ?? 0
                    draftIncome.image = icon.name
                    draftIncome.repeatingType = selectedType
                    draftIncome.subCategories = categoryService.getSubIncomes()
                    
                    categoryService.createIncome(draftIncome)
                    categoryService.subCategories.removeAll()
                    
                    dismiss()
                    
                    categoryService.incomes.forEach { income in
                        print(income.title)
                    }
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
    @Binding var title: String
    @Binding var currency: Currency
    @Binding var amount: String
    @Binding var icon: Icon
    
    let income: IncomeExpense

    var body: some View {
        List {
            Section {
                TextFieldRowView(
                    inputValue: $title,
                    source: income,
                    title: "Income title",
                    keyboardType: .default, 
                    placeholder: "New income"
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
                    placeholder: "0.0"
                )
            } header: {
                Text("Income main info")
                    .font(.bodyText1())
                    .padding(.bottom, 6)
            }
            
            ChosingItemView(
                selectedItem: $icon,
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
    @Environment(CategoryService.self) private var categoryService
    //@Bindable var income: IncomeExpense
    @Binding var title: String
    @Binding var currency: Currency
    @Binding var icon: Icon
    
    let income: IncomeExpense
    
    var body: some View {
        List {
            Section {
                TextFieldRowView(
                    inputValue: $title,
                    source: income,
                    title: "Income title",
                    keyboardType: .default,
                    placeholder: "New Income"
                )
                
                PickerRowView(
                    currency: $currency,
                    source: income,
                    title: "Currency"
                )
            } header: {
                Text("Income main info")
                    .font(.bodyText1())
                    .padding(.bottom, 6)
            }
            
            ChosingItemView(
                selectedItem: $icon,
                items: Icon.allCases,
                title: "Icon",
                size: CGSize(width: Constants.widthSix, height: Constants.heightFour)
            )
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
            .padding(.vertical, 8)
            
            ForEach(categoryService.subCategories.indices, id: \.self) { index in
                CertainIncomeSettingsView(
                    certainIncome: categoryService.subCategories[index],
                    action: {
                        categoryService.removeSubCategory(at: index)
                    }
                )
            }
            
            PlusButtonView {
                categoryService.createSubIncome()
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            
        }
        .buttonStyle(BorderlessButtonStyle())
        .listSectionSpacing(.compact)
        .onAppear {
            if categoryService.subCategories.isEmpty {
                categoryService.createSubIncome()
            }
        }
    }
}

struct CertainIncomeSettingsView: View {
    @Bindable var certainIncome: SubCategory
    @State private var amount: String = ""
    
    let action: () -> Void
    
    var body: some View {
        Section(header: headerView) {
            TextFieldRowView(
                inputValue: $certainIncome.title,
                source: certainIncome,
                title: "Income title",
                keyboardType: .default,
                placeholder: "New income"
            )
            
            TextFieldRowView(
                inputValue: $amount,
                source: certainIncome,
                title: "Amount",
                keyboardType: .decimalPad,
                placeholder: String(certainIncome.amount)
            )
            .onChange(of: amount) { _, newValue in
                certainIncome.amount = Double(newValue) ?? 0
            }
            
            DateRowView(
                date: $certainIncome.date,
                source: certainIncome,
                title: "Choose date"
            )
            
            NotificationRowView(
                notificationIsOn: $certainIncome.notification,
                source: certainIncome,
                title: "Notifications"
            )
            
            NotificationRowView(
                notificationIsOn: $certainIncome.autoTransaction,
                source: certainIncome,
                title: "Autotransaction"
            )
        }
    }
    
    private var headerView: some View {
        HStack {
            Text("Certain income")
                .font(.bodyText1())
            
            Spacer()
            
            Button(action: action) {
                Image(systemName: "trash")
                    .foregroundStyle(.appBlack)
            }
        }
    }
}
    



#Preview {
    IncomeSettingsView(draftIncome: IncomeExpense(
        amount: 10000,
        image: "dollar",
        repeatingType: .random,
        subCategories: [],
        transactions: [],
        id: UUID(),
        title: "",
        currency: .usd,
        categoryType: .income
    ))
        .environment(CategoryService())
}
