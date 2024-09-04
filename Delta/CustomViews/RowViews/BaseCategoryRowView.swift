//
//  BaseCategoryRowView.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 9/2/24.
//

import SwiftUI
import UISystem

struct BaseCategoryRowView: View {
    let color: LinearGradient
    let icon: String
    let title: String
    let currency: Currency
    let currentAmount: Double
    let plannedAmount: Double
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Circle()
                    .frame(width: 34)
                    .foregroundStyle(color)
                
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 16, height: 14)
            }
            
            Text(title)
                .font(.subheading2())
            
            Spacer()
            
            VStack(alignment: .trailing) {
                HStack(alignment: .bottom, spacing: 0) {
                    Text("\(currentAmount.formattedAmount(for: currency)) / ")
                        .font(.bodyText1())
                    
                    Text("\(plannedAmount.formattedAmount(for: currency))")
                        .font(.metadata2())
                        .foregroundStyle(AppGradient.textGray.value)
                }
                
                ProgressView(value: currentAmount, total: plannedAmount)
                    .progressViewStyle(LinearProgressViewStyle(tint: .appBlack))
                    .frame(minWidth: 80, maxWidth: 120)
            }
        }
    }
}

#Preview {
    BaseCategoryRowView(
        color: AppGradient.appGray.value,
        icon: "house",
        title: "Аренда", 
        currency: .usd,
        currentAmount: 58000,
        plannedAmount: 78000
    )
}
