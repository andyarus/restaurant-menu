//
//  MenuCollectionViewController.swift
//  Menu
//
//  Created by Andrei Coder on 31/08/2019.
//  Copyright © 2019 Andrei Coder. All rights reserved.
//

import UIKit

public class MenuCollectionViewController: UICollectionViewController {
  
  let bundle = Bundle(for: MenuCollectionViewController.self)
  
  var displayMode: DisplayMode = .consistent
  
  var dishes: [Dish] = []
  
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
  
  override public func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
      layout.itemSize = cellSize
      layout.footerReferenceSize = CGSize(width: layout.itemSize.width, height: layout.itemSize.height)
    
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
  
  func setupUI() {
    collectionView.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.reuseIdentifier)
    collectionView.register(MenuFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MenuFooter.reuseIdentifier)
    
    collectionView.backgroundColor = .white
    
    if isIPad {
      navigationItem.rightBarButtonItem = UIBarButtonItem(image: displayMode.image(in: bundle), style: .plain, target: self, action: #selector(changeDisplayMode))
      
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
    layout.footerReferenceSize = CGSize(width: layout.itemSize.width, height: layout.itemSize.height)
  }
  
  func loadData() {
    dishes = Dish.allDishes(in: bundle)
  }
  
  @objc
  public func changeDisplayMode() {
    switch displayMode {
    case .grid:
      displayMode = .consistent
    case .consistent:
      displayMode = .grid
    }
    
    navigationItem.rightBarButtonItem?.image = displayMode.image(in: bundle)
    
    layout.itemSize = cellSize
    layout.footerReferenceSize = CGSize(width: layout.itemSize.width, height: layout.itemSize.height)
    
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
    
    if indexPath.row >= dishes.count - 1 {
      // simulate refresh control
      if layout.footerReferenceSize == .zero {
        layout.footerReferenceSize = CGSize(width: layout.itemSize.width, height: layout.itemSize.height)
      }
      
      // simulate data request delay (pagination)
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        var dishes = Dish.getMoreDishes(in: self.bundle)
        
        if self.dishes.count > 1000 { dishes = [] } // При этом само меню должно показывать около 1000 блюд
        
        if !dishes.isEmpty {
          self.dishes.append(contentsOf: dishes)
          collectionView.reloadData()
        } else {
          self.layout.footerReferenceSize = .zero
        }
      }
    }
    
    let idx = indexPath.row < dishes.count ? indexPath.row : 0
    
    cell.dishNameLabel.text = dishes[idx].name
    cell.dishPriceLabel.text = "\(String(dishes[idx].price)) $"
    cell.dishImageView.image = dishes[idx].image
    
    return cell
  }
  
}

// MARK: - Section Footer

extension MenuCollectionViewController {
  
  override public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    if kind == UICollectionView.elementKindSectionFooter {
      let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MenuFooter.reuseIdentifier, for: indexPath)
      return footer
    }
    
    return UICollectionReusableView()
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
