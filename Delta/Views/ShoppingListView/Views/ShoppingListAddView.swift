//
//  ShoppingListAddView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 19.09.24.
//

import SwiftUI

struct ShoppingListAddView: View {
    @Binding  var text: String
    @Bindable var category: ShoppingListCategory
    var action: () -> Void
    
    var body: some View {
        HStack {
            Image(systemName: "plus.circle.fill")
                .font(.title2)
                .foregroundColor(.appBlack)
            TextField("Add", text: $text)
                .onSubmit {
                    guard !text.isEmpty else { return }
                    withAnimation {
                        action()
                    }
                }
        }
    }
}

#Preview {
    @Previewable var category = ShoppingListCategory(
        name: "home",
        items: [ShoppingListItem(name: "Table", isCompleted: false)]
    )
    
    ShoppingListAddView(text: .constant(""), category: category, action: {})
}
