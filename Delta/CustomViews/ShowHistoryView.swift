//
//  ShowHistoryView.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 9/13/24.
//

import SwiftUI
import UISystem

struct ShowHistoryView: View {
    let title: String
    let buttonTitle: String
    let action: () -> Void
    let size: CGSize
    
    var body: some View {
        HStack {
            Text(title)
            
            Spacer()
            
            Button(action: action, label: {
                Text(buttonTitle)
                Image(systemName: "chevron.forward")
            })
            .tint(.gray)
        }
        .padding()
        .componentBackground(
            color: AppGradient.appBackgroundMini.name,
            size: CGSize(width: size.width, height: size.height)
        )
    }
}

#Preview {
    ShowHistoryView(title: "History",
                    buttonTitle: "Show",
                    action: {},
                    size: CGSize(width: Constants.accountSettingsWidth, height: Constants.heightFive))
}
