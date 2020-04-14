//
//  categoriesOfExpenses.swift
//  FinancialAssist
//
//  Created by Slava Kuzmitsky on 05.03.2020.
//  Copyright © 2020 Slava Kuzmitsky. All rights reserved.
//

import Foundation
import RealmSwift

class CategoryOfExpenses: Object {
    @objc dynamic var name = ""
    @objc dynamic var icon: Data?
    @objc dynamic var total = 0.0
    
    convenience init(name: String, icon: Data?){
        self.init()
        self.name = name
        self.icon = icon
    }

}

func getCategory(categorys: [CategoryOfExpenses], categoryName: String) -> CategoryOfExpenses{
    for category in categorys {
        if (category.name == categoryName){return category}
    }
    
}
