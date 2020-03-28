//
//  SelectedCarTypeView.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 10/01/2020.
//  Copyright © 2020 abedalkareem. All rights reserved.
//

import UIKit

class SelectedCarTypeView: UIControl {
  
  // MARK: - Properties

  var car: CarType!
  
  // MARK: - Private properties
  
  private var carImageView: UIImageView!
  private var nameLabel: AppLabel!
  private var arrowImageView: UIImageView!

  // MARK: - init
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {

    backgroundColor = .white
    addShadow()
    
    carImageView = UIImageView()
    carImageView.image = UIImage(named: "car_right",
                                 in: Bundle(for: type(of: self)),
                                 compatibleWith: nil)
    carImageView.contentMode = .scaleAspectFit
    addSubview(carImageView)
    
    nameLabel = AppLabel()
    nameLabel.text = "Taxi"
    addSubview(nameLabel)

    arrowImageView = UIImageView()
    arrowImageView.image = UIImage(named: "down_arrow",
                                   in: Bundle(for: type(of: self)),
                                   compatibleWith: nil)
    arrowImageView.tintColor = .primary
    addSubview(arrowImageView)
    
    makeConstraints()
  }
  
  private func makeConstraints() {

    let carImageWidth: CGFloat = 30
    let arrawSize: CGFloat = 8
    let leftAndRightMargens: CGFloat = 16
    let nameAndImageMargen: CGFloat = 16

    carImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      carImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leftAndRightMargens),
      carImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
      carImageView.widthAnchor.constraint(equalToConstant: carImageWidth),
      carImageView.topAnchor.constraint(equalTo: topAnchor),
      carImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])

    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      nameLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor,
                                         constant: nameAndImageMargen),
      nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])

    arrowImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      arrowImageView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
      arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                               constant: -leftAndRightMargens),
      arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
      arrowImageView.widthAnchor.constraint(equalToConstant: arrawSize),
      arrowImageView.heightAnchor.constraint(equalToConstant: arrawSize)
    ])
  }
  
}

protocol CarType {
  var image: UIImage { get }
  var name: String { get }
}
