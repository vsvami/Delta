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
                        .foregroundStyle(.appBlack)
                }
                
                Spacer()
                ZStack {
                    Circle()
                        .frame(height: 32)
                        .foregroundStyle(.appBackground)
                    Image(systemName: image)
                        .font(.caption.bold())
                        .foregroundStyle(.appBlack)
                } // Лучше бы передавать View под разные Категории
            }
            
            Spacer()
            
            ZStack {
                Circle()
                    .stroke(.appBackground, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .frame(height: 55)
                
                Circle()
                    .trim(from: 0, to: 0.65)
                    .rotation(.degrees(-90))
                    .stroke(.appBlack, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                    .frame(height: 55)
                Image(systemName: icon)
                    .font(.headline)
            } // Лучше бы передавать View под разные Категории
            
            Spacer()
            
            Text(currentAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .font(.subheadline.bold())
            Text(plannedAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .font(.caption)
                .foregroundStyle(.appBlack)
        }
        .frame(width: size.width, height: size.height)
        .componentBackground(color: .white)
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
        size: CGSize(width: 124, height: 150)
    )
}
