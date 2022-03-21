//
//  ChiPhi.swift
//  iExpense
//
//  Created by Viet Tung on 19/03/2022.
//

import Foundation
class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
