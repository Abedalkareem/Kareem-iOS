//
//  Config.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 11/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import Foundation

struct Config {
  var appStatus: AppStatus
  var message: String
}

extension Config: Decodable {
  enum CodingKeys: String, CodingKey {
    case appStatus = "app_status"
    case message
  }
}
