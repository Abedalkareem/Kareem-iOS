//
//  DotsView.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 02/01/2020.
//  Copyright © 2020 abedalkareem. All rights reserved.
//

import UIKit

class DotsView: UIView {

  // MARK: - Properties

  var isWithDropOffPoint = false

  // MARK: - Private properties

  var width: CGFloat {
    frame.size.width
  }
  var height: CGFloat {
    frame.size.height
  }

  private let secondCircleWidth = CGFloat(12)
  private let firstCircleWidth = CGFloat(10)
  private let firstCircleLineWidth = CGFloat(2)
  private let lineWidth = CGFloat(3)

  private var firstCircleLayer: CAShapeLayer!
  private var secondCircleLayer: CAShapeLayer!
  private var lineLayer: CAGradientLayer!

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
    backgroundColor = .clear

    firstCircleLayer = CAShapeLayer()
    layer.addSublayer(firstCircleLayer)
    secondCircleLayer = CAShapeLayer()
    layer.addSublayer(secondCircleLayer)
    lineLayer = CAGradientLayer()
    layer.addSublayer(lineLayer)
  }

  // MARK: - View lifecycle

  override func layoutSublayers(of layer: CALayer) {
    layoutFirstCircle()
    layoutSecondCircle()
    layoutLine()
  }

  func layoutFirstCircle() {
    let x = CGFloat(width / 2) - (firstCircleWidth / 2)
    let y = (height / (isWithDropOffPoint ? 4 : 2)) - (firstCircleWidth / 2)

    firstCircleLayer.frame = CGRect(x: x,
                                    y: y,
                                    width: firstCircleWidth,
                                    height: firstCircleWidth)
    let circlePath = UIBezierPath(roundedRect: firstCircleLayer.bounds,
                                  cornerRadius: firstCircleWidth)
    circlePath.close()

    firstCircleLayer.path = circlePath.cgPath
    firstCircleLayer.lineWidth = firstCircleLineWidth
    firstCircleLayer.fillColor = UIColor.white.cgColor
    firstCircleLayer.strokeColor = UIColor.secondary.cgColor
  }

  func layoutLine() {
    guard isWithDropOffPoint else {
      lineLayer.removeFromSuperlayer()
      return
    }

    if lineLayer.superlayer == nil {
      layer.addSublayer(lineLayer)
    }

    let x = CGFloat(width / 2) - (lineWidth / 2)
    let y = (firstCircleLayer.frame.origin.y + firstCircleWidth)

    let lineHeight = (height - y) -
                     (height - secondCircleLayer.frame.origin.y)
    lineLayer.frame = CGRect(x: x, y: y, width: lineWidth, height: lineHeight)

    lineLayer.colors = [UIColor.secondary.cgColor, UIColor.tertiary.cgColor]
  }

  func layoutSecondCircle() {
    guard isWithDropOffPoint else {
      secondCircleLayer.removeFromSuperlayer()
      return
    }

    if secondCircleLayer.superlayer == nil {
      layer.addSublayer(secondCircleLayer)
    }

    let x = CGFloat(width / 2) - (secondCircleWidth / 2)
    let y = (height / 1.35) - (secondCircleWidth / 2)

    secondCircleLayer.frame = CGRect(x: x,
                                     y: y,
                                     width: secondCircleWidth,
                                     height: secondCircleWidth)
    let circlePath = UIBezierPath(roundedRect: secondCircleLayer.bounds,
                                  cornerRadius: secondCircleWidth)
    circlePath.close()

    secondCircleLayer.path = circlePath.cgPath
    secondCircleLayer.fillColor = UIColor.tertiary.cgColor
  }

}
