//
//  PlanVsActualView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 27.08.24.
//

import SwiftUI
import UISystem

struct PlanVsActualView: View {
    let size: CGSize
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Circle()
                    .foregroundStyle(.textGray)
                    .frame(width: 4, height: 4)
                Text("Plan")
                    .font(.metadata3())
                Circle()
                    .foregroundStyle(.appBlack)
                    .frame(width: 4, height: 4)
                Text("Actual")
                    .font(.metadata3())
                Spacer()
            }
            
            Image("chartMain")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding()
        .componentBackground(color: AppGradient.appBackgroundMini.name, size: size)
        .shadow()
    }
}

#Preview {
    PlanVsActualView(size: CGSize(width: 211, height: 146))
}
