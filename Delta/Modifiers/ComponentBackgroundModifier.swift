//
//  ComponentBackgroundModifier.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 27.08.24.
//

import SwiftUI

struct ComponentBackgroundModifier: ViewModifier {
    let color: Color?
    let gradient: LinearGradient?

    init(color: Color? = nil, gradient: LinearGradient? = nil) {
        self.color = color
        self.gradient = gradient
    }

    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                Group {
                    if let gradient = gradient {
                        gradient
                    } else if let color = color {
                        color
                    } else {
                        Color.clear
                    }
                }
            )
            .cornerRadius(16)
            .shadow(color: Color.gray.opacity(0.3), radius: 16)
    }
}

extension View {
    func componentBackground(color: Color) -> some View {
        modifier(ComponentBackgroundModifier(color: color))
    }

    func componentBackground(gradient: LinearGradient) -> some View {
        modifier(ComponentBackgroundModifier(gradient: gradient))
    }
}
