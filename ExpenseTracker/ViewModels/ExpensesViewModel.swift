//
//  ExpenseViewModel.swift
//  ExpenseTracker
//
//  Created by Özgün Can Beydili on 5.09.2023.
//

import Foundation

final class ExpensesViewModel: ObservableObject {
    @Published var expenses = Expenses()
    
    init() {
        loadItemsFromUserDefaults()
    }
    
    func saveItemsToUserDefaults() {
        if let encoded = try? JSONEncoder().encode(expenses.items) {
            UserDefaults.standard.set(encoded, forKey: "Expenses")
        }
    }
    
    func loadItemsFromUserDefaults() {
        if let savedExpenses = UserDefaults.standard.data(forKey: "Expenses") {
            if let decodedExpenses = try? JSONDecoder().decode([ExpenseItem].self, from: savedExpenses) {
                expenses.items = decodedExpenses
            }
        }
    }
    
    func addExpense(_ expense: ExpenseItem) {
        expenses.items.append(expense)
        saveItemsToUserDefaults()
    }
    
    func removeExpense(at index: Int) {
        expenses.items.remove(at: index)
        saveItemsToUserDefaults()
    }
}
