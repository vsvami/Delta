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
    
    var income: IncomeExpense?
    
    init(income: IncomeExpense = IncomeExpense(
        amount: 0,
        image: "",
        repeatingType: .random,
        subCategories: [],
        transactions: [],
        id: UUID(),
        title: "",
        currency: .usd,
        categoryType: .income
    )) {
        self.income = income
    }

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
                    icon: $icon
                )
                .padding(.top, -10)
            case .certain:
                CertainIncomesView(
                    title: $title,
                    currency: $currency,
                    icon: $icon
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
                    income?.title = title
                    income?.currency = currency
                    income?.amount = Double(amount) ?? 0
                    income?.image = icon.name
                    income?.repeatingType = selectedType
                    income?.subCategories = categoryService.getSubIncomes()
                    
                    categoryService.createIncome(income ?? IncomeExpense(
                        amount: 0,
                        image: "",
                        repeatingType: .random,
                        subCategories: [],
                        transactions: [],
                        id: UUID(),
                        title: "",
                        currency: .usd,
                        categoryType: .income
                    ))
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

    var body: some View {
        List {
            Section {
                TextFieldRowView(
                    inputValue: $title,
                    title: "Income title",
                    keyboardType: .default, 
                    placeholder: "New income"
                )
                
                PickerRowView(
                    currency: $currency,
                    title: "Currency"
                )
                
                TextFieldRowView(
                    inputValue: $amount,
                    title: "Amount",
                    keyboardType: .decimalPad, 
                    placeholder: "0.0"
                )
            } header: {
                Text("Income main info")
                    .font(.bodyText1())
                    .padding(.bottom, 6)
            }
            
            IconPickerView(
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
    @Binding var title: String
    @Binding var currency: Currency
    @Binding var icon: Icon
    
    var body: some View {
        List {
            Section {
                TextFieldRowView(
                    inputValue: $title,
                    title: "Income title",
                    keyboardType: .default,
                    placeholder: "New Income"
                )
                
                PickerRowView(
                    currency: $currency,
                    title: "Currency"
                )
            } header: {
                Text("Income main info")
                    .font(.bodyText1())
                    .padding(.bottom, 6)
            }
            
            IconPickerView(
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
                title: "Income title",
                keyboardType: .default,
                placeholder: "New income"
            )
            
            TextFieldRowView(
                inputValue: $amount,
                title: "Amount",
                keyboardType: .decimalPad,
                placeholder: String(certainIncome.amount)
            )
            .onChange(of: amount) { _, newValue in
                certainIncome.amount = Double(newValue) ?? 0
            }
            
            DateRowView(
                date: $certainIncome.date,
                title: "Choose date"
            )
            
            NotificationRowView(
                notificationIsOn: $certainIncome.notification,
                title: "Notifications"
            )
            
            NotificationRowView(
                notificationIsOn: $certainIncome.autoTransaction,
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
    IncomeSettingsView()
        .environment(CategoryService())
}
