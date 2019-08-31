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
    //label.font = UIFont.systemFont(ofSize: 14)
    //label.textColor = UIColor.darkGray
    
    //label.backgroundColor = .red
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  let dishPriceLabel: UILabel = {
    let label = UILabel()
    //label.font = UIFont.systemFont(ofSize: 14)
    //label.textColor = UIColor.darkGray
    
    //label.backgroundColor = .orange
    label.textAlignment = .right
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  let dishImageView: UIImageView = {
    let imageView = UIImageView()
    //imageView.backgroundColor = .yellow
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    
    backgroundColor = .red
    
    
    addSubviews()
    setupConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func addSubviews() {
    addSubview(dishNameLabel)
    addSubview(dishPriceLabel)
    addSubview(dishImageView)
  }
  
  func setupConstraints() {
    self.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      dishNameLabel.heightAnchor.constraint(equalToConstant: 30),
      dishNameLabel.topAnchor.constraint(equalTo: self.topAnchor),
      dishNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      dishNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      
      dishImageView.topAnchor.constraint(equalTo: dishNameLabel.bottomAnchor),
      dishImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      dishImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      
      dishPriceLabel.heightAnchor.constraint(equalToConstant: 30),
      dishPriceLabel.topAnchor.constraint(equalTo: dishImageView.bottomAnchor),
      dishPriceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      dishPriceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
      dishPriceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
      ])
  }
  
}
