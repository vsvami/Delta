//
//  Double +.swift
//  Delta
//
//  Created by Tatiana Lazarenko on 9/2/24.
//

import Foundation

extension Double {
    func formattedAmount() -> String {
        let roundedAmount = self.rounded()
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        formatter.minimumFractionDigits = 0

        return formatter.string(from: roundedAmount as NSNumber) ?? "\(roundedAmount)"
    }
}
