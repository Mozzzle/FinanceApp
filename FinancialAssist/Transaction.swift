//
//  BANK MODEL.swift
//  FinancialAssist
//
//  Created by Slava Kuzmitsky on 05.03.2020.
//  Copyright © 2020 Slava Kuzmitsky. All rights reserved.
//

import RealmSwift



class Transaction: Object {
    
    @objc dynamic var discription = ""
    @objc dynamic var date = ""
    @objc dynamic var value = 0.0
    @objc dynamic var category = ""
    
    convenience init(discription: String, value: Double, category: String){
        self.init()
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        self.date = dateFormatter.string(from: date as Date)
        self.discription = discription
        self.value = value
        self.category = category
    }
}
