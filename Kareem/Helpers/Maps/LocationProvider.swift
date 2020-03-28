//
//  LocationProvider.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 09/01/2020.
//  Copyright © 2020 abedalkareem. All rights reserved.
//

import CoreLocation
import RxSwift

protocol LocationProvider {

  var currentUserLocation: Observable<CLLocation?> { get }

  func requestAuthorization()
  func startUpdating()
  func getAddressFrom(coordinate: CLLocationCoordinate2D) -> Observable<Address>
}
