//
//  Category.swift
//  FinancialAssist
//
//  Created by Slava Kuzmitsky on 16.04.2020.
//  Copyright © 2020 Slava Kuzmitsky. All rights reserved.
//

import RealmSwift


class Category: Object {
    @objc dynamic var name = ""
    @objc dynamic var icon: Data?
    @objc dynamic var total = 0.0
    let transactions = List<Transaction>()
    @objc dynamic var inOrOut = ""
    @objc dynamic var id = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(name: String, icon: Data?, inOrOut: String, id: String){
        self.init()
        self.name = name
        self.icon = icon
        self.inOrOut = inOrOut
        self.id = id
    }
}
