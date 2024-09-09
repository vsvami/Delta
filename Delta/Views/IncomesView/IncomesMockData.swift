//
//  IncomesMockData.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 9/4/24.
//

import Foundation

struct IncomesMockData {
    let incomes: [IncomeExpense] = [
        IncomeExpense(
            image: "creditcard",
            repeatingType: .certain,
            subCategories: [],
            transactions: [],
            id: UUID(),
            title: "Main Job",
            currency: .usd,
            categoryType: .income
        ),
        IncomeExpense(
            image: "creditcard",
            repeatingType: .certain,
            subCategories: [],
            transactions: [],
            id: UUID(),
            title: "Second Job",
            currency: .usd,
            categoryType: .income
        ),
        IncomeExpense(
            image: "creditcard",
            repeatingType: .certain,
            subCategories: [],
            transactions: [],
            id: UUID(),
            title: "Freelance",
            currency: .usd,
            categoryType: .income
        ),
        IncomeExpense(
            image: "creditcard",
            repeatingType: .certain,
            subCategories: [],
            transactions: [],
            id: UUID(),
            title: "Award",
            currency: .usd,
            categoryType: .income
        )
        
//        Income(
//            id: UUID(),
//            title: "Main Job",
//            currency: .usd,
//            amount: 5000,
//            categoryType: .income,
//            image: "creditcard",
//            plannedAmount: 15000,
//            color: "appBlue"
//        ),
//        Income(
//            id: UUID(),
//            title: "Second Job",
//            currency: .usd,
//            amount: 3000,
//            categoryType: .income,
//            image: "creditcard",
//            plannedAmount: 5000,
//            color: "appGreen"
//        ),
//        Income(
//            id: UUID(),
//            title: "Freelance",
//            currency: .usd,
//            amount: 1000,
//            categoryType: .income,
//            image: "creditcard",
//            plannedAmount: 2000,
//            color: "appPurple"
//        ),
//        Income(
//            id: UUID(),
//            title: "Award",
//            currency: .usd,
//            amount: 10000,
//            categoryType: .income,
//            image: "creditcard",
//            plannedAmount: 10000,
//            color: "appYellow"
//        )
    ]
}
