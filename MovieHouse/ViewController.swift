//
//  ViewController.swift
//  MovieHouse
//
//  Created by Vladimir Fibe on 29.08.2022.
//

import UIKit

class ViewController: UIViewController {

  let label: UILabel = {
    $0.textAlignment = .center
    $0.textColor = .white
    $0.numberOfLines = 0
    $0.font = .systemFont(ofSize: 40)
    return $0
  }(UILabel())
  
  let descriptionLabel: UILabel = {
    $0.textAlignment = .center
    $0.textColor = .white
    $0.numberOfLines = 0
    $0.font = .systemFont(ofSize: 20)
    return $0
  }(UILabel())
  
  let imageView: UIImageView = {
    $0.heightAnchor.constraint(equalToConstant: 300).isActive = true
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
    return $0
  }(UIImageView())
  
  let scrollView = UIScrollView()
  
  lazy var stackView: UIStackView = {
    $0.axis = .vertical
    $0.spacing = 20
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIStackView(arrangedSubviews: [imageView, label, descriptionLabel]))
  
  var networkDataFetcher = NetworkDataFetcher()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    networkDataFetcher.fetchMovie(with: 10528) { movie in
      if let movie = movie {
        let backdropPath = movie.backdropPath ?? ""
        FileStorage.downloadImage(fileName: backdropPath) { image in
          self.imageView.image = image
        }
        self.label.text = movie.title
        self.descriptionLabel.text = movie.overview
      }
    }
    setupViews()
    setupConstraints()
  }
  
  override var prefersStatusBarHidden: Bool {
    true
  }
  
  func setupViews() {
    view.addSubview(scrollView)
    scrollView.frame = view.frame
    scrollView.addSubview(stackView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
      stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
      stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
    ])
  }
}

