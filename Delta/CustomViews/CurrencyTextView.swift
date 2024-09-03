//
//  CurrencyTextView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 03.09.24.
//

import SwiftUI

struct CurrencyTextView: View {
    let currency: Currency
    let amount: Double
    
    var body: some View {
        HStack(spacing: 4) {
            Text(currency.symbol)
            Text( amount, format: .number.precision(.fractionLength(2)))
        }
    }
}

#Preview {
    CurrencyTextView(currency: .rub, amount: 15235.525543)
}
