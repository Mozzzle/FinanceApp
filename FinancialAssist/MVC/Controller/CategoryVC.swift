//
//  CategoryVC.swift
//  FinancialAssist
//
//  Created by Slava Kuzmitsky on 18.04.2020.
//  Copyright © 2020 Slava Kuzmitsky. All rights reserved.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "Cell"

class CategoryVC: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var categorys: Results<Category>!
        var transactions: Results<Transaction>!
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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
            print(categorys.count)
            return categorys.count
        }
    
         func collectionView(_ collectionView: UICollectionView, cellForItemAt  indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCell
    
            let category = categorys[indexPath.row]
    
            cell.cotegoryIcon.image = UIImage(data: category.icon!)
            cell.categoryText.text = Stribg(category.total)
    
            return cell
        }
}
