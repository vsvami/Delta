//
//  ContentView.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 8/29/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var router = Router()
    @State private var categoryService = CategoryService()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            router.view(for: router.startScreen)
                .navigationDestination(for: Route.self) { route in
                    router.view(for: route)
                }
        }
        .environmentObject(router)
        .environment(categoryService)
    }
}

#Preview {
    ContentView()
}
