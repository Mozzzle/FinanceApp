//
//  CarsModel.swift
//  carsApp
//
//  Created by Slava Kuzmitsky on 25.02.2020.
//  Copyright © 2020 Slava Kuzmitsky. All rights reserved.
//

import RealmSwift


class Transaction: Object {
    
    @objc dynamic var discription = ""
    @objc dynamic var date = Date()
    @objc dynamic var value = 0.0
    @objc dynamic var category: Category?
    @objc dynamic var inOrOut = ""
    @objc dynamic var id = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(discription: String, value: Double, category: Category, inOrOut: String, id: String,date: Date ){
        self .init()
        self.discription = discription
        self.value = value
        self.category = category
        self.inOrOut = inOrOut
        self.id = id
        self.date = Date()
    }
}

