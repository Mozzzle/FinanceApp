//
//  MainViewController.swift
//  carsApp
//
//  Created by Slava Kuzmitsky on 25.02.2020.
//  Copyright © 2020 Slava Kuzmitsky. All rights reserved.
//

import UIKit
import RealmSwift
import Charts

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    // MARK: - @IBOutlet    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var balans: UILabel!
    private let  reuseIdentifier = "CategoryCell"
    
    // MARK: - Properties
    var categorys: Results<Category>!
    var transactions: Results<Transaction>!
    var ascendingSorting = true
    var totalBalans = 0.0
    var months = [String]()
    
    // MARK: - Lifecycle of a VC
    override func viewDidLoad() {
        super.viewDidLoad()
        //pieChart.isHidden = true
        categorys = realm.objects(Category.self)
        transactions = realm.objects(Transaction.self)
        transactions = transactions.sorted(byKeyPath: "date", ascending: false)
        

//            StorageManager.saveCategory(Category(name: "home", icon: #imageLiteral(resourceName: "027-cityscape").pngData(), inOrOut: " Out",id: "1"))
//            StorageManager.saveCategory(Category(name: "car", icon: #imageLiteral(resourceName: "035-car").pngData(), inOrOut: "Out", id: "2"))
//            StorageManager.saveCategory(Category(name: "shoping", icon: #imageLiteral(resourceName: "017-shopping-bag").pngData(), inOrOut: "Out", id: "3"))
//            StorageManager.saveCategory(Category(name: "chill", icon: #imageLiteral(resourceName: "007-palm-tree").pngData(), inOrOut: "Out", id: "4"))
//            StorageManager.saveCategory(Category(name: "present", icon: #imageLiteral(resourceName: "023-necklace-1").pngData(), inOrOut: "In", id: "5"))
//            StorageManager.saveCategory(Category(name: "job", icon: #imageLiteral(resourceName: "020-money").pngData(), inOrOut: "In", id: "6"))
    
    }
    override func viewWillAppear(_ animated: Bool) {
        totalBalans = transactions!.compactMap { $0.value }.reduce(0, +)
        balans.text = String(totalBalans)
    }
    
    // MARK: - Methods
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let transaction = transactions[indexPath.row]
        let deleteAction = UITableViewRowAction (style: .default , title:  "Delete") { (_, _) in
            StorageManager.deleteTransaction(transaction, transaction.category!)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [deleteAction ]
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.isEmpty ? 0 : transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TransactionCell
        
        let transaction = transactions[indexPath.row]
        
        cell.categoryName.text = (transaction.category?.name)
        cell.transactionDiscription.text = transaction.discription
        if (transaction.inOrOut == "In") {
            cell.transactionValue.textColor = UIColor.green
            cell.transactionValue.text = "+\(String(transaction.value))$"
        }
        else {
            cell.transactionValue.textColor = UIColor.red
            cell.transactionValue.text = "\(String(transaction.value))$"
        }
        cell.transactionDate.text = stringFromDate(transaction.date as Date)
        cell.categoryImage.image = UIImage(data: (transaction.category?.icon!)!)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var inOrOut=""
        if segue.identifier == "plusMoney" {
            inOrOut = "In"
        }
        if segue.identifier == "minusMoney" {
            inOrOut = "Out"
        }
        let newTransaction = segue.destination as! AddTransaction
        newTransaction.inOrOut = inOrOut
    }

    // MARK: - @IBAction

    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let newTransactionVC = segue.source as? AddTransaction else { return }
        newTransactionVC.saveTransaction ()
        tableView.reloadData()
    }
 
}
