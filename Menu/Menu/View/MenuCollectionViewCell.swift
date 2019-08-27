//
//  MenuCollectionViewCell.swift
//  Menu
//
//  Created by Andrei Coder on 27/08/2019.
//  Copyright © 2019 Andrei Coder. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var dishNameLabel: UILabel!
  @IBOutlet weak var dishPriceLabel: UILabel!
  @IBOutlet weak var dishImageView: UIImageView!
  
  override func awakeFromNib() {
      super.awakeFromNib()
  }

}
