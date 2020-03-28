//
//  AppAnimation.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 16/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import UIKit

struct AppAnimation {
  let duration: TimeInterval
  let closure: (UIView) -> Void
}

extension AppAnimation {
  static func fadeIn(duration: TimeInterval = 0.4) -> AppAnimation {
    return AppAnimation(duration: duration, closure: { $0.alpha = 1 })
  }

  static func fadeOut(duration: TimeInterval = 0.4) -> AppAnimation {
    return AppAnimation(duration: duration, closure: { $0.alpha = 0 })
  }

  static func resize(to size: CGSize, duration: TimeInterval = 0.4) -> AppAnimation {
    return AppAnimation(duration: duration, closure: { $0.bounds.size = size })
  }

  static func scale(by size: CGFloat, duration: TimeInterval = 0.4) -> AppAnimation {
    return AppAnimation(duration: duration, closure: { $0.transform = CGAffineTransform(scaleX: size, y: size) })
  }

  static func rotate(duration: TimeInterval = 0.4) -> AppAnimation {
    return AppAnimation(duration: duration, closure: {
      let value = CGFloat((0...360).randomElement() ?? 0) * CGFloat(180 / Double.pi)
      $0.transform = CGAffineTransform(rotationAngle: value)
    })
  }

  static func scaleAndRotate(by size: CGFloat, duration: TimeInterval = 0.4) -> AppAnimation {
    return AppAnimation(duration: duration, closure: {
      let value = CGFloat((0...360).randomElement() ?? 0) * CGFloat(180 / Double.pi)
      $0.transform = CGAffineTransform(rotationAngle: value).scaledBy(x: size, y: size)
    })
  }
}
