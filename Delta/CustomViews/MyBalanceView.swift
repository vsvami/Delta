//
//  MyBalanceView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 20.07.24.
//

import SwiftUI

struct MyBalanceView: View {
    let totalBalance: Double
    let myBalance: Double
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
                            .foregroundColor(isBalanceSelected ? .black : .gray)
                    }
                    Button(action: {
                        isBalanceSelected = false
                    }) {
                        Text("My balance")
                            .foregroundColor(!isBalanceSelected ? .black : .gray)
                    }
                }
                .font(.caption)
                
                Spacer(minLength: 0)
                
                Text(isBalanceSelected ? totalBalance : myBalance, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .font(.title.bold())
            }
            Spacer()
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(.circle)
        }
        .padding()
        .componentBackground(gradient: .yellowGradient, size: size)
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
        image: "person",
        size: CGSize(width: 360, height: 78)
    )
}
