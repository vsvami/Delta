//
//  AccountLargeCardView.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 9/11/24.
//

import SwiftUI
import UISystem

struct AccountLargeCardView: View {
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
                        .font(.heading2())
                        .padding(.bottom, 2)
                    
                    Text(amount.formattedAmount(for: currency))
                        .font(.subheading2())
                }
                .foregroundStyle(color == AppGradient.appBlack.name ? .appWhite : .black)
                
                Spacer(minLength: 0)
            }
            Spacer(minLength: 0)
            
            Image(systemName: image)
                .font(.heading2())
                .foregroundStyle(color == AppGradient.appBlack.name ? .appWhite : .black)
        }
        .padding()
        .componentBackground(
            color: color,
            size: CGSize(width: size.width, height: size.height)
        )
    }
}

#Preview {
    AccountLargeCardView(
        title: "title",
        currency: .rub,
        amount: 15533,
        image: "creditcard",
        color: "appRed",
        size: CGSize(width: Constants.largeAccountCardWidth, height: Constants.largeAccountCardHeight)
    )
}
