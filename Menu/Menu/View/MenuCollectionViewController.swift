//
//  MenuCollectionViewController.swift
//  Menu
//
//  Created by Andrei Coder on 28/08/2019.
//  Copyright © 2019 Andrei Coder. All rights reserved.
//

import UIKit

class MenuCollectionViewController: NSObject {
  
  // MARK: - Properties
  
  let reuseIdentifier = "DishCell"
  
  var dishes: [Dish] = []
  
  override init() {
    super.init()
    
    loadData()
  }
  
  // MARK: - Load Data Method
  
  // temporarily here
  func loadData() {
    dishes.append(Dish(name: "1", price: 1.0, image: nil))
    dishes.append(Dish(name: "2", price: 11.0, image: nil))
    dishes.append(Dish(name: "3", price: 111.0, image: nil))
  }
  
}

// MARK: - UICollectionViewDataSource
extension MenuCollectionViewController: UICollectionViewDataSource {
  
  public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dishes.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MenuCollectionViewCell
    
    cell.dishNameLabel.text = dishes[indexPath.row].name
    cell.dishPriceLabel.text = String(dishes[indexPath.row].price)
    cell.dishImageView.image = dishes[indexPath.row].image
    
    return cell
  }
  
}

// MARK: - UICollectionViewDelegate
extension MenuCollectionViewController: UICollectionViewDelegate {
  
}
