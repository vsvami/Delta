//
//  AccountGroupCardView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 28.08.24.
//

import SwiftUI
import UISystem

struct AccountGroupCardView: View {
    @State private var isExpanded = false
    
    let title: String
    let amount: String
    let image: String
    let gradient: LinearGradient
    let size: CGSize
    let accounts: Int
    
    var sizeOfButtons: Double {
        30
    }
    var sizeOfAccountsGroup: Double {
        (size.width + 8) * Double(accounts) + sizeOfButtons + 16
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
          
                        ForEach(0..<accounts, id: \.self) { index in
                            AccountCardView(
                                title: "Основной",
                                amount: "₽ 10 000 000",
                                image: "rublesign.circle",
                                gradient: AppGradient.yellowGradient.value,
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
                            amount: amount,
                            image: image,
                            gradient: gradient,
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
    AccountGroupCardView(
        title: "SberBank",
        amount: "₽ 10 000 000",
        image: "building.columns",
        gradient: AppGradient.purpleGradient.value,
        size: CGSize(width: 144, height: 83),
        accounts: 2
    )
}
