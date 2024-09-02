//
//  User.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 24.07.24.
//

import Foundation

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

//enum TransactionType: String {
//    case random
//    case certain
//}

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
    var accounts: [Account] = []
    
    var isAdult: Bool {
        return age >= 18
    }
    
    var balance: Double {
        return accounts.reduce(0) { $0 + $1.amount }
    }
    
    init(id: UUID, photo: String, name: String, age: Int, accounts: [Account] = []) {
        self.id = id
        self.photo = photo
        self.name = name
        self.age = age
        self.accounts = accounts
    }
}

enum TransactionType{
    case transfer
    case income
    case expense
    case goal
    case loan
    case repayLoan
    case lend
    case repayLend
    case credit
    case repayment
    case investment
    case dividends
    case service
}

class DebtTransaction: Transaction {
    var isMyDebt = false
    var interestRate: Double = 0.0
    
    override func determineTransactionType() -> TransactionType {
        switch (source, destination) {
        case (CategoryType.account.rawValue, CategoryType.loan.rawValue):
            return isMyDebt ? .repayLoan : .lend
        case (CategoryType.loan.rawValue, CategoryType.account.rawValue):
            return isMyDebt ? .loan : .repayLend
        case (CategoryType.loan.rawValue, CategoryType.account.rawValue):
            return .credit
        case (CategoryType.account.rawValue, CategoryType.credit.rawValue):
            return .repayment
        default:
            return .service
        }
    }
}

class Transaction {
    var id: UUID = UUID()
    var amount: Double = 0.0
    var date: Date = Date()
    var source: String = ""
    var destination: String = ""
    var tags: String = ""
    var currency: Currency = .rub
    var person: Person?
    
    var type: TransactionType {
        return determineTransactionType()
    }
    
    func determineTransactionType() -> TransactionType {
        switch (source, destination) {
        case (CategoryType.account.rawValue, CategoryType.account.rawValue):
            return .transfer
        case (CategoryType.income.rawValue, CategoryType.account.rawValue):
            return .income
        case (CategoryType.account.rawValue, CategoryType.expense.rawValue):
            return .expense
        case (CategoryType.account.rawValue, CategoryType.goal.rawValue):
            return .goal
        case (CategoryType.account.rawValue, CategoryType.investment.rawValue):
            return .investment
        case (CategoryType.investment.rawValue, CategoryType.account.rawValue):
            return .dividends
        default:
            return .service
        }
    }
}

enum CategoryType: String {
    case account = "Account"
    case groupOfAccounts = "GroupOfAccounts"
    case income = "Income"
    case expense = "Expense"
    case goal = "Goal"
    case loan = "Loan"
    case credit = "Credit"
    case investment = "Investment"
}

class Category {
    var id: UUID = UUID()
    var title: String = ""
    var currency: Currency = .usd
    var amount: Double = 0.0 // TODO: - удалить свойство
    var categoryType: String = ""

    init(
        id: UUID,
        title: String,
        currency: Currency,
        amount: Double,
        categoryType: CategoryType
    ) {
        self.id = id
        self.title = title
        self.currency = currency
        self.amount = amount
        self.categoryType = categoryType.rawValue
    }
}

final class SubCategory: Category {
    var date: Date = Date()
    var dateOfCompletion: Date = Date() // для долгов
    var notification: Bool = false
    var autoTransaction: Bool = false
    var transaction: Transaction?
}

final class Expense: Category, Identifiable {
    var image: String = ""
    var plannedAmount: Double = 0.0
    var transactions: [Transaction] = []
    var subCategories: [SubCategory] = []
    
    var isExceeded: Bool {
        return amount >= plannedAmount
    }

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

final class Income: Category {
    
}

final class Goal: Category {
    
}

final class Loan: Category {
    
}

final class Credit: Category {
    
}

final class Investment: Category {
    
}

final class Account: Category, Identifiable {
    var image: String = ""
    var color: String = ""
    var users: [Person] = []
    var transactions: [Transaction] = []
    
    var currentAmount: Double {
        transactions.reduce(0) { $0 + $1.amount }
    } // изменить можно добавив транзакцию (сервисную)
    
    init(
        id: UUID,
        title: String,
        currency: Currency,
        amount: Double,
        image: String,
        color: String,
        users: [Person],
        transactions: [Transaction],
        categoryType: CategoryType
    ) {
        self.image = image
        self.color = color
        self.users = users
        self.transactions = transactions
        super.init(id: id, title: title, currency: currency, amount: amount, categoryType: categoryType)
    }
}

final class GroupOfAccounts: Category, Identifiable {
    var image: String = ""
    var color: String = ""
    var accounts: [Account] = []
    
    var totalAmount: Double {
        return accounts.reduce(0) { $0 + $1.amount }
    }
    
    init(
        id: UUID,
        title: String,
        currency: Currency,
        image: String,
        color: String,
        accounts: [Account],
        categoryType: CategoryType
    ) {
        self.image = image
        self.color = color
        self.accounts = accounts
        super.init(id: id, title: title, currency: currency, amount: 0.0, categoryType: categoryType)
    }
}
