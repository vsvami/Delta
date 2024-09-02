//
//  AccountCardView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 27.08.24.
//

import SwiftUI

struct AccountCardView: View {
    let title: String
    let currency: Currency
    let amount: Double
    let image: String
    let color: LinearGradient
    let size: CGSize
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                    Spacer(minLength: 0)
                    Text(String(amount))
                        .font(.caption)
                }
                Spacer(minLength: 0)
            }
            Spacer(minLength: 0)
            
            Image(systemName: image)
                .font(.headline)
        }
        .padding()
        .componentBackground(gradient: color, size: size)
    }
}

#Preview {
    let dataStore = DataStore.shared
    let account = dataStore.accounts.first
    let title = account?.title ?? ""
    let currency = account?.currency ?? .rub
    let amount = account?.amount ?? 0
    let image = account?.image ?? ""
    // TODO: заменить градиент на строку
    
    return AccountCardView(
        title: title,
        currency: currency,
        amount: amount,
        image: image,
        color: .greenGradient,
        size: CGSize(width: 144, height: 90)
    )
}
