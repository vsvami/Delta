//
//  BaseCategoryCardView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 27.08.24.
//

import SwiftUI

struct BaseCategoryCardView: View {
    var body: some View {
        ZStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Зарплата")
                        .font(.subheadline.bold())
                    Spacer()
                    Text("58000")
                        .font(.subheadline.bold())
                    Text("37000")
                        .font(.caption)
                }
                
                Spacer()
                ZStack {
                    Circle()
                        .frame(height: 28)
                        .foregroundStyle(.gray)
                    Text("₽")
                        .font(.subheadline)
                }
            }
            
            Circle()
                .stroke(.gray, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .frame(height: 55)
            Circle()
                .trim(from: 0, to: 0.65)
                .rotation(.degrees(-90))
                .stroke(.black, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .frame(height: 55)
            Image(systemName: "briefcase")
                .font(.headline)
        }
        .frame(width: 124, height: 150)
        .componentBackground(color: .white)
    }
}

#Preview {
    BaseCategoryCardView()
}
