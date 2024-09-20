//
//  AccountGroupCardView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 28.08.24.
//

import SwiftUI
import UISystem

struct AccountGroupCardView: View {
    @EnvironmentObject var router: Router
    
    let accountsGroup: GroupOfAccounts
    
    @State private var isExpanded = false
    
    var countOfAccounts: Int {
        accountsGroup.accounts.count
    }
    
    var sizeOfButtons: Double {
        30
    }
    var sizeOfAccountsGroup: Double {
        (Constants.widthTwo + 16) * Double(countOfAccounts) + sizeOfButtons + 32
    }
    
    var backgroundColor: LinearGradient {
        AppGradient.getColor(from: accountsGroup.color)?.value ?? AppGradient.appWhite.value
    }
    
    var body: some View {
        VStack{
            if isExpanded {
                HStack(spacing: 16) {
                    VStack {
                        Button(action: {
                            withAnimation(.spring()) {
                                isExpanded.toggle()
                            }
                        }) {
                            Image(systemName: "arrow.backward")
                                .font(.subheadline)
                                .foregroundStyle(accountsGroup.color == AppGradient.appBlack.name ? .appWhite : .black)
                        }
                        .padding(.bottom)
                        
                        //TODO: - Кнопку сделать
//                        Image(systemName: "gearshape")
//                            .font(.subheadline)
//                            .foregroundStyle(accountsGroup.color == AppGradient.appBlack.name ? .appWhite : .black)
//                            .padding(.top)
                        Button(action: {
                            router.navigateTo(.accountGroupSettings(group: accountsGroup))
                        }) {
                            Image(systemName: "gearshape")
                                .font(.subheadline)
                                .foregroundStyle(accountsGroup.color == AppGradient.appBlack.name ? .appWhite : .black)
                                .padding(.top)
                        }
                    }
                    .frame(width: sizeOfButtons)
                    
                    ForEach(accountsGroup.accounts) { account in
                        AccountCardView(
                            title: account.title,
                            currency: account.currency,
                            amount: account.amount,
                            image: account.image,
                            color: account.color,
                            size: CGSize(width: Constants.widthTwo, height: Constants.heightThree)
                        )
                    }
                }
            } else {
                ZStack{
                    backgroundColor.brightness(-0.1)
                        .frame(width: Constants.widthTwo - 32, height: Constants.heightThree)
                        .cornerRadius(16)
                        .offset(y: -8)
                    
                    backgroundColor.brightness(-0.07)
                        .frame(width: Constants.widthTwo - 16, height: Constants.heightThree)
                        .cornerRadius(16)
                        .offset(y: -4)
                    
                    AccountCardView(
                        title: accountsGroup.title,
                        currency: accountsGroup.currency,
                        amount: accountsGroup.amount,
                        image: accountsGroup.image,
                        color: accountsGroup.color,
                        size: CGSize(width: Constants.widthTwo, height: Constants.heightThree)
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
            width: isExpanded ? sizeOfAccountsGroup : Constants.widthTwo,
            height: Constants.heightThree + 16
        )
        .background(isExpanded ? backgroundColor : nil)
        .cornerRadius(isExpanded ? 24 : 16)
        .animation(.spring(), value: isExpanded)
    }
}

#Preview {
    let group = DataManager.shared.getCategories(with: .groupOfAccounts).first as? GroupOfAccounts
    
    return AccountGroupCardView(accountsGroup: group!)
}
