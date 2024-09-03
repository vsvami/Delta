//
//  MyBalanceView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 20.07.24.
//

import SwiftUI
import UISystem

struct MyBalanceView: View {
    let totalBalance: Double
    let myBalance: Double
    let currency: Currency
    let image: String
    let size: CGSize
    
    @State private var isBalanceSelected: Bool = true
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack(spacing: 12) {
                    Button(action: {
                        isBalanceSelected = true
                    }) {
                        Text("Total balance")
                            .foregroundColor(isBalanceSelected ? .appBlack : .gray)
                    }
                    Button(action: {
                        isBalanceSelected = false
                    }) {
                        Text("My balance")
                            .foregroundColor(!isBalanceSelected ? .appBlack : .gray)
                    }
                }
                .font(.metadata3())
                
                Spacer(minLength: 0)
                
                Text(
                    isBalanceSelected
                    ? totalBalance.formattedAmount(for: currency)
                    : myBalance.formattedAmount(for: currency)
                )
                    .font(.heading1())
            }
            Spacer()
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(.circle)
        }
        .padding()
        .componentBackground(color: AppGradient.appBackgroundMini.name, size: size)
        .shadow()
    }
}

#Preview {
    let dataStore = DataStore.shared
    let totalBalance = dataStore.accounts.reduce(0) { $0 + $1.amount }
    let myBalance = dataStore.people.first?.balance
    
    return MyBalanceView(
        totalBalance: totalBalance,
        myBalance: myBalance ?? 0,
        currency: .gel, //TODO: - задать основную валюту приложения
        image: "person",
        size: CGSize(width: 360, height: 78)
    )
}
