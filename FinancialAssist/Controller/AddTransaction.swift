//
//  AddTransaction.swift
//  FinancialAssist
//
//  Created by Slava Kuzmitsky on 12.03.2020.
//  Copyright © 2020 Slava Kuzmitsky. All rights reserved.
//

import UIKit
import RealmSwift

class AddTransaction: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    var filteredCategorys: Results<Category>!
    var inOrOut = ""
    var choosenCategory: Category?
    @IBOutlet weak var cxv: UILabel!
    var categorys = realm.objects(Category.self)
    var transactions = realm.objects(Transaction.self)
    @IBOutlet weak var transactionValue: UITextField!
    @IBOutlet weak var transactionDiscription: UITextField!
    @IBOutlet weak var transactionCategory: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        transactionCategory.dataSource = self
        transactionCategory.delegate = self
        cxv.text = inOrOut
        filteredCategorys = categorys.filter("inOrOut = '\(inOrOut)'")
        choosenCategory = filteredCategorys.first
    }
    
    func saveTransaction() {
        let transactionId = transactions.isEmpty ? "1" : String(Int((transactions.last?.id)!)! + 1)
        let transactionValue = (inOrOut == "In") ? (Double(self.transactionValue.text!)!) : (Double(self.transactionValue.text!)! * (-1))
        let newTransaction = Transaction(discription: (transactionDiscription.text)!, value: transactionValue, category: choosenCategory!, inOrOut: inOrOut, id: transactionId, date: NSDate() as Date)
        StorageManager.saveTransaction(newTransaction, choosenCategory!)
    }
    // Do any additional setup after loading the view.
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filteredCategorys.count
    }
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           choosenCategory = filteredCategorys[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return filteredCategorys[row].name
    }
    
    
}
