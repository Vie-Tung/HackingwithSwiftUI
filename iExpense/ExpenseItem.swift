//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Viet Tung on 19/03/2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}
