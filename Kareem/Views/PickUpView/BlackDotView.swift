//
//  BlackDotView.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 03/01/2020.
//  Copyright © 2020 abedalkareem. All rights reserved.
//

import UIKit

@IBDesignable
class BlackDotView: UIView {
  
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
    backgroundColor = .black
  }
  
  // MARK: - View lifecycle

  override func layoutSubviews() {
    super.layoutSubviews()
    makeCircular()
  }
  
}
