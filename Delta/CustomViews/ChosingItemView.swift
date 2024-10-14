//
//  ChosingIconView.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 9/12/24.
//

import SwiftUI
import UISystem

struct ColorPickerView: View {
    @Binding var selectedItem: AppGradient
    
    let items: [AppGradient]
    let title: String
    let size: CGSize
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheading2())
                .padding(.horizontal, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(items, id: \.self) { color in
                        Circle()
                            .fill(color.value)
                            .frame(width: 35)
                            .shadow(color: selectedItem == color ? Color.gray.opacity(0.8) : Color.clear, radius: 3)
                            .overlay(
                                Circle()
                                    .stroke(selectedItem == color ? Color.appBlack : Color.clear, lineWidth: 2)
                            )
                            .onTapGesture {
                                selectedItem = color
                            }
                    }
                    .frame(height: 40)
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

struct IconPickerView: View {
    @Binding var selectedItem: Icon
    
    let items: [Icon]
    let title: String
    let size: CGSize
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheading2())
                .padding(.horizontal, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(items, id: \.self) { icon in
                        ZStack {
                            Circle()
                                .fill(.appGray)
                                .frame(width: 35)
                                .shadow(color: selectedItem == icon ? Color.gray.opacity(0.8) : Color.clear, radius: 3)
                                .overlay(
                                    Circle()
                                        .stroke(selectedItem == icon ? Color.appBlack : Color.clear, lineWidth: 2)
                                )
                                .onTapGesture {
                                    selectedItem = icon
                                }
                            Image(systemName: icon.name)
                                .foregroundStyle(.appBlack)
                        }
                        .frame(height: 40)
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
    IconPickerView(selectedItem: .constant(Icon.creditcard), items: Icon.allCases, title: "Icons", size: CGSize(width: Constants.widthThree, height: Constants.heightSix))
}
