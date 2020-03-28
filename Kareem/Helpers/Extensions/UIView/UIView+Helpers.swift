//
//  UIView+Helpers.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 17/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import UIKit

extension UIView {

  ///
  /// Make the view circular.
  ///
  func makeCircular() {
    layer.cornerRadius = bounds.size.width / 2
    layer.masksToBounds = true
  }

  ///
  /// Round the edges of the view with `radius`.
  ///
  func roundedCorner(radius: CGFloat = 10) {
    layer.cornerRadius = radius
    layer.masksToBounds = true
  }

  ///
  /// Add a border to the view.
  /// - Parameter color: The color of the border, the default is white.
  /// - Parameter width: The width of the border, the default is `2`.
  ///
  func addBorder(color: UIColor = .white, width: CGFloat = 2) {
    layer.borderColor = color.cgColor
    layer.borderWidth = width
  }

  ///
  /// Add a shadow to the view.
  ///
  func addShadow() {
    layer.cornerRadius = 10
    let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 11)
    layer.masksToBounds = false
    layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
    layer.shadowOffset = CGSize(width: 0, height: 0)
    layer.shadowOpacity = 0.3
    layer.shadowPath = shadowPath.cgPath
  }

}
