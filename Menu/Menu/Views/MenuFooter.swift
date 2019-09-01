//
//  MenuFooter.swift
//  Menu
//
//  Created by Andrei Coder on 01/09/2019.
//  Copyright © 2019 Andrei Coder. All rights reserved.
//

import UIKit

class MenuFooter: UICollectionReusableView {
  
  static let reuseIdentifier = "MenuFooter"
  
  let spinner: UIActivityIndicatorView = {
    let spinner = UIActivityIndicatorView()
    spinner.translatesAutoresizingMaskIntoConstraints = false    
    spinner.style = .whiteLarge
    spinner.color = .gray
    
    return spinner
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
    addSubview(spinner)
    
    spinner.startAnimating()
  }
  
  func setupConstraints() {
    self.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor)
      ])
  }
  
}
