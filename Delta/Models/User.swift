//
//  User.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 24.07.24.
//

import Foundation

enum CategoryType: String {
    case account = "Account"
    case groupOfAccounts = "GroupOfAccounts"
    case income = "Income"
    case expense = "Expense"
    case goal = "Goal"
    case investment = "Investment"
    case credit = "Credit"
    case loan = "Loan"
}

enum RepeatInterval: String {
    case daily
    case weekly
    case monthly
    case yearly
}

enum Currency: String {
    case rub = "RUB"
    case usd = "USD"
    case eur = "EUR"
    case gbp = "GBP"
    // ...
}


enum TransactionType: String {
    case random
    case certain
}

final class User {
    var mail: String = ""
    var phoneNumber: String = ""
    var password: String = ""
    var passwordCode: String = ""
    var person: Person?
}

final class Person {
    var id: UUID = UUID()
    var photo: String = ""
    var name: String = ""
    var age: Int = 0
    
    var isAdult: Bool {
        return age >= 18
    }
}

class Transaction {
    var id: UUID = UUID()
    var amount: Double = 0.0
    var dateAdded: Date = Date()
    var source: Category?
    var purpose: Category?
    var categoryType: String = "" //TODO: init + CategoryType.rawValue
    var tags: String = ""
    var currency: Currency = .rub
    var person: Person?
    
    var exchangeRate: Double = 0.0
    var fee: Double = 0.0
    
    var isRepeating: Bool = false
    var repeatInterval: RepeatInterval?
    var nextDate: Date?
    var notification: Bool = false
}

class Category {
    var id: UUID = UUID()
    var title: String = ""
    var image: String = ""
    var color: String = ""
    
    var currency: Currency = .rub
    var currentAmount: Double = 0.0
    var plannedAmount: Double = 0.0
    var categoryType: CategoryType = .account
    
    var isCompleted: Bool {
        return currentAmount >= plannedAmount
    }
    
    var users: [Person] = []
    var transactions: [Transaction] = []
    
    var transactionType: TransactionType = .random
    var subCategories: [SubCategory] = []
    
    func calculatePlannedAmount() {
        plannedAmount = subCategories.reduce(0) { $0 + $1.amount }
    }
    
    func getAmountsByDate() -> [(amount: Double, date: Date)] {
        return subCategories.map { ($0.amount, $0.date) }
    }
    
    func getAmountsByPeriod() -> [(amount: Double, date: Date)] {
        let calendar = Calendar.current
        let currentDate = Date()
        let range = calendar.range(of: .day, in: .month, for: currentDate)!
        let numberOfDaysInMonth = range.count
        let dailyAmount = plannedAmount / Double(numberOfDaysInMonth)
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate))!
        
        var result: [(amount: Double, date: Date)] = []
        for day in 0..<numberOfDaysInMonth {
            if let date = calendar.date(byAdding: .day, value: day, to: startOfMonth) {
                result.append((amount: dailyAmount, date: date))
            }
        }
        return result
    }
}

final class SubCategory {
    var id: UUID = UUID()
    var title: String = "" // выбор из тэгов, например свет
    var amount: Double = 0.0
    var date: Date = Date()
    var dateOfCompletion: Date = Date() // для долгов
    var notification: Bool = false
    var autoTransaction: Bool = false
    var transaction: Transaction?
}

final class GroupOfAccounts: Category {
    var accounts: [Category] = []
}

final class Loan: Category {
    var isReceivable: Bool = false // true, если долг должен вам, false, если вы должны
    var interestRate: Double = 0.0
}

final class Credit: Category {
    var creditAmount: Double = 0.0
    var interestRate: Double = 0.0
    var period: String = "Year"
}

final class Investment: Category {
    var shortTitle: String = ""
    
//    var percentageChange: Double {
//        ((currentBalance - initialBalance) / initialBalance) * 100
//        return 0.0
//    }
}
