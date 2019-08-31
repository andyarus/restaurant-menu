//
//  DisplayMode.swift
//  Menu
//
//  Created by Andrei Coder on 30/08/2019.
//  Copyright © 2019 Andrei Coder. All rights reserved.
//

import Foundation

enum DisplayMode {
  case grid
  case consistent
  
  func image() -> UIImage? {
    let bundle = Bundle(for: MenuCollectionViewController.self)
    switch self {
    case .grid:
      return UIImage(named: "consistent", in: bundle, compatibleWith: nil)
    case .consistent:
      return UIImage(named: "grid", in: bundle, compatibleWith: nil)
    }
  }
}
