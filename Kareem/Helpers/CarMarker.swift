//
//  CarMarker.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 17/01/2020.
//  Copyright © 2020 abedalkareem. All rights reserved.
//

import GoogleMaps

class CarMarker: GMSMarker {

  var id: Int!

  override var hash: Int {
    var hasher = Hasher()
    hasher.combine(id)
    return hasher.finalize()
  }

  static func == (lhs: CarMarker, rhs: CarMarker) -> Bool {
    lhs.id == rhs.id
  }
}
