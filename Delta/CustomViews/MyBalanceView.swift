//
//  MyBalanceView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 20.07.24.
//

import SwiftUI
import UISystem

struct MyBalanceView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Мой баланс")
                    .font(.system(size: 12))
                Spacer()
                Text("₽ 120000")
                    .font(.title.bold())
            }
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            
            Spacer()
            
            Image("person")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(.circle)
                .layoutPriority(1)
                .frame(maxHeight: .infinity)
        }
        .frame(height: 55)
        .padding()
        .background(.white)
        .cornerRadius(16)
        .shadow(color: Color.gray.opacity(0.2), radius: 16)
    }
}

#Preview {
    MyBalanceView()
}
