//
//  ExpensesView.swift
//  ExpenseTracker
//
//  Created by Özgün Can Beydili on 5.09.2023.
//

import SwiftUI

struct ExpensesView: View {
    @StateObject var expenses = Expenses()
    @State private var showAddExpenseView = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personel") {
                    ForEach(expenses.items.sorted(by: { $0.date > $1.date })) { item in
                        if item.category == "Personal" {
                            ExpenseCardView(expense: item)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                
                Section("Busıness") {
                    ForEach(expenses.items.sorted(by: { $0.date > $1.date })) { item in
                        if item.category == "Business" {
                            ExpenseCardView(expense: item)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                
                Section("Other") {
                    ForEach(expenses.items.sorted(by: { $0.date > $1.date })) { item in
                        if item.category == "Other" {
                            ExpenseCardView(expense: item)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("Expenses")
            .overlay {
                if expenses.items.isEmpty {
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
                AddExpenseView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView()
    }
}
