//
//  CustomShadowModifier.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 29.08.24.
//

import SwiftUI

struct CustomShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.gray.opacity(0.2), radius: 16)
    }
}

extension View {
    func shadow() -> some View {
        modifier(CustomShadowModifier())
    }
}
