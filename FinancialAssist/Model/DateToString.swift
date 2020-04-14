//
//  DateToString.swift
//  FinancialAssist
//
//  Created by Slava Kuzmitsky on 14.04.2020.
//  Copyright © 2020 Slava Kuzmitsky. All rights reserved.
//

import Foundation

func stringFromDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMM HH:mm" //yyyy
    return formatter.string(from: date)
}
