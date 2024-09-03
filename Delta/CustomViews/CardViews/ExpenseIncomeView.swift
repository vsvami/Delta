//
//  ExpenseIncomeView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 26.08.24.
//

import SwiftUI
import UISystem

struct ExpenseIncomeView: View {
    let title: String
    let currentAmount: Double
    let plannedAmount: Double
    let currency: Currency
    let size: CGSize
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.metadata3())
                
                Spacer(minLength: 4)
                
                CurrencyTextView(currency: currency, amount: currentAmount)
                    .font(.bodyText1())
                
                Spacer(minLength: 0)
                
                CurrencyTextView(currency: currency, amount: plannedAmount)
                    .font(.bodyText2())
                    .foregroundStyle(.textGray)
                
            }
            Spacer(minLength: 0)
        }
        .padding()
        .componentBackground(color: AppGradient.appBackgroundMini.name, size: size)
        .shadow()
    }
}

#Preview {
    ExpenseIncomeView(
        title: "Расходы",
        currentAmount: 120000.87,
        plannedAmount: 78000.57,
        currency: .jpy, //TODO: - задать основную валюту приложения
        size: CGSize(width: 144, height: 78)
    )
}
