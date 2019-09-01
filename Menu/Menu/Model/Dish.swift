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
  let image: UIImage
  
  init(name: String, price: Double, image: UIImage) {
    self.name = name
    self.price = price
    self.image = image
  }
  
  init?(dictionary: [String: String], in bundle: Bundle) {
    guard let name = dictionary["Name"],
      let priceString = dictionary["Price"], let price = Double(priceString),
      let imageName = dictionary["Image"], let image = UIImage(named: imageName, in: bundle, compatibleWith: nil) else {
        return nil
    }
    
    self.init(name: name, price: price, image: image)
  }
  
  static func allDishes(in bundle: Bundle) -> [Dish] {
    var dishes = [Dish]()
    guard let URL = bundle.url(forResource: "Dishes", withExtension: "plist"),
      let dishesFromPlist = NSArray(contentsOf: URL) as? [[String: String]] else {
        return dishes
    }
    for dictionary in dishesFromPlist {
      if let dish = Dish(dictionary: dictionary, in: bundle) {
        dishes.append(dish)
      }
    }
    
    return dishes
  }
  
  static func getMoreDishes(in bundle: Bundle) -> [Dish] {
    return allDishes(in: bundle)
  }
  
}
