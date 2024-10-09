//
//  TabBarView.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 8/29/24.
//

import SwiftUI
import UISystem

enum Tab: CaseIterable {
    case main
    case analytic
    case shoppingList
    case settings

    var iconName: String {
        switch self {
        case .main:
            "house"
        case .analytic:
            "chartPie"
        case .shoppingList:
            "list"
        case .settings:
            "gearshape"
        }
    }
}

struct CustomTabBar: View {
    @Environment(Router.self) private var router

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(AppGradient.appBackground.value)
                .frame(height: 84)

            HStack {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Image(tab.iconName)
                        .renderingMode(.template)
                        .foregroundStyle(router.selectedTabRoute == tab ? Color.appBlack : Color.gray)
                        .onTapGesture {
                            router.selectedTabRoute = tab
                        }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 32)
            }
            .padding(.bottom)
        }
        .padding(.bottom, -30)
    }
}

#Preview {
    CustomTabBar()
        .environment(Router())
}

