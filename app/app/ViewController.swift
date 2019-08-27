//
//  ViewController.swift
//  app
//
//  Created by Andrei Coder on 27/08/2019.
//  Copyright © 2019 Andrei Coder. All rights reserved.
//

import UIKit
import Menu

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loadUI()
  }
  
  func loadUI() {
    let vc = MenuViewController()
    vc.view.frame = view.bounds
    self.addChild(vc)
    view.addSubview(vc.view)
    vc.didMove(toParent: self)
  }
  
}
