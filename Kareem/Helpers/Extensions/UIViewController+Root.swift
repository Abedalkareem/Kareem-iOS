//
//  UIViewController+Root.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 15/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import UIKit

extension UIViewController {

  private var keyWindow: UIWindow? {
    return UIApplication.shared.windows.filter { $0.isKeyWindow }.first
  }

  /// The root view controller for `keyWindow`.
  var rootViewController: UIViewController? {
    return keyWindow?.rootViewController
  }

  ///
  /// Use it to change the root view controller.
  /// - Parameter viewController: A view controller to set as a root.
  /// - Parameter animated: A bool value to determine either changing the view controller
  ///  should set as root with animation or not.
  ///
  func setRootViewController(viewController: UIViewController?, animated: Bool) {

    guard let window = keyWindow else {
      return
    }

    guard animated else {
      window.rootViewController = viewController
      return
    }

    UIView.transition(with: window,
                      duration: 0.3,
                      options: .transitionCrossDissolve,
                      animations: {
                        window.rootViewController = viewController
    },
                      completion: { _ in })
  }

}
