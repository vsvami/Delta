//
//  AccountGroupCardView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 28.08.24.
//

import SwiftUI

struct AccountGroupCardView: View {
    let title: String
    let currency: Currency
    let amount: Double
    let image: String
    let gradient: LinearGradient
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
    
    var body: some View {
        
        // TODO: - Delete ScrollView
        ScrollView(.horizontal, showsIndicators: false) {
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
                                color: .yellowGradient, // TODO: заменить градиент на строку
                                size: CGSize(width: size.width, height: size.height)
                            )
                        }
                    }
                } else {
                    ZStack{
                        gradient.brightness(-0.1)
                            .frame(width: size.width - 32, height: size.height)
                            .cornerRadius(16)
                            .offset(y: -8)
                        
                        gradient.brightness(-0.07)
                            .frame(width: size.width - 16, height: size.height)
                            .cornerRadius(16)
                            .offset(y: -4)
                        
                        AccountCardView(
                            title: title, 
                            currency: .rub,
                            amount: amount,
                            image: image,
                            color: gradient,
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
            .background(isExpanded ? gradient : nil)
            .cornerRadius(isExpanded ? 24 : 16)
            .animation(.spring(), value: isExpanded)
        }
        .shadow()
    }
}

#Preview {
    let dataStore = DataStore.shared
    let group = dataStore.groupOfAccounts
    let title = group?.title ?? ""
    let currency = group?.currency ?? .rub
    let amount = group?.totalAmount ?? 0
    let image = group?.image ?? ""
    let accounts = group?.accounts ?? []
 
    // TODO: заменить градиент на строку
    
    return AccountGroupCardView(
        title: title,
        currency: currency,
        amount: amount,
        image: image,
        gradient: .purpleGradient,
        size: CGSize(width: 144, height: 83),
        accounts: accounts
    )
}
