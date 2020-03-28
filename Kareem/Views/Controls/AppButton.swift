//
//  AppButton.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 16/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import UIKit

@IBDesignable
class AppButton: UIButton {

  // MARK: - Properties

  @IBInspectable var isMainButton: Bool = false {
    didSet {
      if isMainButton {
        type = .main
      }
    }
  }

  @IBInspectable var isSecondaryButton: Bool = false {
    didSet {
      if isSecondaryButton {
        type = .secondary
      }
    }
  }

  @IBInspectable var isPlainButton: Bool = false {
    didSet {
      if isPlainButton {
        type = .plain
      }
    }
  }

  @IBInspectable var isWhiteButton: Bool = false {
    didSet {
      if isWhiteButton {
        type = .white
      }
    }
  }

  @IBInspectable var localizeKey: String = "" {
    didSet {
      setTitle(localizeKey.localize, for: .normal)
    }
  }

  // MARK: - Private properties

  private var type: Type = .plain {
    didSet {
      setup()
    }
  }

  // MARK: - init

  override init(frame: CGRect) {
    super.init(frame: frame)
    xx()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    xx()
  }

  func xx() {
    heightAnchor.constraint(equalToConstant: 50).isActive = true
  }

  // MARK: -

  private func setup() {
    var backgroundColor: UIColor!
    var textColor: UIColor!
    var font: UIFont!
    switch type {
    case .main:
      backgroundColor = .primary
      textColor = .textOverPrimary
      font = .title4
    case .secondary:
      backgroundColor = .secondary
      textColor = .textOverSecondary
      font = .title4
    case .white:
      backgroundColor = .white
      textColor = .primary
      font = .title4
    case .plain:
      backgroundColor = .clear
      textColor = .white
      font = .subBody4
      break
    }

    self.setTitleColor(textColor, for: .normal)
    self.backgroundColor = backgroundColor
    self.titleLabel?.font = font
  }

  override func draw(_ rect: CGRect) {
    if type != .plain {
      roundedCorner(radius: frame.height/2)
    }
  }

  private func makeRoundWith(color: UIColor) {
    backgroundColor = color
  }

  // MARK: - Enum

  enum `Type` {
    case main
    case secondary
    case white
    case plain
  }

}


