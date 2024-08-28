//
//  ComponentBackgroundModifier.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 27.08.24.
//

import SwiftUI

struct ComponentBackgroundModifier: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(color)
            .cornerRadius(16)
            .shadow(color: Color.gray.opacity(0.2), radius: 16)
    }
}

extension View {
    func componentBackground(color: Color) -> some View {
        modifier(ComponentBackgroundModifier(color: color))
    }
}
