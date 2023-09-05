//
//  ExpenseItem.swift
//  ExpenseTracker
//
//  Created by Özgün Can Beydili on 5.09.2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var subTitle: String
    var category: String
    var amount: Double
    var date: Date
    
    init(id: UUID = UUID(), title: String, subTitle: String, category: String, amount: Double, date: Date) {
        self.id = id
        self.title = title
        self.subTitle = subTitle
        self.category = category
        self.amount = amount
        self.date = date
    }
    
    var currencyString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(for: amount) ?? ""
    }
}
