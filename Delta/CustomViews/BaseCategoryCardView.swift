//
//  BaseCategoryCardView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 27.08.24.
//

import SwiftUI

struct BaseCategoryCardView: View {
    let title: String
    let subtitle: String
    let icon: String
    let currentAmount: Double
    let plannedAmount: Double
    let image: String
    let size: CGSize
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.subheadline.bold())
                    Text(subtitle)
                        .font(.caption)
                        .foregroundStyle(.textGray)
                }
                
                Spacer()
                ZStack {
                    Circle()
                        .frame(height: 32)
                        .foregroundStyle(.appBackground)
                    Image(systemName: image)
                        .font(.caption.bold())
                        .foregroundStyle(.appBlack)
                }
            }
            Spacer()
            
            ZStack {
                Circle()
                    .stroke(.appBackground, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    .frame(height: 40)
                Circle()
                    .trim(from: 0, to: 0.65)
                    .rotation(.degrees(-90))
                    .stroke(.appBlack, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    .frame(height: 40)
                Image(systemName: icon)
                    .font(.subheadline)
            }
            Spacer()
            
            Text(currentAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .font(.subheadline.bold())
            Text(plannedAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .font(.caption)
                .foregroundStyle(.textGray)
        }
        .padding()
        .componentBackground(gradient: .yellowGradient, size: size)
        .shadow()
    }
}

#Preview {
    BaseCategoryCardView(
        title: "Зарплата",
        subtitle: "Подзаголовок",
        icon: "briefcase",
        currentAmount: 58000,
        plannedAmount: 37000,
        image: "rublesign",
        size: CGSize(width: 144, height: 166)
    )
}
