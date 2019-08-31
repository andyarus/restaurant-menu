//
//  AppDelegate.swift
//  app
//
//  Created by Andrei Coder on 27/08/2019.
//  Copyright © 2019 Andrei Coder. All rights reserved.
//

import UIKit
import Menu

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {    
    window = UIWindow(frame: UIScreen.main.bounds)

    let nc = UINavigationController(rootViewController: MenuCollectionViewController())


    //nc.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "grid"), style: .plain, target: self, action: nil)

    window?.rootViewController = nc
    //window?.rootViewController = UINavigationController(rootViewController: MenuCollectionViewController())
    window?.makeKeyAndVisible()
    
    return true    
  }
  
}

