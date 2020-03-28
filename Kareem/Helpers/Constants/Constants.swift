//
//  Constants.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 10/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import Foundation

enum Constants {
  
  enum urls {
    #warning("Add your host")
    static let host = ""
    static let scheme = "https"
    static let git = "https://github.com/Abedalkareem/Kareem-iOS"
  }
  
  enum errors {
    static var nilData = NSError(domain: "", code: -20, userInfo: ["": ""])
    static var jsonSerializingFailure = NSError(domain: "", code: -20, userInfo: ["": ""])
  }
  
  enum strings {
    static let key = "$$amato3a"
    static let noLocation = "---- ---- ----"
  }
  
  enum ints {
    static let delayToShowMarker = 100
    static let delayToCallGEOCoder = 100
  }
  
}
