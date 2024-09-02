//
//  DataStore.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 20.07.24.
//

import Foundation

final class DataStore {
    static let shared = DataStore()
    
    var people: [Person] = []
    var accounts: [Account] = []
    var groupOfAccounts: GroupOfAccounts?
    
    private init() {
        initializeTestData()
    }
    
    private func initializeTestData() {
        
        let alfabank = Account(
            id: UUID(),
            title: "Alfa bank",
            currency: .rub,
            amount: 1208342.54,
            image: "creditcard",
            color: "appRed",
            users: [],
            transactions: [],
            categoryType: .account
        )
        
        let cash = Account(
            id: UUID(),
            title: "Cash",
            currency: .rub,
            amount: 41320.91,
            image: "rublesign.circle",
            color: "appGray",
            users: [],
            transactions: [],
            categoryType: .account
        )
        
        let basic = Account(
            id: UUID(),
            title: "Basic",
            currency: .rub,
            amount: 45714.51,
            image: "rublesign.circle",
            color: "appWhite",
            users: [],
            transactions: [],
            categoryType: .account
        )
        
        let currency = Account(
            id: UUID(),
            title: "Currency",
            currency: .usd,
            amount: 23523.51,
            image: "dollarsign.circle",
            color: "appWhite",
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
            color: "appGreen",
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
        
    }
}
