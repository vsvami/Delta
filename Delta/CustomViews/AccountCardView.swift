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
    let color: Color
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
                Spacer()
            }
            
            Spacer(minLength: 0)
            Image(systemName: image)
                .font(.headline)
        }
        .frame(width: size.width, height: size.height)
        .componentBackground(color: color)
    }
}

#Preview {
    AccountCardView(
        title: "Sber Bank",
        amount: "₽ 10 000 000",
        image: "rublesign.circle",
        color: .appMint,
        size: CGSize(width: 124, height: 60)
    )
}
