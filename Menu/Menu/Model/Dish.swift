//
//  Dish.swift
//  Menu
//
//  Created by Andrei Coder on 28/08/2019.
//  Copyright © 2019 Andrei Coder. All rights reserved.
//

import Foundation

struct Dish {
  let name: String
  let price: Double
  let image: UIImage?
  
  init(name: String, price: Double, image: UIImage? = nil) {
    self.name = name
    self.price = price
    self.image = image
  }
}
