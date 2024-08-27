//
//  ExpensesIncomeView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 26.08.24.
//

import SwiftUI

struct ExpensesIncomeView: View {
    let title: String
    let currentAmount: String
    let plannedAmount: String
    let size: CGSize
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.caption)
            
            Spacer()
            
            HStack(alignment: .firstTextBaseline) {
                Text(currentAmount)
                    .font(.headline)
                Text("/")
                    .font(.headline)
                Text(plannedAmount)
                    .font(.caption)
                    .foregroundStyle(Color.gray)
                Spacer(minLength: 0)
            }
//          Text("Text")
//              .font(.title) // 28
//          Text("Text")
//              .font(.headline) // 17.bold
//          Text("Text")
//              .font(.subheadline) // 15
//          Text("Text")
//              .font(.caption) //12
        }
        .frame(width: size.width, height: size.height)
        .componentBackground(color: .white)
    }
}

#Preview {
    ExpensesIncomeView(
        title: "Расходы",
        currentAmount: "120000",
        plannedAmount: "78000",
        size: CGSize(width: 124, height: 45)
    )
}
