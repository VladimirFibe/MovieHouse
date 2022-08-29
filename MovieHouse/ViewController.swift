//
//  ViewController.swift
//  MovieHouse
//
//  Created by Vladimir Fibe on 29.08.2022.
//

import UIKit

class ViewController: UIViewController {

  let label: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.numberOfLines = 0
    $0.font = .systemFont(ofSize: 40)
    $0.text = "Where does it come from?\n\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\n\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham."
    return $0
  }(UILabel())
  
  let orangeView: UIView = {
    $0.backgroundColor = .systemOrange
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIView())
  let scrollView = UIScrollView()
  lazy var stackView: UIStackView = {
    $0.axis = .vertical
    $0.spacing = 20
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIStackView(arrangedSubviews: [label]))
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
    setupViews()
    setupConstraints()
  }
  func setupViews() {
    view.addSubview(scrollView)
    scrollView.frame = view.frame
    scrollView.addSubview(orangeView)
    orangeView.addSubview(stackView)
  }
  func setupConstraints() {
    NSLayoutConstraint.activate([
      orangeView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
      orangeView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
      orangeView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
      orangeView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
      orangeView.widthAnchor.constraint(equalTo: view.widthAnchor),
      stackView.topAnchor.constraint(equalTo: orangeView.topAnchor),
      stackView.leadingAnchor.constraint(equalTo: orangeView.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: orangeView.trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: orangeView.bottomAnchor)
    ])
  }
}

