//
//  AccountGroupCardView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 28.08.24.
//

import SwiftUI
import UISystem

struct AccountGroupCardView: View {
    let title: String
    let currency: Currency
    let amount: Double
    let image: String
    let color: String
    let size: CGSize
    let accounts: [Account]
    
    @State private var isExpanded = false
    
    var countOfAccounts: Int {
        accounts.count
    }
    
    var sizeOfButtons: Double {
        30
    }
    var sizeOfAccountsGroup: Double {
        (size.width + 8) * Double(countOfAccounts) + sizeOfButtons + 16
    }
    
    var backgroundColor: LinearGradient {
        AppGradient.getColor(from: color)?.value ?? AppGradient.appWhite.value
    }
    
    var body: some View {
        VStack{
            if isExpanded {
                HStack(spacing: 8) {
                    VStack {
                        Button(action: {
                            withAnimation(.spring()) {
                                isExpanded.toggle()
                            }
                        }) {
                            Image(systemName: "arrow.backward")
                                .font(.subheadline)
                                .foregroundStyle(.appBlack)
                        }
                        .padding(.bottom)
                        
                        //TODO: - Кнопку сделать
                        Image(systemName: "gearshape")
                            .font(.subheadline)
                            .foregroundStyle(.appBlack)
                            .padding(.top)
                    }
                    .frame(width: sizeOfButtons)
                    
                    ForEach(accounts) { account in
                        AccountCardView(
                            title: account.title,
                            currency: account.currency,
                            amount: account.amount,
                            image: account.image,
                            color: account.color,
                            size: CGSize(width: size.width, height: size.height)
                        )
                    }
                }
            } else {
                ZStack{
                    backgroundColor.brightness(-0.1)
                        .frame(width: size.width - 32, height: size.height)
                        .cornerRadius(16)
                        .offset(y: -8)
                    
                    backgroundColor.brightness(-0.07)
                        .frame(width: size.width - 16, height: size.height)
                        .cornerRadius(16)
                        .offset(y: -4)
                    
                    AccountCardView(
                        title: title,
                        currency: currency,
                        amount: amount,
                        image: image,
                        color: color,
                        size: CGSize(width: size.width, height: size.height)
                    )
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        isExpanded.toggle()
                    }
                }
            }
        }
        .frame(
            width: isExpanded ? sizeOfAccountsGroup : size.width,
            height: size.height + 16
        )
        .background(isExpanded ? backgroundColor : nil)
        .cornerRadius(isExpanded ? 24 : 16)
        .animation(.spring(), value: isExpanded)
    }
}

#Preview {
    let dataStore = DataStore.shared
    let group = dataStore.groupOfAccounts
    let title = group?.title ?? ""
    let currency = group?.currency ?? .rub
    let amount = group?.amount ?? 0
    let image = group?.image ?? ""
    let accounts = group?.accounts ?? []
    let backgroundColor = group?.color ?? ""
    
    return AccountGroupCardView(
        title: title,
        currency: currency,
        amount: amount,
        image: image,
        color: backgroundColor,
        size: CGSize(width: 144, height: 90),
        accounts: accounts
    )
}
