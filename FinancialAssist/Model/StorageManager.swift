//
//  StorageManager.swift
//  carsApp
//
//  Created by Slava Kuzmitsky on 25.02.2020.
//  Copyright © 2020 Slava Kuzmitsky. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveCategory(_ category: Category) {
        
        try! realm.write {
            realm.add(category)
        }
    }
    
    static func deleteCategory(_ category: Category) {
        try! realm.write {
            realm.delete(category)
        }
    }
    static func saveTransaction(_ transaction: Transaction,_ category: Category) {
        
        try! realm.write {
            realm.add(transaction)
            category.transactions.append(transaction)
            category.total += transaction.value
        }
    }
    
    static func deleteTransaction(_ transaction: Transaction,_ category: Category) {
        try! realm.write {
            category.total -= transaction.value
            realm.delete(category.transactions.filter({$0.id == transaction.id}))
            realm.delete(transaction)
        }
    }
}
