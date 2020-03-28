//
//  CarViewModel.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 11/01/2020.
//  Copyright © 2020 abedalkareem. All rights reserved.
//

import Foundation
import CoreLocation

struct CarViewModel {
  let id: Int
  let name: String
  let location: CLLocationCoordinate2D

  init(_ car: Car) {
    id = car.id
    name = car.name
    location = CLLocationCoordinate2D(latitude: car.latitude,
                                      longitude: car.longitude)
  }
}

extension CarViewModel: Hashable {
  static func == (lhs: CarViewModel, rhs: CarViewModel) -> Bool {
    lhs.id == rhs.id
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}
