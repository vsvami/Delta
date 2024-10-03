//
//  CategoriesScrollView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 09.09.24.
//

import SwiftUI
import UISystem

struct CategoriesScrollView: View {
    @EnvironmentObject var router: Router
    let categories: [Category]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(categories) { category in
                    switch category.categoryType {
                    case .account:
                        if let account = category as? Account {
                            AccountCardView(
                                title: account.title,
                                currency: account.currency,
                                amount: account.amount,
                                image: account.image,
                                color: account.color,
                                size: CGSize(width: Constants.widthTwo, height: Constants.heightThree)
                            )
                            .onTapGesture {
                                router.navigateTo(.accountSettings(account: account))
                            }
                        }
                    case .groupOfAccounts:
                        if let group = category as? GroupOfAccounts {
                            AccountGroupCardView(accountsGroup: group)
                        }
                    case .income:
                        if let income = category as? IncomeExpense {
                            BaseCategoryCardView(
                                title: income.title,
                                subtitle: "",
                                icon: "",
                                currentAmount: 0,
                                plannedAmount: 0,
                                currency: .rub
                            )
                        }
                    case .expense:
                        if let expense = category as? IncomeExpense {
                            BaseCategoryCardView(
                                title: expense.title,
                                subtitle: "",
                                icon: expense.image,
                                currentAmount: expense.amount,
                                plannedAmount: expense.plannedAmount,
                                currency: expense.currency
                            )
                        }
                    case .goal:
                        if let goal = category as? Goal {
                            BaseCategoryCardView(
                                title: goal.title,
                                subtitle: "",
                                icon: "",
                                currentAmount: 0,
                                plannedAmount: 0,
                                currency: .rub
                            )
                        }
                    case .loan:
                        if let loan = category as? Loan {
                            BaseCategoryCardView(
                                title: loan.title,
                                subtitle: "",
                                icon: "",
                                currentAmount: 0,
                                plannedAmount: 0,
                                currency: .rub
                            )
                        }
                    case .credit:
                        if let credit = category as? Credit {
                            BaseCategoryCardView(
                                title: credit.title,
                                subtitle: "",
                                icon: "",
                                currentAmount: 0,
                                plannedAmount: 0,
                                currency: .rub
                            )
                        }
                    case .investment:
                        if let investment = category as? Investment {
                            BaseCategoryCardView(
                                title: investment.title,
                                subtitle: "",
                                icon: "",
                                currentAmount: 0,
                                plannedAmount: 0,
                                currency: .rub
                            )
                        }
                    }
                }
                
                PlusButtonView(action: {})
            }
            //.padding(.horizontal)
        }
        .shadow()
    }
}

#Preview {
    let group = DataManager.shared.getAccountsAndGroup()
    return CategoriesScrollView(categories: group)
}
