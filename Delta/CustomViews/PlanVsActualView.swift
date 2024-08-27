//
//  PlanVsActualView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 27.08.24.
//

import SwiftUI

struct PlanVsActualView: View {
    let size: CGSize
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Circle()
                    .foregroundStyle(.gray)
                    .frame(width: 4, height: 4)
                Text("План")
                    .font(.caption)
                Circle()
                    .foregroundStyle(.black)
                    .frame(width: 4, height: 4)
                Text("Факт")
                    .font(.caption)
                Spacer()
            }
            
            Image("chartMain")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: size.width, height: size.height)
        .componentBackground(color: .white)
    }
}

#Preview {
    PlanVsActualView(size: CGSize(width: 187, height: 106))
}
