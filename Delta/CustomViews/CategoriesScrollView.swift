//
//  CategoriesScrollView.swift
//  Delta
//
//  Created by Vladimir Dmitriev on 09.09.24.
//

import SwiftUI
import UISystem

struct CategoriesScrollView: View {
    @Environment(Router.self) private var router
    
    let categories: [Category]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(categories) { category in
                    switch category.categoryType {
                    case .account:
                        if let account = category as? Account {
                            AccountCardView(
                                account: account,
                                size: CGSize(width: Constants.widthTwo, height: Constants.heightThree)
                            )
                        }
                    case .groupOfAccounts:
                        if let group = category as? GroupOfAccounts {
                            AccountGroupCardView(accountsGroup: group)
                        }
                    case .income:
                        if let income = category as? Income {
                            BaseCategoryCardView(
                                title: income.title,
                                subtitle: "",
                                icon: "",
                                currentAmount: 0,
                                plannedAmount: 0,
                                currency: .rub
                            )
                            .onTapGesture {
                                router.navigateTo(.incomeSettings(income: income))
                            }
                        }
                    case .expense:
                        if let expense = category as? Expense {
                            BaseCategoryCardView(
                                title: expense.title,
                                subtitle: "",
                                icon: expense.image,
                                currentAmount: expense.amount,
                                plannedAmount: expense.plannedAmount,
                                currency: expense.currency
                            )
                            .onTapGesture {
                                router.navigateTo(.expenseSettings(expense: expense))
                            }
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
                
                PlusButtonView {
                    router.navigateTo(.expenseCreate)
                }
            }
        }
        .shadow()
    }
}

#Preview {
    let group = DataManager.shared.getAccountsAndGroup()
    return CategoriesScrollView(categories: group).environment(Router())
}
