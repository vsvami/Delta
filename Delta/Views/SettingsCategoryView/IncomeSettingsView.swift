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
    
    @Bindable var income: IncomeExpense

    var body: some View {
        VStack {
            CustomSegmentedControlView(selection: $income.repeatingType)
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
            
            switch income.repeatingType {
            case .random:
                RandomIncomesView(income: income)
                .padding(.top, -10)
            case .certain:
                CertainIncomesView(income: income)
                .padding(.top, -10)
            }
        }
        .navigationTitle("Income source")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    //сохраняем изменения
                    dismiss()
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
    @Bindable var income: IncomeExpense
    
    @State private var amount: String = ""
    @State private var icon: Icon = .dollar
    
    var body: some View {
        List {
            Section {
                TextFieldRowView(
                    inputValue: $income.title,
                    source: income,
                    title: "Income title",
                    keyboardType: .default, 
                    placeholder: "New income"
                )
                
                PickerRowView(
                    currency: $income.currency,
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
                .onChange(of: amount) { oldValue, newValue in
                    income.amount = Double(newValue) ?? 0
                }
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
            .onChange(of: icon) { oldValue, newValue in
                income.image = newValue.name
            }
        }
        .buttonStyle(BorderlessButtonStyle())
        .listSectionSpacing(.compact)
    }
}

struct CertainIncomesView: View {
    @Environment(CategoryService.self) private var categoryService
    @Bindable var income: IncomeExpense
    
    @State private var icon: Icon = .dollar
    
    var body: some View {
        List {
            Section {
                TextFieldRowView(
                    inputValue: $income.title,
                    source: income,
                    title: "Income title",
                    keyboardType: .default,
                    placeholder: income.title
                )
                
                PickerRowView(
                    currency: $income.currency,
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
            .onChange(of: icon) { oldValue, newValue in
                income.image = newValue.name
            }
            
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
            categoryService.createSubIncome()
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
    IncomeSettingsView(income: IncomeExpense(
        amount: 10000,
        image: "dollar",
        repeatingType: .random,
        subCategories: [],
        transactions: [],
        categoryService: CategoryService(),
        id: UUID(),
        title: "",
        currency: .usd,
        categoryType: .income
    ))
        .environment(CategoryService())
}
