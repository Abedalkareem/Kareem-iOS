//
//  IntroServices.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 11/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import Foundation
import RxSwift

class IntroServices: ServicesType {

  private var fetcher: FetcherType

  init(fetcher: FetcherType) {
    self.fetcher = fetcher
  }

  func getConfig() -> Observable<Config> {
    return fetcher.fetch(endpoint: IntroEndPoints.config)
  }
}
