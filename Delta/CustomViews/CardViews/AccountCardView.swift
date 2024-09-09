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
                    
                    Text(amount.formattedAmount(for: currency))
                        .font(.metadata3())
                }
                .foregroundStyle(color == AppGradient.appBlack.name ? .appWhite : .black)
                
                Spacer(minLength: 0)
            }
            Spacer(minLength: 0)
            
            Image(systemName: image)
                .font(.bodyText2())
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
    AccountCardView(
        title: "title",
        currency: .rub,
        amount: 15533,
        image: "creditcard",
        color: "appRed",
        size: CGSize(width: Constants.widthTwo, height: Constants.heightThree)
    )
}
