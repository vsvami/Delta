//
//  MyBalanceView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 20.07.24.
//

import SwiftUI

struct MyBalanceView: View {
    let balance: Double
    let image: String
    let size: CGSize
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Мой баланс")
                    .font(.caption)
                Spacer(minLength: 0)
                Text(balance, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .font(.title.bold())
            }

            Spacer()
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(.circle)
                .frame(maxHeight: .infinity)
        }
        .frame(width: size.width, height: size.height)
        .componentBackground(color: .white)
    }
}

#Preview {
    MyBalanceView(
        balance: 1200000,
        image: "person",
        size: CGSize(width: 328, height: 45)
    )
}
