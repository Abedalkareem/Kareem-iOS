//
//  DPLocationView.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 02/01/2020.
//  Copyright © 2020 abedalkareem. All rights reserved.
//

import UIKit

@IBDesignable
class DPLocationView: UIView {

  // MARK: - Properties

  var pickUpLocation: Address? {
    didSet {
      updatePickUpLocations()
    }
  }

  var dropOffLocation: Address? {
    didSet {
      if dropOffLocation == nil {
        removeDropOffLocation()
      } else {
        updateDropOffLocations()
      }
    }
  }

  // MARK: - Private properties

  private var stackView: UIStackView!
  private var pickUpLocationView: LocationView!
  private var dropOffLocationView: LocationView?
  private var dotsView: DotsView!

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
    stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.distribution = .fill
    addSubview(stackView)

    pickUpLocationView = LocationView()
    stackView.addArrangedSubview(pickUpLocationView)

    dotsView = DotsView()
    addSubview(dotsView)

    makeConstraints()
  }

  private func makeConstraints() {

    let dotsViewWidth = CGFloat(40)
    let trailingMargen = CGFloat(-16)

    dotsView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      dotsView.leadingAnchor.constraint(equalTo: leadingAnchor),
      dotsView.trailingAnchor.constraint(equalTo: stackView.leadingAnchor),
      dotsView.topAnchor.constraint(equalTo: topAnchor),
      dotsView.bottomAnchor.constraint(equalTo: bottomAnchor),
      dotsView.widthAnchor.constraint(equalToConstant: dotsViewWidth)
    ])

    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trailingMargen),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }

  // MARK: - View lifecycle

  override func layoutSubviews() {
    super.layoutSubviews()
    roundedCorner()
    addShadow()
  }

  // MARK: - Private

  private func updatePickUpLocations() {
    let noLocationText = Constants.strings.noLocation
    pickUpLocationView.location = pickUpLocation?.lines ?? noLocationText
    pickUpLocationView.subLocation = pickUpLocation?.subLocality ?? noLocationText
  }

  private func updateDropOffLocations() {
    dotsView.isWithDropOffPoint = true

    if dropOffLocationView == nil {
      dropOffLocationView = LocationView()
      stackView.addArrangedSubview(dropOffLocationView!)
    }

    let noLocationText = Constants.strings.noLocation
    dropOffLocationView?.location = dropOffLocation?.lines ?? noLocationText
    dropOffLocationView?.subLocation = dropOffLocation?.subLocality ?? noLocationText
  }

  private func removeDropOffLocation() {
    dropOffLocationView?.removeFromSuperview()
    dropOffLocationView = nil
  }

}
