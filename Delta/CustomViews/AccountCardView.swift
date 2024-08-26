//
//  AccountCardView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 27.08.24.
//

import SwiftUI

struct AccountCardView: View {
    let size: CGSize
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Sber Bank")
                        .font(.headline)
                    
                    Spacer()
                    
                    Text("₽ 10 000 000")
                        .font(.caption)
                }
                
                Spacer()
            }
            
            Spacer()
            
            Image(systemName: "rublesign.circle")
                .font(.headline)
        }
        .frame(width: size.width, height: size.height)
        .componentBackground(color: .appMint)
    }
}

#Preview {
    AccountCardView(size: CGSize(width: 124, height: 65))
}
