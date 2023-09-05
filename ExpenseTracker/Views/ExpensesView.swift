//
//  ExpensesView.swift
//  ExpenseTracker
//
//  Created by Özgün Can Beydili on 5.09.2023.
//

import SwiftUI

struct ExpensesView: View {
    @StateObject private var viewModel: ExpensesViewModel = ExpensesViewModel()
    @State private var showAddExpenseView = false
    
    var body: some View {
        NavigationStack {
            List {
                
            }
            .navigationTitle("Expenses")
            .overlay {
                if viewModel.expenses.items.isEmpty {
                    ContentUnavailableView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddExpenseView.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title3)
                    }
                }
            }
            .sheet(isPresented: $showAddExpenseView) {
                AddExpenseView(expenses: viewModel.expenses)
            }
        }
    }
}

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView()
    }
}
