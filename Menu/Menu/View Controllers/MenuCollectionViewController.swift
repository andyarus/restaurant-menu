//
//  MenuCollectionViewController.swift
//  Menu
//
//  Created by Andrei Coder on 31/08/2019.
//  Copyright © 2019 Andrei Coder. All rights reserved.
//

import UIKit

public class MenuCollectionViewController: UICollectionViewController {
  
  var dishes: [Dish] = []
  
  var displayMode: DisplayMode = .consistent
  
  let layout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
    layout.minimumInteritemSpacing = layout.sectionInset.left + layout.sectionInset.right
    layout.minimumLineSpacing = layout.sectionInset.top + layout.sectionInset.bottom
    
    return layout
  }()
  
  public init() {
    super.init(collectionViewLayout: layout)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    loadData()
  }
  
  func setupUI() {
    collectionView.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.reuseIdentifier)
    
    collectionView.backgroundColor = .white
    
    if isIPad {
      navigationItem.rightBarButtonItem = UIBarButtonItem(image: displayMode.image(), style: .plain, target: self, action: #selector(changeDisplayMode))
      
      switch displayMode {
      case .grid:
        layout.scrollDirection = .vertical
      case .consistent:
        layout.scrollDirection = .horizontal
      }
    } else {
      if isLandscape {
        layout.scrollDirection = .horizontal
      } else {
        layout.scrollDirection = .vertical
      }
      
      layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
      layout.minimumInteritemSpacing = layout.sectionInset.left + layout.sectionInset.right
      layout.minimumLineSpacing = layout.sectionInset.top + layout.sectionInset.bottom
    }
    
    layout.itemSize = cellSize // layout.estimatedItemSize = layout.itemSize
  }
  
  override public func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
      layout.itemSize = cellSize
    
      if isIPad {
        switch displayMode {
        case .grid:
          layout.scrollDirection = .vertical
        case .consistent:
          layout.scrollDirection = .horizontal
        }
      } else {
        if isLandscape {
          layout.scrollDirection = .horizontal
        } else {
          layout.scrollDirection = .vertical
        }
      }
  }
  
  // temporarily here
  func loadData() {
    for _ in 0...1000 {
      dishes.append(Dish(name: "1", price: 1.0, image: nil))
      dishes.append(Dish(name: "2", price: 11.0, image: nil))
      dishes.append(Dish(name: "3", price: 111.0, image: nil))
    }
  }
  
  @objc
  public func changeDisplayMode() {
    switch displayMode {
    case .grid:
      displayMode = .consistent
    case .consistent:
      displayMode = .grid
    }
    
    navigationItem.rightBarButtonItem?.image = displayMode.image()
    
    layout.itemSize = cellSize
    
    if isIPad {
      switch displayMode {
      case .grid:
        layout.scrollDirection = .vertical
      case .consistent:
        layout.scrollDirection = .horizontal
      }
    } else {
      if isLandscape {
        layout.scrollDirection = .horizontal
      } else {
        layout.scrollDirection = .vertical
      }
    }
  }
  
}

// MARK: - UICollectionViewDataSource

extension MenuCollectionViewController {
  
  override public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dishes.count
  }
  
  override public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.reuseIdentifier, for: indexPath) as! MenuCell
    
    cell.dishNameLabel.text = dishes[indexPath.row].name
    cell.dishPriceLabel.text = String(dishes[indexPath.row].price)
    cell.dishImageView.image = dishes[indexPath.row].image
    
    return cell
  }
  
}

// MARK: - Cell Size Calculation

extension MenuCollectionViewController {
  
  var cellSize: CGSize {
    var width: CGFloat = 0
    var height: CGFloat = 0
    
    if isIPad {
      switch displayMode {
      case .grid:
        width = UIScreen.main.bounds.width/4 - (layout.sectionInset.left + layout.sectionInset.right)
      case .consistent:
        width = UIScreen.main.bounds.height - UIScreen.main.bounds.height/2.5
      }
    } else {
      if UIScreen.main.bounds.width < UIScreen.main.bounds.height {
        width = UIScreen.main.bounds.width - UIScreen.main.bounds.width/2.3
      } else {
        width = UIScreen.main.bounds.height - UIScreen.main.bounds.height/2.3
      }
    }
    
    height = width
    
    return CGSize(width: width, height: height)
  }
  
}

// MARK: - Helpers

extension MenuCollectionViewController {
  
  var isIPad: Bool {
    return UIDevice.current.userInterfaceIdiom == .pad
  }
  
  // TODO maybe need to consider faceUp or faceDown orientations
  var isLandscape: Bool {
    return UIDevice.current.orientation.isLandscape
  }
  
}
