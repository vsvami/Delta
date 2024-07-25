//
//  User.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 24.07.24.
//

import Foundation

protocol IconRepresentable {
    var icon: String { get }
}

protocol CurrencyRepresentable {
    var currency: Currency { get }
}

protocol ColorRepresentable {
    var color: String { get }
}

enum Currency: String {
    case rub = "RUB"
    case usd = "USD"
    case eur = "EUR"
    case gbp = "GBP"
    // ...
}

struct User {
    let mail: String
    let phoneNumber: String
    let password: String
    let passwordCode: String
    let person: Person
}

struct Person {
    let id: UUID
    let photo: String
    let firstName: String
    let lastName: String
    
    var fullName: String {
        firstName + " " + lastName
    }
    
    let age: Int
    
    var isAdult: Bool {
        return age >= 18
    }
}

struct Account: IconRepresentable, ColorRepresentable, CurrencyRepresentable {
    let id: UUID
    let name: String
    let icon: String
    let color: String
    let currency: Currency
    let balance: Double
    let transactions: [Transaction]
    let users: [User] // ?
}

// if the account is not in a group - display on the main page
// if it is in a group - in the container "Account group"

struct GroupOfAccounts: IconRepresentable, ColorRepresentable, CurrencyRepresentable {
    let id: UUID
    let name: String
    let icon: String
    let color: String
    let currency: Currency
    let accounts: [Account] // ?
}

enum TransactionType: String {
    case income = "Income"
    case expense = "Expense"
    case goal = "Goal"
    case investment = "Investment"
    case loan = "Loan"
    case credit = "Credit"
}

struct Transaction: CurrencyRepresentable {
    let id: UUID
    let date: Date
    let currency: Currency
    let type: TransactionType
    let amount: Double
    let person: Person
    
    let tag: String?
    let exchangeRate: Double?
    let fee: Double?
    let reminder: Reminder?
    let repeatInterval: Date?
}

struct Reminder {
    let reminderDate: Date?
    let period: String
    let notice: Bool
}

struct Income: IconRepresentable, CurrencyRepresentable {
    let id: UUID
    let source: String
    let icon: String
    let currency: Currency
    let currentAmount: Double
    let plannedAmount: Double
    let transactions: [Transaction]
}

struct Expense: IconRepresentable, CurrencyRepresentable {
    let id: UUID
    let category: String
    let icon: String
    let currency: Currency
    let currentAmount: Double
    let plannedAmount: Double
    let transactions: [Transaction]
}

struct Goal: IconRepresentable, CurrencyRepresentable {
    let id: UUID
    let name: String
    let icon: String
    let currency: Currency
    let currentAmount: Double
    let targetAmount: Double
    let transactions: [Transaction]
    let person: Person
}

struct Investment: IconRepresentable, CurrencyRepresentable {
    let id: UUID
    let assetLongName: String
    let assetShortName: String
    let icon: String
    let currency: Currency
    var currentBalance: Double
    
    var percentageChange: Double {
        // ((currentBalance - initialBalance) / initialBalance) * 100
        return 0.0
    }
    
    let person: Person
}

struct Loan: CurrencyRepresentable {
    let id: UUID
    let lender: String
    let photo: String
    let currency: Currency
    let currentAmount: Double
    let plannedAmount: Double
    let interestRate: Double
    let person: Person
}

struct Credit: IconRepresentable, CurrencyRepresentable {
    let id: UUID
    let institution: String
    let icon: String
    let currency: Currency
    let currentAmount: Double
    let plannedAmount: Double
    let interestRate: Double
    let person: Person
}
