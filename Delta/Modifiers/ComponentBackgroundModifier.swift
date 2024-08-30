//
//  ComponentBackgroundModifier.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 27.08.24.
//

import SwiftUI

struct ComponentBackgroundModifier: ViewModifier {
    let gradient: LinearGradient
    let size: CGSize
    
    init(gradient: LinearGradient, size: CGSize) {
        self.gradient = gradient
        self.size = size
    }
    
    func body(content: Content) -> some View {
        content
            .frame(width: size.width, height: size.height)
            .background(gradient)
            .cornerRadius(16)
    }
}

extension View {
    func componentBackground(
        gradient: LinearGradient,
        size: CGSize
    ) -> some View {
        modifier(ComponentBackgroundModifier(gradient: gradient, size: size))
    }
}
