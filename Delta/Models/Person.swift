//
//  Person.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 20.07.24.
//

import SwiftUI

struct Person: Hashable {
    let id = UUID()
    let name: String
    let age: Int
    let phoneNumber: String?
    let email: String?
    let password: String
    let avatar: Data?
}

struct User {
    let person: Person
    let financialPortfolio: FinancialPortfolio
    let accounts: [MoneyAccount]
    let transactions: [Transfer]
}

struct FinancialPortfolio {
    let category: Category
    let balance: Double
    let income: Double
    let expenses: Double
    let planValue: Double
    let factValue: Double
}

struct Transfer {
    // поля общие для всех категорий
    let category: Category
    let source: Source
    let account: MoneyAccount
    let date: Date
    let amount: Double
    let currency: Currency
    let tags: [String]
    // поля, которые будут отличаться для разных категорий
    let commission: Double?
    let issueDate: Date?
    let deadline: Date?
    let notifications: Date?
    //TODO: не совсем поняла что означают нижние 3 поля (для категорий кредиты и цели)
    let selectPayment: Double?
    let restPayment: Double?
    let cost: Double?
}

struct Source {
    let title: String
    let icon: Icon
}

struct MoneyAccount {
    let title: String
    let currency: Currency
    let icon: Icon
    let color: Color
    let accountGroup: AccountGroup
    let users: [User]
    let history: String // TODO: не совсем поняла что тут будет
}

struct AccountGroup {
    let accounts: [MoneyAccount]
    let title: String
    let currency: Currency
    let icon: Icon
    let color: Color
}

struct Purchase {
    let title: String
    let isDone: Bool
    let cost: Double
}

struct UserSettings {
    let person: Person
    let isProAccount: Bool
    let users: [User]
    
    let language: AppLanguage
    let currency: Currency
    let budgetingPeriod: BudgetingPeriod
    let startOfPeriod: Date
    let appearance: Appearance
    let isNotifications: Bool
    let tags: [String]
    let isCode: Bool
    let isFaceID: Bool
    let isWidgets: Bool
    
    let synchronization: () -> Void
    let deleting: () -> Void
    let exporting: () -> Void
    let creatingCopy: () -> Void
    let restoringCopy: () -> Void
    let demoDataDeleting: () -> Void
}

// TODO: не уверена что эта модель вообще нужна
struct CategoryInfo {
    let category: Category
    let appearance: CategoryAppearance
    let title: String
    let chart: Chart
    let icon: Icon
    let planValue: Double
    let factValue: Double
}

struct Appearance {
    let theme: Theme
    let color: Color
}

enum Theme {
    case dark
    case light
}

enum AppLanguage {
    case russian
    case english
}

enum Currency {
    case rubles
    case dollars
    case euro
}

// TODO: не совсем поняла что тут будет
enum BudgetingPeriod {
    case year
    case month
    case week
}

enum Category {
    case income
    case expenses
    case goals
    case loans
    case credits
    case investments
}

enum CategoryAppearance {
    case large
    case small
    case list
}

enum Icon: String {
    case nameIcon1 = "name1"
    case nameIcon2 = "name2"
    case nameIcon3 = "name3"
}

enum Chart {
    case bars
    case linear
    case diagram
    case pie
}

