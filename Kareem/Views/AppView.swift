//
//  AppView.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 10/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import UIKit

@IBDesignable
class AppView: UIView {

  // MARK: - Properties

  @IBInspectable var colorID: Int = 0 {
    didSet {
      setSelectedColor()
    }
  }

  private func setSelectedColor() {
    switch colorID {
    case 1:
      backgroundColor = .primary
    case 2:
      backgroundColor = .secondary
    case 3:
      backgroundColor = .tertiary
    default:
      break
    }
  }
}
