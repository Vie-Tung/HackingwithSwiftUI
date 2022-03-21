//
//  addView.swift
//  iExpense
//
//  Created by Viet Tung on 19/03/2022.
//

import SwiftUI

struct addView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0
    
    let types = ["Business", "Personal", "Education", "Donate", "Investing"]
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "VND"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Add") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct addView_Previews: PreviewProvider {
    static var previews: some View {
        addView(expenses: Expenses())
    }
}
