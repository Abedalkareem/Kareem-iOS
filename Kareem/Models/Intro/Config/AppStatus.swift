//
//  AppStatus.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 12/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import Foundation

enum AppStatus: String {
  case none
  case newUpdate = "new_update"
}

extension AppStatus: Decodable { }
