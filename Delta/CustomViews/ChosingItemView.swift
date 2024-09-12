//
//  ChosingIconView.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 9/12/24.
//

import SwiftUI
import UISystem

struct ChosingItemView<T>: View {
    @Binding var selectedItem: T
    let items: [T]
    let title: String
    let size: CGSize
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheading2())
                .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    if let items = items as? [Icon], let selectedItem1 = selectedItem as? Icon {
                        ForEach(items, id: \.self) { icon in
                            ZStack {
                                Circle()
                                    .fill(.appGray)
                                    .frame(width: 35)
                                    .overlay(
                                        Circle()
                                            .stroke(selectedItem1 == icon ? Color.appBlack : Color.clear, lineWidth: 2.5)
                                    )
                                    .onTapGesture {
                                        selectedItem = icon as! T
                                    }
                                Image(systemName: icon.name)
                                    .foregroundStyle(.appBlack)
                            }
                        }
                    } else if let items = items as? [AppGradient], let selectedItem1 = selectedItem as? AppGradient {
                        ForEach(items, id: \.self) { color in
                            Circle()
                                .fill(color.value)
                                .frame(width: 35)
                                .overlay(
                                    Circle()
                                        .stroke(selectedItem1 == color ? Color.appBlack : Color.clear, lineWidth: 2.5)
                                )
                                .onTapGesture {
                                    selectedItem = color as! T
                                }
                        }
                    } else {
                        EmptyView()
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
                
            }
        }
        .componentBackground(
            color: AppGradient.appBackgroundMini.name,
            size: CGSize(width: size.width, height: size.height)
        )
    }
}

#Preview {
    ChosingItemView(selectedItem: .constant(Icon.creditcard), items: Icon.allCases, title: "Icons", size: CGSize(width: Constants.largeAccountCardWidth, height: Constants.largeAccountCardHeight))
}
