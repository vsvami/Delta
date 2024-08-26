//
//  MyBalanceView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 20.07.24.
//

import SwiftUI

struct MyBalanceView: View {
    let balance: String
    let image: String
    let size: CGSize
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Мой баланс")
                    .font(.caption)
                Spacer()
                Text(balance)
                    .font(.title.bold())
            }
//            .minimumScaleFactor(0.5)
//            .lineLimit(1)

            Spacer()
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(.circle)
                .layoutPriority(1)
                .frame(maxHeight: .infinity)
        }
        .frame(width: size.width, height: size.height)
        .componentBackground(color: .white)
    }
}

#Preview {
    MyBalanceView(
        balance: "₽ 1 200 000",
        image: "person",
        size: CGSize(width: 328, height: 45)
    )
}
