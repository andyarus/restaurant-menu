//
//  MenuCell.swift
//  Menu
//
//  Created by Andrei Coder on 31/08/2019.
//  Copyright © 2019 Andrei Coder. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
  
  static let reuseIdentifier = "MenuCell"

  let dishNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 18)
    label.backgroundColor = UIColor.black.withAlphaComponent(0.8)
    label.textColor = .white
    label.textAlignment = .center
    label.numberOfLines = 0
    
    return label
  }()

  let dishPriceLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 18)
    label.backgroundColor = UIColor.black.withAlphaComponent(0.8)
    label.textColor = .white
    label.textAlignment = .center
    
    return label
  }()

  let dishImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    //imageView.contentMode = .scaleAspectFit
    
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubviews()
    setupConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func addSubviews() {
    addSubview(dishImageView)
    addSubview(dishNameLabel)
    addSubview(dishPriceLabel)
  }
  
  func setupConstraints() {
    self.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      dishNameLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 50),
      dishNameLabel.topAnchor.constraint(equalTo: self.topAnchor),
      dishNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      dishNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      
      dishImageView.topAnchor.constraint(equalTo: self.topAnchor),
      dishImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      dishImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      dishImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      
      dishPriceLabel.widthAnchor.constraint(equalToConstant: 70),
      dishPriceLabel.heightAnchor.constraint(equalToConstant: 30),
      dishPriceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
      dishPriceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
      ])
  }
  
}
