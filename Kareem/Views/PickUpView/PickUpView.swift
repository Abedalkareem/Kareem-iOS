//
//  PickUpView.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 21/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import UIKit

@IBDesignable
class PickUpView: UIView {

  // MARK: - Properties

  var isMoving = false {
    didSet {
      pinView.isHidden = isMoving
      blackDotView.isHidden = !isMoving
    }
  }

  var time: String? {
    set {
      pinView.time = newValue
    }
    get {
      pinView.time
    }
  }

  // MARK: - Private properties

  private var pinView: PinView!
  private var blackDotView: BlackDotView!
  private var isWithTime = true

  // MARK: - init

  init(frame: CGRect, isWithTime: Bool = true) {
    super.init(frame: frame)
    self.isWithTime = isWithTime
    setup()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }

  private func setup() {
    backgroundColor = .clear

    pinView = PinView(frame: bounds, isWithTime: isWithTime)
    pinView.isHidden = true
    addSubview(pinView)

    blackDotView = BlackDotView(frame: bounds)
    addSubview(blackDotView)

    makeConstraints()
  }

  private func makeConstraints() {

    pinView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      pinView.leadingAnchor.constraint(equalTo: leadingAnchor),
      pinView.trailingAnchor.constraint(equalTo: trailingAnchor),
      pinView.topAnchor.constraint(equalTo: topAnchor),
      pinView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])

    blackDotView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      blackDotView.centerXAnchor.constraint(equalTo: centerXAnchor),
      blackDotView.widthAnchor.constraint(equalToConstant: 15),
      blackDotView.heightAnchor.constraint(equalToConstant: 15),
      blackDotView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
