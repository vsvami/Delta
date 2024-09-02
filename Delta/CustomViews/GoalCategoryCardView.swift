//
//  GoalCategoryCardView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 28.08.24.
//

import SwiftUI
import UISystem

struct GoalCategoryCardView: View {
    let title: String
    let currentAmount: Double
    let plannedAmount: Double
    let image: String
    let size: CGSize
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline.bold())
                Spacer()
                
                Text(currentAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .font(.subheadline.bold())
                Text(plannedAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .font(.caption)
                    .foregroundStyle(.textGray)
                
                ProgressView(value: 0.7)
                    .tint(.appBlack)
                    .background(.appBackground)
            }
            .padding([.leading, .top, .trailing], 16)
            
            Image("visionpro")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height / 2.3)
                .clipped()
        }
        .componentBackground(gradient: AppGradient.yellowGradient.value, size: size)
        .shadow()
    }
}

#Preview {
    GoalCategoryCardView(
        title: "Vision Pro",
        currentAmount: 230000,
        plannedAmount: 300000,
        image: "visionpro",
        size: CGSize(width: 144, height: 166)
    )
}
