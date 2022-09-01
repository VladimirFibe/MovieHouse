//
//  MenuCell.swift
//  MovieHouse
//
//  Created by mac on 01.09.2022.
//

import UIKit


import Foundation
import UIKit

protocol SelfConfiguringCell{
    static var reuseId: String { get }
    func configure(with intValue: Int)
}

class MenuCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "MenuCell"
    
    let friendImageView = UIImageView()
    
    let label = UILabel()
    
    let labelData = UILabel()
    
    let stack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
        
        self.layer.cornerRadius = 6
        self.clipsToBounds = true
    }
    
    func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        friendImageView.image = #imageLiteral(resourceName: "image")
        addSubview(friendImageView)
        friendImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        friendImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        friendImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        friendImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        friendImageView.layer.cornerRadius = 8
        friendImageView.clipsToBounds = true
        
        
        
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        stack.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Прив"
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        stack.addArrangedSubview(label)

        labelData.translatesAutoresizingMaskIntoConstraints = false
        labelData.text = "01.09.2020"
        labelData.font = UIFont.systemFont(ofSize: 13.00)
        stack.addArrangedSubview(labelData)

        
    }
    
    func configure(with intValue: Int) {
        print("123")
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

