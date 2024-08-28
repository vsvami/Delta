//
//  InvestmentCategoryCardView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 28.08.24.
//

import SwiftUI
import Charts

struct Sale: Identifiable {
    var id: String = UUID().uuidString
    var sales: Int
    var time: String
}

var dailySales: [Sale] = [
    .init(sales: 10, time: "11:00"),
    .init(sales: 120, time: "12:00"),
    .init(sales: 80, time: "1:00"),
    .init(sales: 130, time: "2:00"),
    .init(sales: 240, time: "3:00"),
    .init(sales: 120, time: "4:00"),
    .init(sales: 50, time: "5:00"),
    .init(sales: 150, time: "6:00")
]

struct InvestmentCategoryCardView: View {
    let title: String
    let subtitle: String
    let amount: Double
    let percent: Double
    let image: String
    let size: CGSize
    
    var body: some View {
        ZStack {
            
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
                    } 
                }
                
                Spacer()
                
                Chart {
                    ForEach(dailySales) { sale in
                        LineMark(
                            x: .value("", sale.time),
                            y: .value("", sale.sales)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(.appBlack)
                    }
                }
                .chartXAxis(.hidden) // Скрывает ось X
                .chartYAxis(.hidden) // Скрывает ось Y
                .chartXAxisLabel("") // Убирает подписи на оси X
                .chartYAxisLabel("") // Убирает подписи на оси Y
                .chartPlotStyle { plotArea in
                    plotArea
                        .background(Color.clear) // Убирает фон сетки
                        .border(Color.clear) // Убирает рамку вокруг сетки
                }
                .frame(width: size.width, height: size.height / 2)
                
                Spacer()
                
                Text(amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .font(.subheadline.bold())
                Text(percent, format: .percent)
                    .font(.caption)
                    .foregroundStyle(.appBlack)
            }
            
        }
        .frame(width: size.width, height: size.height)
        .componentBackground(color: .white)
    }
}

#Preview {
    InvestmentCategoryCardView(
        title: "BTC",
        subtitle: "Bitcoin",
        amount: 60142,
        percent: 0.0512,
        image: "bitcoinsign.circle.fill",
        size: CGSize(width: 124, height: 150)
    )
}
