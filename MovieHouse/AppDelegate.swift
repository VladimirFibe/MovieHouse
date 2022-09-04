//
//  AppDelegate.swift
//  MovieHouse
//
//  Created by Vladimir Fibe on 29.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
     
       
       let view = MenuViewController() //наш вьюконтраллер
      let navigationController = UINavigationController(rootViewController: view)
      
      let window = UIWindow(frame: UIScreen.main.bounds)
      window.rootViewController = navigationController
      window.backgroundColor = .black
      self.window = window
      window.makeKeyAndVisible()
      
      
   // let window = UIWindow(frame: UIScreen.main.bounds)
//    window.rootViewController = MenuViewController()
//    window.backgroundColor = .black
//    window.makeKeyAndVisible()
//    self.window = window
    return true
  }
}

