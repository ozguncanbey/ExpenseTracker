//
//  AddingView.swift
//  ExpenseTracker
//
//  Created by Özgün Can Beydili on 5.09.2023.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: ExpensesViewModel = ExpensesViewModel()
    @ObservedObject var expenses: Expenses
    
    @State private var title = ""
    @State private var subTitle = ""
    @State private var category = "Personal"
    @State private var amount: CGFloat = 0.0
    @State private var date: Date = .init()
    
    private let categories = ["Business", "Personal", "Other"]
    
    var body: some View {
        NavigationStack {
            List {
                
            }
            .navigationTitle("Add New Expense")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .tint(.red)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        let item = ExpenseItem(title: title, subTitle: subTitle, category: category, amount: amount, date: date)
                        viewModel.addExpense(item)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(expenses: Expenses())
    }
}
