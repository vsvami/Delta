//
//  AccountCardView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 27.08.24.
//

import SwiftUI

struct AccountCardView: View {
    let title: String
    let amount: String
    let image: String
    let gradient: LinearGradient
    let size: CGSize
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                    Spacer(minLength: 0)
                    Text(amount)
                        .font(.caption)
                }
                Spacer(minLength: 0)
            }
            Spacer(minLength: 0)
            
            Image(systemName: image)
                .font(.headline)
        }
        .padding()
        .componentBackground(gradient: gradient, size: size)
    }
}

#Preview {
    AccountCardView(
        title: "Sber Bank",
        amount: "₽ 10 000 000",
        image: "rublesign.circle",
        gradient: .greenGradient,
        size: CGSize(width: 144, height: 90)
    )
}
