//
//  IncomesView.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 9/4/24.
//

import SwiftUI
import UISystem

struct IncomesView: View {
    let incomes: [Income]
    
    init() {
        self.incomes = IncomesMockData().incomes
    }
    
    var body: some View {
        VStack {
            List(incomes, id: \.self) { income in
                BaseCategoryRowView(
                    color: AppGradient.getColor(from: income.color)?.value ?? AppGradient.appGray.value,
                    icon: income.image,
                    title: income.title,
                    currency: income.currency,
                    currentAmount: income.amount,
                    plannedAmount: income.plannedAmount
                )
                .listRowSeparatorTint(Color.gray)
                .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
                .padding(.vertical, 5)
            }
        }
        .navigationTitle("Incomes")
        .navigationBarTitleDisplayMode(.large)
        .toolbarBackground(Color.appBackgroundMini, for: .navigationBar)
        .background(.appBackground)
    }
}

#Preview {
    IncomesView()
}
