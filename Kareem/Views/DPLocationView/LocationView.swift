//
//  LocationView.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 02/01/2020.
//  Copyright © 2020 abedalkareem. All rights reserved.
//

import UIKit

class LocationView: UIView {

  // MARK: - Properties

  var location: String? {
    set {
      locationLabel.text = newValue
    }
    get {
      locationLabel.text
    }
  }

  var subLocation: String? {
    set {
      subLocationLabel.text = newValue
    }
    get {
      subLocationLabel.text
    }
  }

  // MARK: - Private properties

  private var locationLabel: AppLabel!
  private var subLocationLabel: AppLabel!

  // MARK: - init

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }

  private func setup() {

    locationLabel = AppLabel()
    locationLabel.font = .body5
    locationLabel.textColor = .black
    locationLabel.minimumScaleFactor  = 0.5
    locationLabel.adjustsFontSizeToFitWidth = true
    locationLabel.text = "--- ----"
    addSubview(locationLabel)

    subLocationLabel = AppLabel()
    subLocationLabel.font = .subBody6
    subLocationLabel.textColor = .gray
    subLocationLabel.text = "--- ----"
    addSubview(subLocationLabel)

    makeConstraints()
  }

  private func makeConstraints() {

    let topSpacing = CGFloat(8)
    let bottomSpacing = CGFloat(-8)
    
    locationLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
      locationLabel.topAnchor.constraint(equalTo: topAnchor, constant: topSpacing),
      locationLabel.bottomAnchor.constraint(equalTo: subLocationLabel.topAnchor),
    ])

    subLocationLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      subLocationLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
      subLocationLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      subLocationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottomSpacing),
    ])
  }

}
