//
//  MainView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 08.07.24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Button("Incomes") {
                router.navigateTo(.incomes)
            }
        }
        .padding()
    }
}

#Preview {
    MainView()
}
