//
//  IntroEndPoints.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 11/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import Foundation

enum IntroEndPoints: EndPoint {
  case config

  var method: HTTPMethod {
    switch self {
    case .config: return .get
    }
  }

  var path: String {
    switch self {
    case .config: return "/config.json"
    }
  }

  var parameters: Parameters {
    switch self {
    case .config: return [:]
    }
  }

}
