//
//  AddingView.swift
//  ExpenseTracker
//
//  Created by Özgün Can Beydili on 5.09.2023.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var expenses: Expenses
    
    @State private var title = ""
    @State private var subTitle = ""
    @State private var category = "Personal"
    @State private var amount: CGFloat = 0.0
    @State private var date: Date = .init()
    
    private let categories = ["Personal", "Business", "Other"]
    
    var body: some View {
        NavigationStack {
            List {
                Section("Title") {
                    TextField("Title", text: $title)
                }
                
                Section("Description") {
                    TextField("Description", text: $subTitle)
                }
                
                Section("Amount Spent") {
                    HStack(spacing: 4) {
                        Text("$")
                            .fontWeight(.semibold)
                        
                        TextField("", value: $amount, formatter: formatter)
                            .keyboardType(.numberPad)
                    }
                }
                
                Section("Date") {
                    DatePicker("", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                }
                
                Section() {
                    HStack {
                        Picker("Category", selection: $category){
                            ForEach(categories, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                }
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
                        expenses.items.append(item)
                        dismiss()
                    }
                    .disabled(isAddButtonDisable)
                }
            }
        }
    }
    
    var isAddButtonDisable: Bool {
        title.isEmpty || subTitle.isEmpty || amount.isZero
    }
    
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(expenses: Expenses())
    }
}
