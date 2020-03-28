//
//  UIApplication+RX.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 10/01/2020.
//  Copyright © 2020 abedalkareem. All rights reserved.
//

import RxSwift

extension RxSwift.Reactive where Base: UIApplication {

  var applicationDidBecomeActive: Observable<Void> {
    return NotificationCenter.default.rx
      .notification(UIApplication.didBecomeActiveNotification)
      .map { _ in () }
  }

}
