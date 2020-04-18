//
//  CharVCViewController.swift
//  FinancialAssist
//
//  Created by Артем  on 4/18/20.
//  Copyright © 2020 Slava Kuzmitsky. All rights reserved.
//

import UIKit
import RealmSwift
import Charts

class CharVCViewController: UIViewController {

    @IBOutlet weak var pieChar: PieChartView!
    
    var categorys: Results<Category>!
    var transactions: Results<Transaction>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categorys = realm.objects(Category.self)
        transactions = realm.objects(Transaction.self)
        
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
        let unitsSold = [10.0, 4.0, 6.0, 3.0, 12.0, 16.0]
        
       // var categoryNames = [String]()
       // print(categorys.map({categoryNames.append($0.name)}))
       // print("Names:", categoryNames)
        setChart(dataPoints: months, values: unitsSold)
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry1 = PieChartDataEntry(value: Double(i), label: dataPoints[i], data:  dataPoints[i] as AnyObject)

            dataEntries.append(dataEntry1)
        }
        print(dataEntries[0].data)
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "Units Sold")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        pieChar.data = pieChartData
        
        var colors: [UIColor] = []
        
        for _ in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
    }

}

