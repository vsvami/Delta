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
    let size: CGSize
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.caption)
                Spacer()
                Text(currentAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .font(.subheadline.bold())
                Text(plannedAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .font(.caption)
                    .foregroundStyle(.textGray)
                
            }
            Spacer(minLength: 0)
        }
        .padding()
        .componentBackground(gradient: .yellowGradient, size: size)
        .shadow()
    }
}

#Preview {
    ExpenseIncomeView(
        title: "Расходы",
        currentAmount: 120000,
        plannedAmount: 78000,
        size: CGSize(width: 144, height: 78)
    )
}
