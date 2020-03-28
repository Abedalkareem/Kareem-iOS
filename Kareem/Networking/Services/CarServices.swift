//
//  CarServices.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 11/01/2020.
//  Copyright © 2020 abedalkareem. All rights reserved.
//

import Foundation
import RxSwift

class CarServices: ServicesType {

  private var fetcher: FetcherType

  init(fetcher: FetcherType) {
    self.fetcher = fetcher
  }

  func getCarsWith(lat: Double, long: Double) -> Observable<[Car]> {
    return fetcher.fetchArray(endpoint: CarEndPoints.cars(lat: lat, long: long))
  }
}
