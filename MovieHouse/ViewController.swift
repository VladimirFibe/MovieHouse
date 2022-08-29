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
//    networkDataFetcher.fetchMovies(searchTerms: "Sherlok") { response in
//      if let response = response {
//        response.results.forEach {
//          print($0.title ?? "", $0.id ?? 0)
//        }
//      }
//    }
    networkDataFetcher.fetchMovie(with: 453816) { movie in
      if let movie = movie {
        print(movie.title ?? "", movie.id ?? 0)
      }
    }
  }
}

