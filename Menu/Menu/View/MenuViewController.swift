//
//  MenuViewController.swift
//  Menu
//
//  Created by Andrei Coder on 27/08/2019.
//  Copyright © 2019 Andrei Coder. All rights reserved.
//

import UIKit

public class MenuViewController: UIViewController {
  
  // MARK: - Properties
  
  lazy var menuCollectionViewController: MenuCollectionViewController = {
    return MenuCollectionViewController()
  }()
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var menuCollectionView: UICollectionView!
  
  // MARK: - Init
  
  public init() {
    super.init(nibName: "MenuViewController", bundle: Bundle(for: MenuViewController.self))
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  // MARK: - Override Methods
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    
    setupCollectionView()
  }
  
  // MARK: - Setup Methods
  
  func setupCollectionView() {
    menuCollectionView.register(UINib(nibName: "MenuCollectionViewCell", bundle: Bundle(for: MenuCollectionViewCell.self)), forCellWithReuseIdentifier: menuCollectionViewController.reuseIdentifier)
    
    menuCollectionView.delegate = menuCollectionViewController
    menuCollectionView.dataSource = menuCollectionViewController
  }
  
}
