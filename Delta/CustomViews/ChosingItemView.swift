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
    
    var body: some View {
        VStack {
            Text(title)
                .font(.subheading2())
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    if let items = items as? [Icon], let selectedItem1 = selectedItem as? Icon {
                        ForEach(items, id: \.self) { icon in
                            ZStack {
                                Circle()
                                    .fill(.appGray)
                                    .frame(width: 35)
                                    .overlay(
                                        Circle()
                                            .stroke(selectedItem1 == icon ? Color.black : Color.clear, lineWidth: 2)
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
                                        .stroke(selectedItem1 == color ? Color.black : Color.clear, lineWidth: 2)
                                )
                                .onTapGesture {
                                    selectedItem = color as! T
                                }
                        }
                    }
                    
                }
                .padding()
            }
        }
    }
}

#Preview {
    ChosingItemView(selectedItem: .constant(Icon.creditcard), items: Icon.allCases, title: "Icons")
}
