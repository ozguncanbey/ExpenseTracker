//
//  ExpenseCardView.swift
//  ExpenseTracker
//
//  Created by Özgün Can Beydili on 5.09.2023.
//

import SwiftUI

struct ExpenseCardView: View {
    var expense: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(expense.title)
                
                Text(expense.subTitle)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .lineLimit(1)
            
            Spacer(minLength: 5)
            
            Text(expense.currencyString)
                .font(.title3.bold())
        }
    }
}

struct ExpenseCardView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseCardView(expense: ExpenseItem(title: "", subTitle: "", category: "", amount: 0, date: Date()))
    }
}
