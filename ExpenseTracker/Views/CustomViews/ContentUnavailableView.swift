//
//  ContentUnavailableView.swift
//  ExpenseTracker
//
//  Created by Özgün Can Beydili on 5.09.2023.
//

import SwiftUI

struct ContentUnavailableView: View {
    var body: some View {
        VStack {
            Image(systemName: "tray.fill")
                .resizable()
                .frame(width: CGFloat.dWidth * 0.15, height: CGFloat.dHeight * 0.04)
                .foregroundColor(.secondary)
            
            Text("No Expenses")
                .font(.system(size: 20, weight: .bold))
                .padding(.bottom)
        }
    }
}

struct ContentUnavailableView_Previews: PreviewProvider {
    static var previews: some View {
        ContentUnavailableView()
    }
}
