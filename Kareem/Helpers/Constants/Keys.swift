//
//  Keys.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 10/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import Foundation

enum Keys {
  ///
  /// GMS Services key as `[UInt8]`.
  ///
  #warning("Add your key")
  static let gmsServices: [UInt8] = []

  ///
  /// GMS Places client key as `[UInt8]`.
  ///
  static var gmsPlacesClient: [UInt8] {
    return gmsServices
  }
}
