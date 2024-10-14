//
//  DataStore.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 20.07.24.
//

import Foundation
import UISystem

final class DataStore {
    static let shared = DataStore()
    
    var people: [Person] = []
    var categories: [Category] = []
    var transactions: [Transaction] = []
    var groupsOfAccounts: [GroupOfAccounts] = []
    var accounts: [Account] = []
    var incomes: [Income] = []
    
    private init() {
        initializeTestData()
    }
    
    private func initializeTestData() {
        
        let alfabank = Account(
            id: UUID(),
            title: "Alfa bank",
            currency: .rub,
            image: Icon.creditcard.name,
            color: AppGradient.appRed.name,
            users: [],
            transactions: [],
            categoryType: .account
        )
        
        let cash = Account(
            id: UUID(),
            title: "Cash",
            currency: .rub,
            image: Icon.dollar.name,
            color: AppGradient.appBlack.name,
            users: [],
            transactions: [],
            categoryType: .account
        )
        
        let basic = Account(
            id: UUID(),
            title: "Basic",
            currency: .rub,
            image: Icon.dollar.name,
            color: AppGradient.appBlack.name,
            users: [],
            transactions: [],
            categoryType: .account
        )
        
        let currency = Account(
            id: UUID(),
            title: "Currency",
            currency: .usd,
            image: Icon.dollar.name,
            color: AppGradient.appBlack.name,
            users: [],
            transactions: [],
            categoryType: .account
        )
        
        let person1 = Person(
            id: UUID(),
            photo: "person1",
            name: "Tim",
            age: 30,
            accounts: [alfabank, basic, currency]
        )
        
        let person2 = Person(
            id: UUID(),
            photo: "person2",
            name: "Bob",
            age: 25,
            accounts: [cash]
        )

        alfabank.users = [person1]
        cash.users = [person2]
        basic.users = [person1]
        currency.users = [person1]
        
        let group1 = GroupOfAccounts(
            id: UUID(),
            title: "Sber bank",
            currency: .rub,
            image: "building.columns",
            color: AppGradient.appGreen.name,
            accounts: [basic, currency],
            categoryType: .groupOfAccounts
        )
        
        let group2 = GroupOfAccounts(
            id: UUID(),
            title: "Main",
            currency: .usd,
            image: "building.columns",
            color: AppGradient.blueGradient.name,
            accounts: [cash, alfabank],
            categoryType: .groupOfAccounts
        )
        
        people.append(person1)
        people.append(person2)
        categories.append(alfabank)
        categories.append(group1)
        categories.append(cash)
        categories.append(basic)
        categories.append(currency)
        groupsOfAccounts.append(group1)
        groupsOfAccounts.append(group2)
        accounts.append(alfabank)
        accounts.append(cash)
        
//        let taxi = IncomeExpense(
//            image: "creditcard",
//            repeatingType: .certain,
//            subCategories: [],
//            transactions: [],
//            id: UUID(),
//            title: "Taxi",
//            currency: .rub,
//            categoryType: .expense
//        )
//        
//        let award = IncomeExpense(
//            image: "trophy",
//            repeatingType: .random,
//            subCategories: [],
//            transactions: [],
//            id: UUID(),
//            title: "Award",
//            currency: .usd,
//            categoryType: .income
//        )
//        
//        let salary = IncomeExpense(
//            amount: 5000,
//            image: "handbag",
//            repeatingType: .certain,
//            subCategories: [SubCategory(
//                id: UUID(),
//                title: "Avance",
//                currency: .rub,
//                categoryType: .income,
//                amount: 2000,
//                date: Date(),
//                notification: false,
//                autoTransaction:  true,
//                transaction: nil
//            )],
//            transactions: [],
//            id: UUID(),
//            title: "Salary",
//            currency: .rub,
//            categoryType: .income, 
//            categoryService: <#CategoryService#>
//        )
//        
//        incomes.append(award)
//        incomes.append(salary)
//        
//        categories.append(taxi)
//        categories.append(award)
//        categories.append(salary)
        
    }
}
