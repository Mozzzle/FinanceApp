//
//  StorageManager.swift
//  FinancialAssist
//
//  Created by Slava Kuzmitsky on 06.03.2020.
//  Copyright © 2020 Slava Kuzmitsky. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveTransaction(_ transaction: Transaction) {
        
        try! realm.write {
            realm.add(transaction)
        }
    }
    
    static func deleteTransaction(_ transaction: Transaction ) {
        try! realm.write {
            realm.delete(transaction)
        }
    }
    static func saveCategory(_ category: CategoryOfExpenses) {
        
        try! realm.write {
            realm.add(category)
        }
    }
    
    static func deleteObject(_ category: CategoryOfExpenses ) {
        try! realm.write {
            realm.delete(category)
        }
    }
}
