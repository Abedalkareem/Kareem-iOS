//
//  ServicesAssembly.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 22/03/2020.
//  Copyright © 2020 abedalkareem. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

class ServicesAssembly: Assembly {
  func assemble(container: Container) {
    container.autoregister(IntroServices.self, initializer: IntroServices.init)
    container.autoregister(CarServices.self, initializer: CarServices.init)
  }
}
