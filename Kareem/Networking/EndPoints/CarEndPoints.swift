//
//  CarEndPoints.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 11/01/2020.
//  Copyright © 2020 abedalkareem. All rights reserved.
//

import Foundation

enum CarEndPoints: EndPoint {
  case cars(lat: Double, long: Double)

  var method: HTTPMethod {
    switch self {
    case .cars: return .get
    }
  }

  var path: String {
    switch self {
    case .cars: return "/cars.json"
    }
  }

  var parameters: Parameters {
    switch self {
    case let .cars(lat, long): return ["lat": lat, "long": long]
    }
  }

}
