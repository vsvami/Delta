//
//  ExpensesIncomeView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 26.08.24.
//

import SwiftUI
import UISystem

struct ExpensesIncomeView: View {
    let title: String
    let currentAmount: Double
    let plannedAmount: Double
    let size: CGSize
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.caption)
                Text(currentAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .font(.headline)
                Text(plannedAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .font(.caption)
                    .foregroundStyle(.appBlack)
                
            }
            Spacer(minLength: 0)
        }
//            HStack(alignment: .firstTextBaseline) {
//                Text(currentAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
//                    .font(.headline)
//                Text("/")
//                    .font(.headline)
//                Text(plannedAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
//                    .font(.caption)
//                    .foregroundStyle(.appBlack)
//                Spacer(minLength: 0)
//            }
        .frame(width: size.width, height: size.height)
        .componentBackground(color: .appBackgroundMini)
    }
}

#Preview {
    ExpensesIncomeView(
        title: "Расходы",
        currentAmount: 120000,
        plannedAmount: 78000,
        size: CGSize(width: 124, height: 45)
    )
}
