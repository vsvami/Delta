//
//  ShoppingListAddView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 19.09.24.
//

import SwiftUI

struct ShoppingListAddView: View {
    @State private var text = ""
    @Bindable var category: ShoppingListCategory
    
    @Binding var tags: [String]
    
    var filteredTags: [String] {
        if text.isEmpty {
            return []
        } else {
            return tags.filter { $0.lowercased().contains(text.lowercased()) }
        }
    }
    
    var body: some View {
        HStack {
            Image(systemName: "plus.circle.fill")
                .font(.title2)
                .foregroundColor(.appBlack)
            TextField("Add", text: $text)
                .onSubmit {
                    guard !text.isEmpty else { return }
                    withAnimation {
                        let newItem = ShoppingListItem(name: text)
                        category.items.append(newItem)
                        
                        if !tags.contains(text) {
                            tags.append(text)
                        }
                        
                        text = ""
                    }
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(filteredTags, id: \.self) { tag in
                                    Button(action: {
                                        text = tag
                                    }) {
                                        Text(tag)
                                            .font(.metadata3())
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 5)
                                            .foregroundColor(.appWhite)
                                            .background(Capsule().fill(Color.appBlack))
                                    }
                                }
                            }
                        }
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
    
    ShoppingListAddView(category: category, tags: .constant([]))
}
