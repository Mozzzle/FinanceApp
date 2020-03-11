//
//  PreviewPage.swift
//  FinancialAssist
//
//  Created by Slava Kuzmitsky on 05.03.2020.
//  Copyright © 2020 Slava Kuzmitsky. All rights reserved.
//


import UIKit
import RealmSwift

private let reuseIdentifier = "ArtCover"
var categorys: Results<CategoryOfExpenses>!

class PreviewPage: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    @IBOutlet weak var collectionVIew: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categorys = realm.objects(CategoryOfExpenses.self)
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
        return categorys.isEmpty ? 0 : categorys.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt  indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCoverCell
        cell.coverImageView.image = UIImage(data: categorys[indexPath.row].icon!)
        cell.categoryName.text = categorys[indexPath.row].name
        
        return cell
    }
    
}
