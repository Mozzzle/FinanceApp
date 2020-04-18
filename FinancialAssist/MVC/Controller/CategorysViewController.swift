//
//  CategorysViewController.swift
//  FinancialAssist
//
//  Created by Slava Kuzmitsky on 18.04.2020.
//  Copyright © 2020 Slava Kuzmitsky. All rights reserved.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "CategoryCustomCell"

class CategoryVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var categorys: Results<Category>!
    var transactions: Results<Transaction>!
    override func viewDidLoad() {
        super.viewDidLoad()
        categorys = realm.objects(Category.self)
        transactions = realm.objects(Transaction.self)
        // Do any additional setup after loading the view.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categorys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt  indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCustomCell
        
        let category = categorys[indexPath.row]
        
        cell.categoryItem.image = UIImage(data: category.icon!)
        cell.categoryTotal.text = String(category.total)
        
        return cell
    }
}

