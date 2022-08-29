//
//  ViewController.swift
//  MovieHouse
//
//  Created by Vladimir Fibe on 29.08.2022.
//

import UIKit

class ViewController: UIViewController {

  var networkDataFetcher = NetworkDataFetcher()
  override func viewDidLoad() {
    super.viewDidLoad()
    networkDataFetcher.fetchImages(searchTerms: "Woman") { response in
      if let response = response {
        print(response)
      }
    }
  }
}

