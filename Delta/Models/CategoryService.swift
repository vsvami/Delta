//
//  Category.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 10/4/24.
//

import SwiftUI

@Observable
final class CategoryService {
    var incomes: [Income] = []
    var subCategories: [SubCategory] = []
    
    func createIncome(_ draftIncome: Income) {
        incomes.append(draftIncome)
    }
    
    func getSubIncomes() -> [SubCategory] {
        subCategories.filter { $0.categoryType == .income }
    }
    
    func removeIncome(at index: Int) {
        guard index >= 0 && index < incomes.count else { return }
        incomes.remove(at: index)
    }
    
    func createSubIncome() {
        let newSubCategory = SubCategory(
            id: UUID(),
            title: "",
            currency: .usd,
            categoryType: .income,
            amount: 5000,
            date: Date(),
            notification: false,
            autoTransaction: true,
            transaction: nil
        )
        
        subCategories.append(newSubCategory)
    }
    
    func removeSubCategory(at index: Int) {
        guard index >= 0 && index < subCategories.count else { return }
        subCategories.remove(at: index)
    }
}


