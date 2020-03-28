//
//  Injected.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 11/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import Foundation
import Swinject

@propertyWrapper
struct Injected<Value> {

  init() {
    self.wrappedValue = Assembler.shared.resolver.resolve(Value.self)!
  }

  var wrappedValue: Value
}
