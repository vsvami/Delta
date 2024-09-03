//
//  AccountCardView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 27.08.24.
//

import SwiftUI
import UISystem

struct AccountCardView: View {
    let title: String
    let currency: Currency
    let amount: Double
    let image: String
    let color: String
    let size: CGSize
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.subheading1())
                    Spacer(minLength: 0)
                    
                    CurrencyTextView(currency: currency, amount: amount)
                        .font(.metadata3())
                }
                Spacer(minLength: 0)
            }
            Spacer(minLength: 0)
            
            Image(systemName: image)
                .font(.subheading1())
        }
        .padding()
        .componentBackground(color: color, size: size)
    }
}

#Preview {
    let dataStore = DataStore.shared
    let account = dataStore.accounts.first
    let title = account?.title ?? ""
    let currency = account?.currency ?? .usd
    let amount = account?.amount ?? 0
    let image = account?.image ?? ""
    let backgroundColor = account?.color ?? ""
    
    return AccountCardView(
        title: title,
        currency: currency,
        amount: amount,
        image: image,
        color: backgroundColor,
        size: CGSize(width: 144, height: 90)
    )
}
