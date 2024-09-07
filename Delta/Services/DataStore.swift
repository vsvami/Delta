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
    var accounts: [Account] = []
    var groupOfAccounts: GroupOfAccounts?
    var transactions: [Transaction] = []
    
    private init() {
        initializeTestData()
    }
    
    private func initializeTestData() {
        
        let alfabank = Account(
            id: UUID(),
            title: "Alfa bank",
            currency: .rub,
            image: "creditcard",
            color: AppGradient.appRed.name,
            users: [],
            transactions: [],
            categoryType: .account
        )
        
        let cash = Account(
            id: UUID(),
            title: "Cash",
            currency: .rub,
            image: "rublesign.circle",
            color: AppGradient.appGray.name,
            users: [],
            transactions: [],
            categoryType: .account
        )
        
        let basic = Account(
            id: UUID(),
            title: "Basic",
            currency: .rub,
            image: "rublesign.circle",
            color: AppGradient.appWhite.name,
            users: [],
            transactions: [],
            categoryType: .account
        )
        
        let currency = Account(
            id: UUID(),
            title: "Currency",
            currency: .usd,
            image: "dollarsign.circle",
            color: AppGradient.appWhite.name,
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
        
        let group = GroupOfAccounts(
            id: UUID(),
            title: "Sber bank",
            currency: .rub,
            image: "building.columns",
            color: AppGradient.appGreen.name,
            accounts: [basic, currency],
            categoryType: .groupOfAccounts
        )
        
        people.append(person1)
        people.append(person2)
        accounts.append(alfabank)
        accounts.append(cash)
        accounts.append(basic)
        accounts.append(currency)
        groupOfAccounts = group
        
        let taxi = Transaction()
        
        transactions.append(taxi)
    }
}
