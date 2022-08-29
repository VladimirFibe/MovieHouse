//
//  ViewController.swift
//  MovieHouse
//
//  Created by Vladimir Fibe on 29.08.2022.
//

import UIKit

class ViewController: UIViewController {

  var networkService = NetworkService()
  override func viewDidLoad() {
    super.viewDidLoad()
    networkService.request(searchTerm: "woman") { _, _ in
      
    }
  }


}

