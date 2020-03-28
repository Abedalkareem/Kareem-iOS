//
//  IntroViewModelsAssembly.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 22/03/2020.
//  Copyright © 2020 abedalkareem. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

class IntroViewModelsAssembly: Assembly {
  func assemble(container: Container) {
    container.autoregister(SplashViewModel.self, initializer: SplashViewModel.init)
  }
}
