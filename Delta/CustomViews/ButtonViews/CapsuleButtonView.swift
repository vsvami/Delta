//
//  CapsuleButtonView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 30.08.24.
//

import SwiftUI

struct CapsuleButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.metadata3())
                .padding()
                .frame(height: 32)
                .foregroundStyle(.appBlack)
        }
        .background(.appBackgroundMini)
        .clipShape(Capsule())
    }
}

#Preview {
    CapsuleButtonView(title: "Income", action: {})
}