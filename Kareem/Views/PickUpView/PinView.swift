//
//  PinView.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 03/01/2020.
//  Copyright © 2020 abedalkareem. All rights reserved.
//

import UIKit

@IBDesignable
class PinView: UIView {
  
  // MARK: - Properties
  
  var time: String? {
    didSet {
      timeLayer?.string = time
    }
  }
  
  // MARK: - Private properties
  
  private let bigCircleLineWidth = CGFloat(3)
  private var bigCircleWidth: CGFloat {
    frame.height * 0.5
  }
  
  private let smallCircleLineWidth = CGFloat(3)
  private var smallCircleWidth: CGFloat {
    frame.height * 0.09
  }
  
  private let lineWidth = CGFloat(3)
  private var lineHeight: CGFloat {
    frame.height * 0.2
  }

  private var isWithTime = true

  private var color: CGColor {
    (isWithTime ? UIColor.secondary : UIColor.tertiary).cgColor
  }
  
  private var timeLayer: CATextLayer?
  private var minsLayer: CATextLayer?
  
  private var bigCircleLayer: CAShapeLayer!
  private var smallCircleLayer: CAShapeLayer!
  private var lineLayer: CAShapeLayer!
  
  // MARK: - init
  
  init(frame: CGRect, isWithTime: Bool = true) {
    super.init(frame: frame)
    self.isWithTime = isWithTime
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    backgroundColor = .clear
    
    lineLayer = CAShapeLayer()
    layer.addSublayer(lineLayer)
    bigCircleLayer = CAShapeLayer()
    layer.addSublayer(bigCircleLayer)
    smallCircleLayer = CAShapeLayer()
    layer.addSublayer(smallCircleLayer)

    guard isWithTime else {
      return
    }

    timeLayer = CATextLayer()
    timeLayer!.font = UIFont.title3.cgFont
    timeLayer!.fontSize = UIFont.title3.pointSize
    timeLayer!.alignmentMode = .center
    timeLayer!.foregroundColor = UIColor.primary.cgColor
    timeLayer!.contentsScale = UIScreen.main.scale
    timeLayer!.string = "5"
    layer.addSublayer(timeLayer!)
    
    minsLayer = CATextLayer()
    minsLayer!.font = UIFont.subBody7.cgFont
    minsLayer!.fontSize = UIFont.subBody7.pointSize
    minsLayer!.alignmentMode = .center
    minsLayer!.foregroundColor = UIColor.primary.cgColor
    minsLayer!.contentsScale = UIScreen.main.scale
    minsLayer!.string = "pin_view_time_unit".localize
    layer.addSublayer(minsLayer!)
    
  }
  
  // MARK: - View lifecycle
  
  override func layoutSublayers(of layer: CALayer) {
    layoutBigCircle()
    layoutLine()
    layoutSmallCircle()
    layoutTime()
    layoutMins()
  }
  
  private func layoutTime() {
    guard isWithTime else {
      return
    }
    let width = frame.size.width
    let height = frame.size.height
    let topMargen = CGFloat(8)
    let x = CGFloat(width / 2) - (bigCircleWidth / 2)
    let y = ((height / 2) - (bigCircleWidth / 2)) + topMargen
    timeLayer!.frame = CGRect(x: x,
                             y: y,
                             width: bigCircleWidth,
                             height: 20)
  }
  
  private func layoutMins() {
    guard isWithTime else {
      return
    }
    let width = frame.size.width
    let topMargen = CGFloat(2)
    let x = CGFloat(width / 2) - (bigCircleWidth / 2)
    let y = (timeLayer!.frame.origin.y + timeLayer!.frame.height) + topMargen
    minsLayer!.frame = CGRect(x: x,
                             y: y,
                             width: bigCircleWidth,
                             height: 20)
  }
  
  
  private func layoutBigCircle() {
    let width = frame.size.width
    let height = frame.size.height
    let x = CGFloat(width / 2) - (bigCircleWidth / 2)
    let y = (height / 2) - (bigCircleWidth / 2)

    bigCircleLayer.frame = CGRect(x: x,
                                  y: y,
                                  width: bigCircleWidth,
                                  height: bigCircleWidth)
    
    let circlePath = UIBezierPath(roundedRect: CGRect(x: 0,
                                                      y: 0,
                                                      width: bigCircleWidth,
                                                      height: bigCircleWidth),
                                  cornerRadius: bigCircleWidth)
    circlePath.close()
    
    bigCircleLayer.path = circlePath.cgPath
    bigCircleLayer.lineWidth = bigCircleLineWidth
    bigCircleLayer.fillColor = isWithTime ? UIColor.white.cgColor : color
    bigCircleLayer.strokeColor = color
  }
  
  private func layoutLine() {
    let width = frame.size.width
    let height = frame.size.height
    let x = CGFloat(width / 2) - (lineWidth / 2)
    let y = (height / 2) + (bigCircleWidth / 2)
    
    let linePath = UIBezierPath(rect: CGRect(x: x,
                                             y: y,
                                             width: lineWidth,
                                             height: lineHeight))
    linePath.close()
    
    lineLayer.lineWidth = lineWidth
    lineLayer.path = linePath.cgPath
    lineLayer.fillColor = color
  }
  
  private func layoutSmallCircle() {
    let width = frame.size.width
    let height = frame.size.height
    let x = CGFloat(width / 2) - (smallCircleWidth / 2)
    let y = (height / 2) + ((bigCircleWidth + lineHeight) / 2)
    
    let circlePath = UIBezierPath(roundedRect: CGRect(x: x,
                                                      y: y,
                                                      width: smallCircleWidth,
                                                      height: smallCircleWidth),
                                  cornerRadius: smallCircleWidth)
    circlePath.close()
    
    smallCircleLayer.path = circlePath.cgPath
    smallCircleLayer.lineWidth = smallCircleLineWidth
    smallCircleLayer.fillColor = isWithTime ? UIColor.white.cgColor : color
    smallCircleLayer.strokeColor = color
  }
  
}
