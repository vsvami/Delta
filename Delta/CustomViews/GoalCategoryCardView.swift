//
//  GoalCategoryCardView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 28.08.24.
//

import SwiftUI

struct GoalCategoryCardView: View {
    let title: String
    let currentAmount: Double
    let plannedAmount: Double
    let image: String
    let size: CGSize
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline.bold())
                Spacer()
                
                Text(currentAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .font(.subheadline.bold())
                Text(plannedAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .font(.caption)
                    .foregroundStyle(.appBlack)
                ProgressView(value: 0.7)
                    .tint(.appBlack)

                Image("visionpro")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding([.leading, .bottom, .trailing], -16)
                    .frame(width: size.width, height: size.height / 2)
            }
        }
        .frame(width: size.width, height: size.height)
        .componentBackground(color: .white)
    }
}

#Preview {
    GoalCategoryCardView(
        title: "Vision Pro",
        currentAmount: 230000,
        plannedAmount: 300000,
        image: "visionpro",
        size: CGSize(width: 124, height: 150)
    )
}
