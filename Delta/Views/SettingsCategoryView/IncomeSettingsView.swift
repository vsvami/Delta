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
    @State private var selectedIcon: Icon = .dollar
    
    @State private var certainIncomeTitle: String = ""
    @State private var date: Date = Date()
    @State private var notificationIsOn: Bool = false
    @State private var isAutotransaction: Bool = false
    
    let income: IncomeExpense = DataStore.shared.incomes.last!
    
    var body: some View {
        VStack {
            CustomSegmentedControlView(selection: $selection)
                .padding(.horizontal, 20)
                .padding(.top, 16)
            
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
                    income: income,
                    incomeTitle: $incomeTitle,
                    currency: $currency,
                    selectedIcon: $selectedIcon
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
    @Environment(CategoryService.self) private var categoryService
    
    @Binding var incomeTitle: String
    @Binding var currency: Currency
    @Binding var selectedIcon: Icon
    
    let income: IncomeExpense
    
    init(
        income: IncomeExpense,
        incomeTitle: Binding<String>,
        currency: Binding<Currency>,
        selectedIcon: Binding<Icon>
    ) {
        self.income = income
        self._incomeTitle = incomeTitle
        self._currency = currency
        self._selectedIcon = selectedIcon
    }
    
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
            
            ForEach(categoryService.subCategories.indices, id: \.self) { index in
                CertainIncomeSettingsView(
                    certainIncome: categoryService.subCategories[index],
                    action: {
                        categoryService.removeSubCategory(at: index)
                    }
                )
            }
            
            PlusButtonView {
                categoryService.createSubCategory()
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            
        }
        .buttonStyle(BorderlessButtonStyle())
        .listSectionSpacing(.compact)
        .onAppear {
            categoryService.createSubCategory()
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
            .onChange(of: amount) { oldValue, newValue in
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
    IncomeSettingsView()
        .environment(CategoryService())
}
